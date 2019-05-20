<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link type="text/css" rel="stylesheet" href="../css/main.css" /> 
 <!-- <link type="text/css" rel="stylesheet" href="../css/common.css" />  -->


<link type="text/css" rel='stylesheet' href='../css/jquery-ui.css' />



<!-- jquery -->
<link href="../Content/themes/base/minified/jquery-ui.theme.min.css" rel="stylesheet" />
<link href="../Content/themes/base/minified/jquery-ui.structure.min.css" rel="stylesheet" />
<link href="../Content/jquery.jqGrid/ui.jqgrid.css" rel="stylesheet" />
<link href="../Content/bootstrap.min.css" rel="stylesheet" />
<link href="../Content/bootstrap-datetimepicker.css" rel="stylesheet" />

 
<style type="text/css">	

	
</style>

</head>
<body>

	<div id="wrap">
	<div class="panel-body">
		<div class="form-inline">
			<div class="form-group">
				<label for="exampleInputName2">적용일</label>
				<div class='input-group date' id='div적용일' >
					<input type="text" id="txt적용일자" maxlength="10"  />
					<span class="input-group-addon">
						<span class=""></span>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputName2">대분류</label>
				<select id="ddl대분류" class="form-control"></select>
			</div>
			<div class="form-group">
				<label for="exampleInputName2">중분류</label>
				<select id="ddl중분류" class="form-control"></select>
			</div>
			<div class="form-group">
				<label for="exampleInputName2">소분류</label>
				<select id="ddl소분류" class="form-control"></select>
			</div>
			<div class="form-group">
				<label for="exampleInputName2">부하코드</label>
				<select id="ddl부하코드" class="form-control"></select>
			</div>
			<div class="form-group">
				<label for="exampleInputName2">월</label>
				<select id="ddl월" class="form-control">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					
				</select>
				
			</div>
			<div class="form-group">
				<label for="exampleInputName2">시</label>
				<select id="ddl시" class="form-control">
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="20">21</option>
					<option value="20">22</option>
					<option value="20">23</option>

				</select>
			</div>
			<div class="form-group">
			<button type="button" 
								 class="btn btn-primary" id="bt_Select">검색</button>
			</div>
		</div>
		<table id="gridMain"></table>
	</div>
		
	<!-- 하단 영역 끝 -->
	</div>
</body>
 					
					
	<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    
    <script src="../js/bootstrap/bootstrap.min.js"></script>
    
    
    <!-- jQgrid -->
	<script src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="../Scripts/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.cookie.js"></script>

