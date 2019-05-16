<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	// 사용자가 있었던 위치(폴더)
	String cPath = request.getParameter("cPath");
	
	//사용자가 입력한 폴더명
	String fname = request.getParameter("f_name");
	
	//위에서 받은 위치와 폴더명을 합쳐서
	//절대경로화 시킨 후 File객체를 생성하자!
	String path = application.getRealPath(
			"/members/"+cPath+"/"+fname);
	
	File f = new File(path);
	
	f.mkdir();
	//GET방식으로 페이지 이동!
	//response.sendRedirect("myDisk.jsp?cPath="+cPath);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >
	<form action="myDisk.jsp" method="post">
	<div style="display: none">
		<input type="hidden" name="cPath" 
			value="<%=cPath%>"/>
	</div>
	</form>
	
	<script type="text/javascript">
		
			document.forms[0].submit();
		
	</script>
</body>
</html>



