<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- //SQL TEXT 실행(ExcuteNonQuery)
function ExcuteNonQueryText(sQuery, callBack, async) {
    try {
        $.ajax({
            type: "POST",
            url: '/WebSite/Extension/ExecuteAsText',
            global: false,
            async: async == undefined ? false : async,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ sQuery: sQuery }),
            dataType: "json",
            success: function (data) {
                callBack("success");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('An error occurred... ExcuteNonQueryText()= ' + jqXHR.responseText.substring(600, 1500) + "//" + textStatus + "//" + errorThrown);
            }
        });
    }
    catch (ex) {
        throw ex;
    }
} -->
</body>
</html>