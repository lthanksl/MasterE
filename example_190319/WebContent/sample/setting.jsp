<%@page import="java.util.Map"%>
<%@page import="common.common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String,String> maps = common.MMSettingToFile("/WEB-INF/action.properties", application);
String r = maps.get("date");
%>
<%=r %>
</body>
</html>