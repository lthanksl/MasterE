<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%!
	public static String Now(java.util.Date date, String pFormat) {
		SimpleDateFormat formatter = new SimpleDateFormat(pFormat);
		String format = formatter.format(date);
		return format;
	}
	%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String year = request.getParameter("year");
	
	java.util.Date date = new java.util.Date();

	String msg = Now(date, "yyyy-MM-dd hh:mm:ss");
	//파하메터 값들 중 하나라도 받지 못했다면
	//앞 페이지로 이동!
	if (name == null || year == null) {
		//강제 페이지 이동! -- 현재 페이지에 
		//request와 response와 같은 객체를 모두 놓고 이동
		//response.sendRedirect("ex2_forward.jsp");
%>
	<jsp:forward page="ex2_forward.jsp"></jsp:forward>
<%
	} else {
		//year오 name이 넘어온 상태다.
		//나이를 구하기 위해 현재 날짜를 구하자!
		Calendar now = Calendar.getInstance();
		int cYear = now.get(Calendar.YEAR);
		int cMonth = now.get(Calendar.MONTH)+1;
		int cDate = now.get(Calendar.DAY_OF_MONTH);
		
		
/* 		java.util.Date date = new java.util.Date();

		String msg = Now(date, "yyyy-MM-dd hh:mm:ss") + ",파일에 쓰기 할 문자열을 준비"; */
		
		int bYear = Integer.parseInt(year);
		int age = cYear - bYear;
		
		//바로 앞 페이지로 foward를 시키면 결과를 확인할 수 있게된다. 현재 request에서
		//name과 year라는 파라메터가 있는 상태다.그래서 age만 넣어주면 된다.
		
		
%>

	<jsp:forward page="ex2_forward.jsp">
		<jsp:param name="age" value="<%=age %>"/>
	</jsp:forward>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=msg %>
</body>
</html>