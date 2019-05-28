<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /member.inc -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리 화면</title>
<link type="text/css" rel="stylesheet" href="css/main.css" />
<!-- <link type="text/css" rel="stylesheet" href="css/common.css" />  -->


<link type="text/css" rel='stylesheet' href='css/jquery-ui.css' />



<!-- jquery -->
<link href="Content/themes/base/minified/jquery-ui.theme.min.css"
	rel="stylesheet" />
<link href="Content/themes/base/minified/jquery-ui.structure.min.css"
	rel="stylesheet" />
<link href="Content/jquery.jqGrid/ui.jqgrid.css" rel="stylesheet" />
<link href="Content/bootstrap.min.css" rel="stylesheet" />
<link href="Content/bootstrap-datetimepicker.css" rel="stylesheet" />


</head>
<body>

	<div id="wrap">
		<div class="panel-body">
			<div class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">아이디</label>
					<div class='input-group date' id='div증상검색'>
						<input type="text" id="txt증상검색" maxlength="10" value="%%" />

					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputName2">이름</label>
					<div class='input-group date' id='div종류'>
						<input type="text" id="txt종류" maxlength="10" value="%%" />

					</div>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="bt_Select">검색</button>
					<button type="button" class="btn btn-secondary" id="bt_Insert">추가</button>
				</div>

				<div class="form-group">
					<button type="button" class="btn btn-success" id="bt_Update">수정</button>
					<button type="button" class="btn btn-warning" id="bt_Delete">삭제</button>
				</div>

				<div class="form-group">
					<button type="button" class="btn btn-info" id="bt_Sample">샘플</button>
					<div style="display: none;">
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

<script type="text/javascript" src="js/Common.js"></script>
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
	$("#bt_Insert").click(function() {
		
		var result = window.showModalDialog('memberListI.inc', '', 'dialogWidth:1000px; dialogHeight:420px; center:yes; help:no;     status:no; resizable :yes; scroll:yes');
	});
	$("#bt_Select").click(
			function() {

				var S_SUBJECT = $("#txt증상검색").val();
				var S_CATEGORY = $("#txt종류").val();
				$.ajax(
						{
							url : "memberListJqGrid.inc",
							data : "",
							type : "post",
							dataType : "json",
						}).done(function(result) {
					console.log(result);

					//callback 함수
					//요청에 성공했을 때 수행하는 곳!

					// json
					//    {
					//        total : totalPages,
					//    page : 0,
					//    records : totalRecords,
					//    data : {
					//				S_ID : 0, 
					//				S_SUBJECT : 상태 내용,
					//	        				S_CATEGORY: 종류,
					//				}
					//  };
					$("#gridMain").clearGridData();
					// set the new data
					$("#gridMain").jqGrid('setGridParam', result);
					// hide the show message

					// refresh the grid
					$("#gridMain").trigger('reloadGrid');

				}).fail(function(err) {
					//callback 함수
					console.log(err);
					//요청에 실패했을 때 수행하는 곳
					//서버에서 오류가 발생하면
				});

			});
	//2.로드 이벤트
	$(document).ready(function() {

		jQuery("#gridMain").jqGrid({

			url : 'https://javascript:void(0)',
			colNames : [ '번호', '아이디', '이름','폰번호','성별','입사일자','update_date','lev','point'

			],
			colModel : [ {
				name : 'member_SEQ',
				index : 'member_SEQ',
				width : 130,
				sorttype : "text"
			}, {
				name : 'id',
				index : 'id',
				width : 100,
				sorttype : "text"
			}, {
				name : 'name',
				index : 'name',
				width : 100,
				sorttype : "text"
			},{
				name : 'phone',
				index : 'phone',
				width : 100,
				sorttype : "text"
			},{
				name : 'gender',
				index : 'gender',
				width : 80,
				sorttype : "text"
			},{
				name : 'hire_DATE',
				index : 'hire_DATE',
				width : 80,
				sorttype : "text"
			},{
				name : 'date_UPDATE',
				index : 'date_UPDATE',
				width : 120,
				sorttype : "text"
			},{
				name : 'lev',
				index : 'lev',
				width : 80,
				sorttype : "text"
			},{
				name : 'point',
				index : 'point',
				width : 80,
				sorttype : "text"
			},
			

			],

			width : 100,
			height : 200,
			/* rowNum: 15, //한 라인에 보여주는 행 개수 */
			rownumbers : true, //앞에 시퀀스 표현
			autowidth : true,

			scroll : true,
			// loadonce: false,  // 1페이지 내의 데이터 건수들중 소팅해서 
			hidegrid : true,
			gridview : true,
			multiselect : true, //체크박스
			multiboxonly : true, //체크박스 클릭 했을때만 체크박스
			loadui : "disable",
			shrinkToFit : false, //그리드 꽉 차게
			datatype : 'local',
			pager : "#jqGridPager",
			viewrecords : true, //레코드 수 보여주기
			recordpos : 'center', //viewrecords 위치 설정 기본은 right left,center,right
			caption : "증상 목록",
			emptyrecords : 'DATA가 없습니다.',
			onSelectRow : function(rowid, status, e) {

			}
		});

	});
</script>


</html>