<script type="text/javascript" src="../Scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../Scripts/bootstrap-datepicker.kr.js"></script>


    <script type="text/javascript">
				$(function () {
					$('#div적용일').datepicker({
						format: "yyyy-mm-dd",
						startView: 0,
						todayBtn: "linked",
						language: "kr",
						orientation: "top auto",
						keyboardNavigation: false,
						forceParse: false,
						autoclose: true,
						todayHighlight: true
					});
				});
	</script> 
	<script type="text/javascript">
	   
	/* hs.graphicsDir = 'http://highslide.com/highslide/graphics/';
	hs.outlineType = 'rounded-white';
	hs.wrapperClassName = 'draggable-header';
	hs.align = 'center'; */
	/* function ClosePop1() {
		$('#pop').hide();
		$("#urlparam").attr("src", "");
		$("#urlparam").attr("reload", true);
	}
 */
 /*, datatype : "json" */
	/* , postData : {ajax_post_data: 'hello'}  */
 	$("#bt_Select").click(function () {
		
	 alert('1');
	 $.ajax({
         url: "dataSample/testData.jsp",
         dataType: "json",
         success: function (result) {
         	console.log(result);
         	alert(result.length);
            /*  for (var i = 0; i < result.items.length; i++) {
                 var item = result.items[i];
                 gridArrayData.push({
                     Title: item.title,
                     Link: item.link,
                     CreationDate: item.creation_date,
                     ViewCount: item.view_count,
                     AnswerCount: item.answer_count
                 });                            
             } */
				// set the new data
				$("#gridMain").jqGrid('setGridParam', result);
				// hide the show message
				/* $("#gridMain")[0].grid.endReq(); */
				// refresh the grid
				$("#gridMain").trigger('reloadGrid');
         }
     });
	 alert('2');
	 /* $("#gridMain").jqGrid('setGridParam', {

		url : "dataSample/testData.jsp", //데이터를 받아오는 주소 위치

		datatype : 'json', //그리드에 매칭될 수 있는 반환 타입

		mtype : 'post', //ajax 호출방법

		postData : {
			
		},//검색조건 폼

		success : function(data) {}//조건 폼값 전송
		,fail : function(data1) {alert("1");}
	}).trigger('reloadGrid'); //호출 완료 후 리로드 */
		/* $('#gridMain').setGridParam(
				{ 
					url: "dataSample/testData.jsp"
					, mtype: 'GET'					
		     		, success : 
		   	  function(){alert("2번");} // 변경된 값을 잘 뿌립니다. 
				}).trigger('reloadGrid'); */

	 /* 'total' : 5,
		'page' : 1,
		'records' : 3,
		'rows':  
		[ 
			{'data':'1111'}
		]   */
	});
	//2.로드 이벤트
	$(document).ready(function () {



		//$(".pop-up").draggable();
		/* $('.pop-up').hide();

		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!

		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}
		var today = yyyy + '-' + mm + '-' + dd; */
		// 3-8.컨트롤_콤보박스
		/* fnG_ComboList(false, $('#ddlEnergy'), escape('에너지원'), '서브코드', 'url');
		fnG_ComboList(true, $('#ddlEnergyS'), escape('부하구분'), '서브코드', 'url');

		fnG_ComboList(false, $('#ddl대분류'), escape('요금대분류'), '서브코드', 'url');
		fnG_ComboList(false, $('#ddl중분류'), escape('요금중분류'), '서브코드', 'url');
		fnG_ComboList(false, $('#ddl소분류'), escape('요금소분류'), '서브코드', 'url');
		fnG_ComboList(false, $('#ddl부하코드'), escape('부하구분'), '서브코드', 'url');
		$("#txt기준년도").val(yyyy);
		$("#txt기준년도S").val(today);
		$("#txt기준년도STo").val(today);
		$("#txt적용일자").val(today); */

		jQuery("#gridMain").jqGrid({

		      url: 'https://javascript:void(0)',
			colNames: ['Title'
				/* , '대분류', '대분류명', '중분류', '중분류명', '소분류', '소분류명', '부하코드', '부하코드명', '단가', '월', '시', '등록일자', '수정일자'
				 */

			],
			colModel: [
					{ name: 'Title', index: 'Title', width: 0, sorttype: "text" },
				/* 	   { name: '대분류', index: '대분류', width: 0, sorttype: "text", hidden: true },
					   { name: '대분류명', index: '대분류명', width: 0, sorttype: "text" },
					   { name: '중분류', index: '중분류', width: 0, sorttype: "text", hidden: true },
					   { name: '중분류명', index: '중분류명', width: 0, sorttype: "text" },
					   { name: '소분류', index: '소분류', width: 0, sorttype: "text", hidden: true },
					   { name: '소분류명', index: '소분류명', width: 0, sorttype: "text" },
					   { name: '부하코드', index: '부하코드', width: 0, sorttype: "text", hidden: true },
					   { name: '부하코드명', index: '부하코드명', width: 0, sorttype: "text" },
					   { name: '단가', index: '단가', width: 0, sorttype: "text", formatter: 'integer' },
					   { name: '월', index: '분', width: 80, sorttype: "text" },
					   { name: '시', index: '시', width: 80, sorttype: "text" },
					   { name: '등록일자', index: '등록일자', width: 0, sorttype: "text", hidden: true },
					   { name: '수정일자', index: '수정일자', width: 0, sorttype: "text" }, */

			],
			  viewrecords: true, // show the current page, data rang and total records on the toolbar
	            width: 780,
	            height: 200,
	            rowNum: 15,
	            autowidth : true,
				datatype: 'local',
	            pager: "#jqGridPager",
				caption: "Load live data from stackoverflow",
			onSelectRow : function(rowid, status, e) {
	
					/* var postData = $('#gridMain').jqGrid('getRowData')
					postData = JSLINQ(postData);
	
					$("#txt적용일자").val(postData.items[rowid - 1].적용일자);
					$("#ddl대분류").val(postData.items[rowid - 1].대분류);
					$("#ddl중분류").val(postData.items[rowid - 1].중분류);
					$("#ddl소분류").val(postData.items[rowid - 1].소분류);
					$("#ddl부하코드").val(postData.items[rowid - 1].부하코드);
					$("#ddl월").val(postData.items[rowid - 1].월);
					$("#ddl시").val(postData.items[rowid - 1].시); */
				}
			});
					/* jQuery.extend($.fn.fmatter, {
						pass: function (cellvalue, options, rowdata) {
							return "********";
						}
					}); */

					/* function updateDialog(action) {
						return {
							url: '../Api/MngUser2Gas/',
							jqModal: false,
							reloadAfterSubmit: false,
							closeOnEscape: true,
							savekey: [true, 13],
							closeAfterEdit: true,
							modal: true
							, jqmodal: true
							, onclickSubmit: function (params) {
								var list = $("#gridMain");
								var selectedRow = list.getGridParam("selrow");
								rowData = list.getRowData(selectedRow);
								params.url += rowData.Id;
								params.mtype = action;

							}
							, width: "300"

						};
					} */

					/* jQuery("#gridMain").jqGrid('navGrid', '#pagernav',
					{
						add: true, edit: true, del: true, refreshtext: 'Reload',

					}, */

					//3.사용자 함수
					//에너지원 :전력 10 ,LNG 20
					//에너지원 :총발열량 10 ,순발열량 20

					/* function CallService() {
						$.ajax({
							type: Type, //GET or POST or PUT or DELETE verb
							url: Url, // Location of the service
							data: Data, //Data sent to server
							contentType: ContentType, // content type sent to server
							dataType: DataType, //Expected data format from server
							processdata: ProcessData, //True or False
							success: function (msg) {//On Successfull service call
								ServiceSucceeded(msg);
							},
							error: ServiceFailed// When Service call fails
						});
					} */
					/* //3-11.2이벤트_추가
					$("#bt_Insert").click(function () {
						var 적용일자 = $("#txt적용일자").val();
						var 대분류 = $("#ddl대분류 option:selected").val(); // value값
						var 중분류 = $("#ddl중분류 option:selected").val(); // value값
						var 소분류 = $("#ddl소분류  option:selected").val(); // value값
						var 부하코드 = $("#ddl부하코드 option:selected").val(); // value값
						var 월 = $("#ddl월").val();;
						var 시 = $("#ddl시").val();;



						var equipInfo = { "적용일자": 적용일자, "대분류": 대분류, "중분류": 중분류, "소분류": 소분류, "부하코드": 부하코드, "월": 월, "시": 시 }
						//$("#contentHolder").empty();
						var jsonData = JSON.stringify(equipInfo);

						$.ajax({
							//getListOfCars is my webmethod
							type: "POST",
							url: "../Master/SetPriceMaster",
							data: jsonData,
							contentType: "application/json; charset=utf-8",
							dataType: "json", // dataType is json format
							success: function (DATA) {//On Successfull service call
								var DATAR = JSON.parse(DATA);
								alert(DATAR[0].MES);
								$("#bt_Select").click();
							},
							error: function () {
								alert('오류..');
							},
						});
					}) */

					//3-12.2이벤트_조회
					/* $("#bt_Select").click(function () {
						var 기준년도 = $("#txt기준년도S").val()
						var 기준년도To = $("#txt기준년도STo").val()
						var 에너지원 = $("#ddlEnergyS option:selected").val(); // value값
						if (에너지원 == 00)
						    에너지원 = "";
						var 월 = $("#ddl월").val();;
						
						$('#gridMain').setGridParam({ url: "../Api/MngPrice/GetMngUser?p_YYYY=" + 기준년도 + "&p_YYYYTo=" + 기준년도To + "&p_Energy=" + 에너지원, mtype: 'GET' }).trigger('reloadGrid');
						
					}); */
					/* //3-14.2이벤트_삭제
					$("#bt_Delete").click(function () {
						var 적용일자 = $("#txt적용일자").val();
						var 대분류 = $("#ddl대분류 option:selected").val(); // value값
						var 중분류 = $("#ddl중분류 option:selected").val(); // value값
						var 소분류 = $("#ddl소분류  option:selected").val(); // value값
						var 부하코드 = $("#ddl부하코드 option:selected").val(); // value값
						var 월 = $("#ddl월").val();;
						var 시 = $("#ddl시").val();;



						var equipInfo = { "적용일자": 적용일자, "대분류": 대분류, "중분류": 중분류, "소분류": 소분류, "부하코드": 부하코드, "월": 월, "시": 시 }
						//$("#contentHolder").empty();
						var jsonData = JSON.stringify(equipInfo);

						$.ajax({
							//getListOfCars is my webmethod
							type: "POST",
							url: "../Master/SetPriceMaster_D",
							data: jsonData,
							contentType: "application/json; charset=utf-8",
							dataType: "json", // dataType is json format
							success: function (DATA) {//On Successfull service call
								var DATAR = JSON.parse(DATA);
								alert(DATAR[0].MES);
								$("#bt_Select").click();
							},
							error: function () {
								alert('오류..');
							},
						});
					}) */
					/* $("#bt_UpdatePrice").click(function () {
						$('#pop').show();
						$('#pop').css("z-index", 3);

						$("#urlparam").attr("src", "PopMngPrice?id=1&no=1");

						$("#urlparam").attr("reload", true);
					});
					//3.사용자 함수 끝
					jQuery.extend(jQuery.jgrid.edit, { closeAfterAdd: true, closeAfterEdit: true, recreateForm: true });

					//3-22-85.팝업창 이동
					$(".pop-up").mousedown(function () {

						var id = $(this).attr('id');

						$(".pop-up").css("z-index", 1);
						$(this).css("z-index", 2);
					});

					$("#bt_Excel").on("click", function (e) {
						ExportJQGridDataToExcel("#gridMain", "EnergyPrice.xlsx");

					}); */

				});
	</script>

</html>