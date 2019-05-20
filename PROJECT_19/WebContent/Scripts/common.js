/*****************************
**** JavaScript 공통 모듈 ****
**** fnG는 글로벌로 사용  ****
*****************************/

function fnG_onlyNumber(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
        return;
    else
        return false;
}
function fnG_removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}


function fnG_GridSaveExcel(tableCtrl, filename) {
    ExportJQGridDataToExcel(tableCtrl, filename + ".xls");
}

//checkall : true / false 로 구분
//control
//codename
//subcodename
//userurl
function fnG_ComboList(checkall,control, codename, subcodename, userurl) {

    var code = [];
    code[0] = codename;

    var subcode = [];
    subcode[0] = subcodename;

    var all = [];
    all[0] = checkall == true ? "all" : "one";


    //$("#contentHolder").empty();
    var jsonData = JSON.stringify({all:all, code: code, subcode: subcode });
    var defaulturl = "../Master/GetCombo";
    if (userurl != "" && userurl != "url")
        defaulturl = userurl;


    $.ajax({
        type: "GET",
        url: defaulturl, //'/Master/GetCombo',
        data: jsonData,
        headers: { "cache-control": "no-cache" },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,

        success: function (data, textStatus) {
            fnG_ComboListView(data, control);
        },
        error: function () {
            alert('콤보박스 조회 오류..' + defaulturl);
        },
        complete: function () {
        }
    });
};



function fnG_ComboListView(jsontext, control) {

    var json = JSON.parse(jsontext);
    var sb = new StringBuilder();
    $.each(json, function (i) {
        sb.append("<option value='" + json[i].코드 + "'>" + json[i].코드명 + "</option>");
    });

    control.html(sb.toString());
};

//lthanksl
function fnG_ComboListP3(checkall, control, codename, subcodename, thcodename) {
    
    var code = [];
    code[0] = codename;

    var subcode = [];
    subcode[0] = subcodename;

    var thcode = [];
    thcode[0] = thcodename;

    var all = [];
    all[0] = checkall == true ? "all" : "one";


    //$("#contentHolder").empty();
    var jsonData = JSON.stringify({ all: all, code: code, subcode: subcode, thcode: thcode });
    var defaulturl = "../Master/GetComboP3";
    //if (userurl != "" && userurl != "url")
    //    defaulturl = userurl;


    $.ajax({
        type: "GET",
        url: defaulturl, //'/Master/GetCombo',
        data: jsonData,
        headers: { "cache-control": "no-cache" },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,

        success: function (data, textStatus) {
            fnG_ComboListView(data, control);
        },
        error: function () {
            alert('콤보박스 조회 오류..' + defaulturl);
        },
        complete: function () {
        }
    });
};

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

function fnG_Comma(txt) { //function to add commas to textboxes

    return SetComma(txt);;
}
var rgx2 = /(\d+)(\d{3})/;
function fnG_CommaIn(txt) {

    var outNum = txt
    outNum = "" + outNum.replace(/(^\s*)|(\s*$)|,/g, '');

    return outNum;
}
//lthanksl 끝