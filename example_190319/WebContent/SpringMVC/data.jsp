<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>국내 관광(행사) 일정표</h1>
	${ar.title }
	<ul>
	<c:forEach var="vo" items="${list }" 
       			varStatus="st">	
					<%-- <tr>
					  <td bgcolor="#F2F7F9">
						${rowTotal-((nowPage-1)*blockList+st.index) }
                      </td>
					  <td bgcolor="#F2F7F9" style="text-align:left">
					  	step값만큼 들여쓰기하는 반복문
					  	<c:forEach begin="1" end="${vo.step }">
					  		<c:out value="&nbsp;&nbsp;" escapeXml="false"/>
					  	</c:forEach>
					  	
					  	<!-- step이 0이 아닐 때는 
					  	화살표 이미지 출력 -->
					  	<c:if test="${vo.step ne 0 }">
					  		<img src="images/arrow.JPG"/>
					  	</c:if>
						<a href="view.inc?seq=${vo.seq }&nowPage=${nowPage}"> 
							${vo.title }
						</a>
                      </td>
					  <td bgcolor="#F2F7F9">${vo.writer }</td>
					  <td bgcolor="#F2F7F9">${vo.regdate }</td>
					  <td bgcolor="#F2F7F9">${vo.hit }</td>
					</tr> --%>
       			</c:forEach>
	<%-- <c:if test="${idx != 2 and idx > 0 }">
		<br/>idx가 0보다 큽니다.
	</c:if>		 --%>
	<c:if test="${1 != 2 }">
		<br/>	idx가 0이거나 0보다 작습니다.
	</c:if>
	<c:forEach begin="1" end="2">
			<c:out value="&nbsp;&nbsp;1" escapeXml="false"/>
	</c:forEach>
       			
	<c:forEach var="vo" items="${ars }">
		<li>${vo.title } / ${vo.addr1 } / 
			${vo.eventstartdate }</li>
	</c:forEach> 
	</ul>
</body>
</html>



