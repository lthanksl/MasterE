
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String name = request.getParameter("name");
    String year = request.getParameter("year");
    String age = request.getParameter("age");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(name == null ||year == null ||age == null )
	{
		//하나라도 비었다면 입력 폼을 보여준다.
		%>
		<form action="ex2_forward2.jsp" method="post">
			<label for="name">이름</label>
			<input type="text" id="name" name="name"/><br>
			
			<label for="year">생년</label>
			<input type="text" id="year" name="year"/><br>
			
			<!-- <label for="name">이름</label>
			<input type="text" id="name" name="name"/><br> -->
			<input type="submit" value="보내기"/>
		</form>
		
		<%
	}
	else{
		//파라미터 3개 모두 들어왔을 때 수행
		
		%>
		<h2><%=name %>님은 <%=year %>년 생이므로 <br/>
		<%=age %>세 입니다.</h2>
		<%
	}
%>

</body>
</html>