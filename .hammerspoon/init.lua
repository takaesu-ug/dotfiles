-- KarabinerからHammerspoonへ - すぎゃーんメモ
-- http://memo.sugyan.com/entry/2017/05/09/223704
local function keyStroke(mods, key)
    return function() hs.eventtap.keyStroke(mods, key, 0) end
end

local function remap(mods, key, fn)
    return hs.hotkey.bind(mods, key, fn, nil, fn)
end

-- global
-- remap({'ctrl'}, 'h', keyStroke({}, 'delete'))
-- remap({'ctrl'}, '[', keyStroke({}, 'escape'))
-- remap({'ctrl'}, 'j', keyStroke({}, 'return'))
-- remap({'ctrl', 'cmd'}, 'j', keyStroke({'cmd'}, 'return'))
remap({'cmd', 'shift', 'ctrl'}, 'r', function() hs.reload() end)

-- disable when a specific application is active
local remapKeys = {
    remap({'ctrl'}, 'b', keyStroke({}, 'left')),
    remap({'ctrl'}, 'f', keyStroke({}, 'right')),
    remap({'ctrl'}, 'n', keyStroke({}, 'down')),
    remap({'ctrl'}, 'p', keyStroke({}, 'up')),
}

local function handleGlobalHotKeyEvent(name, event, app)
    if event == hs.application.watcher.activated then
        if name == 'iTerm2' then
            for i, key in ipairs(remapKeys) do
                key:disable()
            end
        else
            for i, key in ipairs(remapKeys) do
                key:enable()
            end
        end
    end
end

hs.application.watcher.new(handleGlobalHotKeyEvent):start()

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

cmdeventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged }, handleCmdEvent)
cmdeventtap:start()

------

hs.alert.show("Hammerspoon Config Loaded")
