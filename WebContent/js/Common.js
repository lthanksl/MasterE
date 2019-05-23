/* 공통으로 사용할 JS 함수 모음
*/


/* -------------------------------------
기능   : 일반 팝업 페이지 뛰우기 (window.open)
파라미터 :  pageURL     = "오류 메세지"
title       = "타이틀"
width       = "너비" (800px)
height      = "높이" (600px)
scroll      = "스크롤 사용여부" "yes" OR "no"
resizable   = "사이즈 조절 사용여부" "yes" OR "no"
isViewID   = "화면 ID 사용 여부"   ==> "true" OR "false" 일 경우에는 화면 TITLE 을 반드시 넘겨주어야 한다. 
RETURN : jsPopupOpen("CafeView.aspx?ArticleID=" + articleID + "&BoardID=" + "<%=BoardID %>", "", 900, 650, "yes", "yes");
---------------------------------------- */
function jsPopupOpen(pageURL, title, width, height, scroll, resizable, isViewID) {
    if (isViewID) {
        var win = window.open(pageURL, title, "toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=" + scroll + ",resizable=" + "yes" + ", width=" + width + ",height=" + height + ", left=50,top=50");
    }
    else {
        var win = window.open(pageURL, "", "toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=" + scroll + ",resizable=" + "yes" + ", width=" + width + ",height=" + height + ", left=50,top=50");
    }
    return win;
}

/*--------------------------------------------------
기능   : 확인창 띄우기
파라미터 : strmessage = "확인창 메세지"
RETURN : 확인, 취소값 반환
----------------------------------------------------*/
function jsOpenConfirm(strmessage) {
    try {
        if (_confirmPopup == "ON") {
            return window.confirm(strmessage);
        }
        else {
            return true;
        }

    } catch (exception) { alert(exception.description); }
}

/*--------------------------------------------------
기능   : 등록, 수정창 뛰우기 모달
파라미터 :  pageURL     = "오류 메세지"
width       = "너비"
height      = "높이"
scroll      = "스크롤 사용여부"
resizable   = "사이즈 조절 사용여부"
RETURN : 
----------------------------------------------------*/
function jsPopupOpenRegister(pageURL, width, height, scroll, resizable) {
    var option = 'center:on;resizable:' + resizable + ';scroll:' + scroll + ';dialogWidth:' + width + 'px;dialogHeight:' + height + 'px';
    return window.showModalDialog(pageURL, self, option);
}

/*--------------------------------------------------
기능   : 일반 팝업 페이지 가운데 뛰우기 (window.open)
파라미터 :  pageURL     = "오류 메세지"
title       = "타이틀"
width       = "너비"
height      = "높이"
scroll      = "스크롤 사용여부"
resizable   = "사이즈 조절 사용여부"
isViewID   = "화면 ID 사용 여부"   ==> true 일 경우에는 화면 TITLE 을 반드시 넘겨주어야 한다. 

RETURN : 
----------------------------------------------------*/
function jsPopupOpenCenter(pageURL, title, width, height, scroll, resizable, isViewID) {
    var left = (screen.width / 2) - (width / 2);
    var top = (screen.height / 2) - (height / 2);
    var option = 'resizable=' + "yes" + ',scrollbars=' + scroll + ', menubar=no, width=' + width + ', height=' + height + ', top=' + top + ', left=' + left;

    if (isViewID) {
        return window.open(pageURL, title, option);
    }
    else {
        return window.open(pageURL, "", option);
    }
}


/*--------------------------------------------------
기능   : 에디터 컨텐츠의 태그 제거 ( 앤퍼센트 처리 )
RETURN : 태그 제거 ( 앤퍼센트 처리 )
----------------------------------------------------*/
function jsConvertWord(strBody) {
    var re;
    re = /&lt;/g;
    strBody = strBody.replace(re, "&#60;");
    re = /&gt;/g;
    strBody = strBody.replace(re, "&#62;");
    re = /&/g;
    strBody = strBody.replace(re, "&amp;");
    re = /</g;
    strBody = strBody.replace(re, "&lt;");
    re = />/g;
    strBody = strBody.replace(re, "&gt;");
    //re = /\"/g;             
    //strBody = strBody.replace(re, "&quot;");

    return strBody;
}

/*--------------------------------------------------
기능   : 에디터 컨텐츠의 태그 생성( 앤퍼센트 처리 )
RETURN : 태그 생성 ( 앤퍼센트 처리 )
----------------------------------------------------*/
function jsCheckWord(strBody) {
    var re;
    re = /&lt;/g;
    strBody = strBody.replace(re, "<");
    re = /&gt;/g;
    strBody = strBody.replace(re, ">");
    re = /&amp;/g;
    strBody = strBody.replace(re, "&");
    re = /&#92;;/g;
    strBody = strBody.replace(re, "\\");
    re = /&#39;/g;
    strBody = strBody.replace(re, "\'");
    re = /&quot;/g;
    strBody = strBody.replace(re, "\"");

    return strBody;
}

/*--------------------------------------------------
기능   : 컨트롤 Enable
RETURN : 
----------------------------------------------------*/
function jsEnable(id) {
    //$("#" + id).removeAttr("disabled");
    document.getElementById(id).removeAttribute("disabled");
}
/*--------------------------------------------------
기능   : 컨트롤 Disable
RETURN : 
----------------------------------------------------*/
function jsDisable(id) {
    //$("#" + id).attr("disabled", "disabled");
    document.getElementById(id).setAttribute("disabled", "disabled");
}

/************************************************************************
기능명     : 파일명의 공백을 제거해주는 함수
파라미터명 : 
최초작성일 : 2015.05.25 송민석
최종수정일 : 
************************************************************************/
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
function trim(strTemp) {
    return strTemp.replace(/\s/g, "");
}

/************************************************************************
기능명     : 벨리데이션 체크
파라미터명 : 
최초작성일 : 이상준
최종수정일 : 
************************************************************************/
function jsValidation() {
    alert('1');
}
