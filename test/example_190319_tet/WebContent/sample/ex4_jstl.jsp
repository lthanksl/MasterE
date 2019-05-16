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
	//먼저 JSTL을 사용하지 않는 경우!!
	String index = request.getParameter("idx");
	int res = 5;//지역변수 선언
	
	//받은 index값이 null이 아니면 정수로 변환하자
	if(index != null){
		int i = Integer.parseInt(index);
		
		if(i <= 0){
%>
			i가 0이거나 0보다 작습니다.
<%			
		}else{
%>
			i가 0보다 큽니다.
<%			
		}
	}
	
	
	//JSTL(JSP Standard Tag Library)
	//   자바기반의 웹 환경에서 지원하는 확장된
	//   Tag를 사용할 수 있도록 제공되는 라이브러리
	//   (Tag로 제어문 지원)
	// 먼저 JSTL라이브러리가 WEB-INF/lib에 있어야 한다.
	//	(standard.jar, jstl.jar)
%>
	<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>

	<%-- JSTL변수 선언 --%>
	<c:set var="idx" value="<%=index %>"/>
	<%-- 스크립트요소에서 정의한 변수를
		JSTL에서는 바로 사용하지 못하고 위와 같이
		JSTL변수를 선언하여 값을 스크립트 요소로
		넣은 상태에서 사용할 수 있다. --%>
		
	<c:if test="${idx != null and idx > 0 }">
		<br/>idx가 0보다 큽니다.
	</c:if>		
	<c:if test="${idx != null and idx <= 0 }">
		<br/>	idx가 0이거나 0보다 작습니다.
	</c:if>
	<c:forEach begin="1" end="2">
			<c:out value="&nbsp;&nbsp;1" escapeXml="false"/>
	</c:forEach>
       			
</body>
</html>






