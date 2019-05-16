<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일을 받기 전에 저장될 위치인 cPath를 
	//먼저 받아보자!
//	String cPath = request.getParameter("cPath");
	// 폼이 encType이 지정되었다면 절대로
	// 위와 같이 파라미터를 받을 수 없다.
	// MultiPartRequest라는 객체를 생성하여 
	// 파라미터를 받아야 한다. 그런데 MultipartRequest를
	//생성할 때 반드시 필요한 인자가 파일이 저장될
	//위치값이 필요하다 즉, 미리 준비되어 있어야 한다.
	//그래서 우린 HttpSession에 dir이라는 이름으로
	//저장한 것이다.
	String dir = (String)session.getAttribute("dir");
	String path = application.getRealPath(
			"/members/"+dir);
	MultipartRequest mr = new MultipartRequest(
		request, path, 1024*1024*5, 
		new DefaultFileRenamePolicy());
	//여기까지만 해도 전달된 파일이 path에 저장된다.
	
	//파일명이 변경될 수도 있으므로 확인하기 위해서
	//먼저 첨부파일을 File객체로 얻어낸다.
	File f = mr.getFile("upload");
	
	//변경 전의 파일이름
	String o_name = mr.getOriginalFileName("upload");
	
	//변경전의 이름과 현재 이름을 출력해 보자
	if(f != null){
		System.out.println("현재파일명:"+f.getName());
		System.out.println("변경전 파일명:"+o_name);
	}
	
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="exe()">
<%--
	처리가 끝난 후 myDisk.jsp로 돌아가야 한다.
	이때 원래 있었던 위치로 돌아가야 하므로 이동시
	cPath라는 파라미터에 HttpSession에 저장되었던
	현재 위치값을 넣어 보낸다.
 --%>
	<form action="myDisk.jsp" method="post">
		<input type="hidden" name="cPath"
			value="<%=dir %>"/>
	</form>
	<script type="text/javascript">
		function exe(){
			document.forms[0].submit();
		}
	</script>
</body>
</html>



