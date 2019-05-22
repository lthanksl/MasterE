<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" class="btn btn-primary" id="bt_insert">샘플</button>

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<script src="js/bootstrap/bootstrap.min.js"></script>


<!-- jQgrid -->
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="Scripts/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="Scripts/jquery.cookie.js"></script>



<script type="text/javascript">
  
	var obj = jQuery.parseJSON( '{ "name": "John" }' );

	alert( obj.name == "John" );
	$("#bt_insert").click(function () {
	ExcuteDataSetToJson2("SMMATNM01", function (result) {
	 	alert(result);
	});
	
	 function ExcuteDataSetToJson2(para,dd) {
		alert(para);
		dd("11");
		return "test";
	} 
		
	});
</script>
</body>
</html>