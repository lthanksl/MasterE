





/// <reference name="MicrosoftAjax.js"/>
//190416이전
//Tr 가지오기
function GetTr(container, tagName) {
    var list = new Array();
    var o = container;

    if (typeof (o) == "string")
        o = document.getElementById(container);

    var items = o.getElementsByTagName(tagName);
    for (var i = 0; i < items.length; i++) {
        var item = items[i];

        list.push(item);
    }
    return list;
}
// 숫자 통화로 바꾸기
function SetComma(numstr) {
    numstr = String(numstr);
    var re0 = /^(-?\d+)(\d{3})($|\..*$)/;
    if (re0.test(numstr))
        return numstr.replace(re0,
function (str, p1, p2, p3) {
    return SetComma(p1) + "," + p2 + p3;
}
);
    else
        return numstr;
}
/// 스트링 전체 replace
String.prototype.replaceAll = function (str1, str2) {
    var temp_str = "";
    if (this.trim() != "" && str1 != str2) {
        temp_str = this.trim();
        while (temp_str.indexOf(str1) > -1) {
            temp_str = temp_str.replace(str1, str2);
        }
    }
    return temp_str;
}

//상준씨가넣은거
function GetTypeChk(container, tagName, chk) {
    var list = new Array();
    var o = container;

    if (typeof (o) == "string")
        o = document.getElementById(container);

    var items = o.getElementsByTagName(tagName);

    for (var i = 0; i < items.length; i++) {
        var item = items[i];

        list.push(document.getElementById("grd2_chk" + "_" + i.toString()));
    }
    return list;
}

/// 체크박스 모든 선택 끝

/// 오류체크

function Invalidate(expression, message, o) {
    try {
        if (expression) {
            if (o != null) {
                o.focus();
                o.select();
                var e = new Error();
                e.message = message;
                throw e;
            }
        }
        else
            return true;
    }
    catch (e) {
    }

    var e = new Error();
    e.message = message;
    throw e;
}

function InvalidateFalse(expression, message, o) {
    try {
        if (expression) {
            alert(message);
            if (o != null) {
                o.focus();
                o.select();

                return false;
            }
        }
        else
            return true;
    }
    catch (e) {
    }
    return false;
}

//태그가 유일할때 사용 chk박스
function GetElementsByTagName(container, tagName, id) {
    var list = new Array();
    var o = container;

    if (typeof (o) == "string")
        o = document.getElementById(container);

    var items = o.getElementsByTagName(tagName);
    //alert(items.length);
    for (var i = 0; i < items.length; i++) {
        var item = items[i];
        //if (_CheckBoxComparer(item)) {
        list.push(item);
        //}
    }

    return list;
}

function _CheckBoxComparer(item) {
    if (item.type != 'checkbox') return false;

    return true;
}

//true 만 될지
function chkOlnyTrue(is, itmechk) {
    if (is == false) {
        if (itmechk.checked == false)
            itmechk.checked = true;
        else
            itmechk.checked = false;
    }
}