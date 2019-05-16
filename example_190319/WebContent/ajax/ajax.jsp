<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function() {
	$.ajax({
		//서버요청 정보를 지정한다.
		 url : "dataSample/testData.jsp",
		/*url : "ex2",*/
		type: "post",
		/* data:"id="+encodeURIComponent(v) +"&text="+encodeURIComponent(text), */
		dataType: "json",//요청한 후 받는 자원의 타입이
		//json이다.
	}).done(function(res){
		//callback 함수
		//요청에 성공했을 때 수행하는 곳!
		 alert(res.data);
		 
		 
	}).fail(function(err) {
		//callback 함수
		console.log(err);
		//요청에 실패했을 때 수행하는 곳
		//서버에서 오류가 발생하면
	});
});

</script>
</body>
</html>