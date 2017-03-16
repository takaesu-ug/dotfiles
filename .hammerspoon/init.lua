-- キーリマップ設定
--   Karabiner 使えない対策: Hammerspoon で macOS の修飾キーつきホットキーのキーリマップを実現する
--     http://qiita.com/naoya@github/items/81027083aeb70b309c14
--     https://github.com/naoya/hammerspoon-init/blob/master/init.lua
local function remapKey(modifiers, key, keyCode)
    hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function keyCode(key, modifiers)
    modifiers = modifiers or {}
    return function()
        hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
        hs.timer.usleep(1000)
        hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
    end
end

local function disableAllHotkeys()
    for k, v in pairs(hs.hotkey.getHotkeys()) do
        v['_hk']:disable()
    end
end

local function enableAllHotkeys()
    for k, v in pairs(hs.hotkey.getHotkeys()) do
        v['_hk']:enable()
    end
end

local function handleGlobalAppEvent(name, event, app)
    if event == hs.application.watcher.activated then
        -- hs.alert.show(name)
        if name == "iTerm2" or name == "Quiver" then
            disableAllHotkeys()
        else
            enableAllHotkeys()
        end
    end
end

local appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

-- カーソル移動
remapKey({'ctrl'}, 'l', keyCode('right'))
remapKey({'ctrl'}, 'h', keyCode('left'))
remapKey({'ctrl'}, 'j', keyCode('down'))
remapKey({'ctrl'}, 'k', keyCode('up'))

-------------------------

-- CmdKeyのIME変換
-- macOS SierraにアップデートしてHammerspoonでCommandキーにかなと英数を割り当てた | mizoguche.info
-- http://mizoguche.info/2017/01/hammerspoon_for_sierra/
local prevKeyCode
local function handleCmdEvent(e)
    local leftCmd = 0x37  -- 55
    local rightCmd = 0x36 -- 54
    local alnum = 0x66
    local kana = 0x68
    local key = e:getKeyCode()
    local isCmdKeyUp = not(e:getFlags()['cmd']) and e:getType() == hs.eventtap.event.types.flagsChanged

    -- hs.alert.show(e:getType())
    -- hs.alert.show(key)
    -- hs.alert.show(isCmdKeyUp)

    if isCmdKeyUp then
        if prevKeyCode == leftCmd then
            hs.eventtap.keyStroke({}, alnum)
        elseif prevKeyCode == rightCmd then
            hs.eventtap.keyStroke({}, kana)
        end
    end

    prevKeyCode = key
end

cmdeventtap = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged}, handleCmdEvent)
cmdeventtap:start()
