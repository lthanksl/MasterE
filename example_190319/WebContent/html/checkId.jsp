

<%@page import="mybatis.dao.DAOMem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//사용자가 입력한 id값을 u_id라는 파라메터로 전달하므로 u_id파라메터  값 받기
	//이 문서는 reg.jsp의 $.ajax()로 비동기식 호출로 인해 불려진다.
	String id = request.getParameter("u_id");
	if(!DAOMem.checkId(id))
	{
%>
<pre id="chk" class="success">사용가능</pre>
<%
	}
	else
	{
%>
<pre id="chk" class="fail">사용불가능</pre>
<% 
	}
%>
