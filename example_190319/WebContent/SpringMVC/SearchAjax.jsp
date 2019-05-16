<%@page import="mybatis.vo.EmpVO"%>
<%@page import="mybatis.dao.EmpDAO"%>
<%@page
	import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.beans.factory.BeanFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib 
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 500px;
	border: 1px solid black;
	border-collapse: collapse;
}

table th, table td {
	border: 1px solid black;
	padding: 4px;
}

table thead tr {
	background-color: #dedede;
}

div#search_name {
	width: 250px;
	height: 90px;
	padding: 5px;
	border: 1px solid black;
	background-color: #fff;
	border-radius: 5px;
	position: absolute;
	top: 120px;
	left: 200px;
	display: none;
}
</style>
</head>
<body>

	<h1>사번 검색 결과</h1>
	

	<table id="table1">
		<colgroup>
			<col width="80px" />
			<col width="*" />
			<col width="90px" />
			<col width="100px" />
		</colgroup>
		<thead>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직종</th>
				<th>부서코드</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>



	<input type="hidden" id="chk" name="chk" />


	<div>
		<select id="sel">
			<option value="0" selected="selected">이름</option>
			<option value="1">직종</option>
			<option value="2">사번</option>
		</select> 
		<input type="text" id="s" name="s"  value="%%"/>
	</div>

	<div>
		<input type="button" value="검색" id="btn" />
	</div>



	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#btn").on("click", function() {
			var v = $("#sel option:selected").val();
			alert(v);
			var text = $("#s").val();
			alert(text);
			 $.ajax({
				url:"test2.MASE",
				type: "post",
				data:"id="+encodeURIComponent(v) +"&text="+encodeURIComponent(text),
				dataType: "json",
			}).done(function (data) {
				console.log(data);
				
				if(data.ar != undefined)
				{
					var code = "";
					for(var i=0; i<data.ar.length; i++){
						code += "<tr><td>";
						code += data.ar[i].employee_id;
						/* code += "</td><td>";
						code += data.ar[i].name;
						code += "</td><td>";
						code += data.ar[i].email;
						code += "</td><td>";
						code += data.ar[i].phone; */
						code += "</td></tr>";
						
					}
					$("#table1 tbody").html(code);
					alert(code);
				}
			}).fail(function(err) {
				console.log(err);
			}); 
		});
	});
	</script>

</body>
</html>