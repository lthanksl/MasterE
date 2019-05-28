<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- http://localhost:9090/PROJECT_19/Master/mngMemberInsert.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/main.css" />



<link type="text/css" rel='stylesheet' href='../css/jquery-ui.css' />



<!-- jquery -->
<link href="../Content/themes/base/minified/jquery-ui.theme.min.css"
	rel="stylesheet" />
<link href="../Content/themes/base/minified/jquery-ui.structure.min.css"
	rel="stylesheet" />
<link href="../Content/jquery.jqGrid/ui.jqgrid.css" rel="stylesheet" />
<link href="../Content/bootstrap.min.css" rel="stylesheet" />
<link href="../Content/bootstrap-datetimepicker.css" rel="stylesheet" />


<style type="text/css">
.lightGray{
background:#eee;
}
</style>

</head>
<body>

	<div id="wrap">
		<div class="panel-body">
			<div class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">아이디</label> <input type="text"
						id="txtID" maxlength="10" value="" class="lightGray"/>
				</div>
				<div class="form-group">
					<label for="exampleInputName2">이름</label> <input type="text"
						id="txtNAME" maxlength="10" value="" class="lightGray" />
				</div>

				<div class="form-group">
					<label for="exampleInputName2">폰</label> <input type="text"
						id="txtPHONE" maxlength="10" value="010-000-0000" class="lightGray" />
				</div>
				<div class="form-group">
					<label for="exampleInputName2">패스워드</label> <input type="text"
						id="txtPW" maxlength="10" value="" class="lightGray" />
				</div>
				
				<br/>
				
				<div class="form-group">
					<label for="exampleInputName2">성별</label> <input type="text"
						id="txtGENDER" maxlength="10" value="" />
				</div>
				<div class="form-group">
					<label for="exampleInputName2">LEV</label> <input type="text"
						id="txtLEV" maxlength="10" value="" />
				</div>
				<div class="form-group">
					<label for="exampleInputName2">POINT</label> <input type="text"
						id="txtPOINT" maxlength="10" value="" />
				</div>		
				<div class="form-group">
					<label for="exampleInputName2">입사일</label> <input type="text"
						 id="txtHIRE_DATE" maxlength="10" value="" />
				</div>
				<div class="form-group">

					<button type="button" class="btn btn-secondary" id="bt_Insert">저장</button>
				</div>
				<div style="display: none;">
					<button type="button" class="btn btn-primary" id="bt_Select">검색</button>
					<div class="form-group">
						<button type="button" class="btn btn-success" id="bt_Update">수정</button>
						<button type="button" class="btn btn-warning" id="bt_Delete">삭제</button>
					</div>

					<div class="form-group">
						<button type="button" class="btn btn-info" id="bt_Sample">샘플</button>

						<button type="button" class="btn btn-light">Light</button>
						<button type="button" class="btn btn-dark">Dark</button>
						<button type="button" class="btn btn-link">Link</button>
					</div>
				</div>
			</div>
			<table id="gridMain"></table>
			<div id="jqGridPager"></div>
		</div>

		<!-- 하단 영역 끝 -->
	</div>
</body>

<script type="text/javascript" src="../js/Common.js"></script>
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<script src="../js/bootstrap/bootstrap.min.js"></script>


<!-- jQgrid -->
<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../Scripts/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="../Scripts/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="../Scripts/jquery.cookie.js"></script>



<script type="text/javascript">
$("#bt_Insert").click(function() {
	
	
	var ID = $("#txtID");
	if(!InvalidateFalse(ID.val() == "","아이디를 입력하세요.",ID))
	{
		return true;
	};
	
	var NAME = $("#txtNAME");
	
	if(!InvalidateFalse(NAME.val() == "","이름를 입력하세요.",NAME))
	{
		return true;
	};
	var PHONE = $("#txtPHONE").val();
	var PW =$("#txtPW").val(); 
	var para = "ID="
		+ encodeURIComponent(ID.val())
		+ "&NAME="
		+ encodeURIComponent(NAME.val())
		+ "&PHONE="
		+ encodeURIComponent(PHONE)
		+ "&PW="
		+ encodeURIComponent(PW);
	$.ajax(
			{
				url : "mngMemberInsert.inc",
				data : para,
				type : "post",
				dataType : "json",
			}).done(function(result) {
		console.log(result);

		

	}).fail(function(err) {
		//callback 함수
		console.log(err);
		//요청에 실패했을 때 수행하는 곳
		//서버에서 오류가 발생하면
	});
	/* alert("저장 하였습니다.");
	window.close(); */
});
</script>


</html>