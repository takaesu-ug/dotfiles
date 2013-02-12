// ==UserScript==
// @name        Redmine Subject Renamer
// @namespace   http://blog.takapra.com
// @description チケットの件名を「refs #{ID} {SUBJECT}」に変更する
// @include     https://project.takapra.com/redmine/issues/*
// @exclude     https://project.takapra.com/redmine/issues/*/edit
// ==/UserScript==

(function() {
    // チケットの件名書き換え
    var id          = document.getElementsByTagName('h2')[0].innerHTML.split('#')[1];
    var subject_obj = document.getElementsByClassName('subject')[0].getElementsByTagName('h3')[0];
    subject_obj.innerHTML = '<input type="text" value="refs #' + id + ' ' + subject_obj.innerHTML  + '" style="width:100%;" />';

    // 関係リビジョン整形
    var changesets = document.getElementsByClassName('changeset');
    var len        = changesets.length;
    var revs       = [];
    for (var i =0; i < len; i++) {
        revs.push('r' + changesets[i].getElementsByTagName('a')[0].text.split(' ')[1]);
    }
    if (revs) {
        document.getElementById('issue-changesets').getElementsByTagName('h3')[0].insertAdjacentHTML('afterEnd', '<input type="text" value="' + revs.join(', ') + '" style="width:100%; background-color:#ccffcc; margin-bottom:10px;" />');
    }
})();
