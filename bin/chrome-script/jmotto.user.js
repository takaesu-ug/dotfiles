// ==UserScript==
// @name        J-Motto time input
// @namespace   http://blog.takapra.com
// @description 時間の入力でデフォルト値を入れる
// @include     https://takapra.j-motto.co.jp/cgi-bin/JM0646758/xinfo*
// ==/UserScript==

(function() {
    //対象となるページかどうかチェックするためのフォームを取得
    var beginHour = document.getElementsByName("shour").length;
    var outHour   = document.getElementsByName("outhour1").length;
    var inHour    = document.getElementsByName("inhour1").length;
    var endHour   = document.getElementsByName("ehour").length;

    if(beginHour && outHour && inHour && endHour) {
        //デフォルト時間を設定
        var form = document.forms[0];
        form.shour.options[12].selected=true;
        form.outhour1.options[15].selected=true;
        form.inhour1.options[16].selected=true;
        form.ehour.options[21].selected=true;
    }

})();
