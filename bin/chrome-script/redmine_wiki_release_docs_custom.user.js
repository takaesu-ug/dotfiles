// ==UserScript==
// @name        Redmine Wiki Release Document Custom
// @namespace   http://blog.takapra.com
// @description Wiki のリリース手順書の中のリビジョンを抽出する
// @include     https://project.takapra.com/redmine/projects/*/wiki/Release*
// @exclude     https://project.takapra.com/redmine/projects/*/wiki/Release
// ==/UserScript==

(function() {
    var revs   = [];
    var a_list = document.getElementsByTagName('a');
    var len    = a_list.length;
    for (var i = 0; i < len; i++) {
        var rev = a_list[i].text;
        if (rev.match(/^r[0-9]+$/)) {
            revs.push(rev.replace('r', ''));
        }
    }
    document.getElementById('content').insertAdjacentHTML('afterBegin', '<input type="text" value="' + revs.sort().join(' ') + '" style="width:100%; background-color:#ccffcc;" />');
})();
