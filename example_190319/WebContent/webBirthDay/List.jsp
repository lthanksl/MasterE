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
				<label for="exampleInputName2">생일자</label>
				<div class='input-group date' id='div생일자' >
					<input type="text" id="txt생일자" maxlength="10" value="%|%"  />
					<span class="input-group-addon">
						<span class=""></span>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputName2">이름</label>
				<input type="text" class="form-control" id="txt생일자" maxlength="10" value="%|%"  />
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

	//2.로드 이벤트
	$(document).ready(function () {

		jQuery("#gridMain").jqGrid({

		     url: 'https://javascript:void(0)',
			colNames: ['이름', '생일자', '수정일', '수정자'

			],
			colModel: [
					{ name: '이름', index: '이름', width: 0, sorttype: "text" },
					   { name: '생일자', index: '생일자', width: 0, sorttype: "text", hidden: true },
					   { name: '수정일', index: '수정일', width: 0, sorttype: "text" },
					   { name: '수정자', index: '수정자', width: 0, sorttype: "text", hidden: true },
					  

			],
			formatter: {
				/* integer: { thousandsSeparator: ",", defaultValue: '0' }  // colModel의 formatter: 'integer'  일때 천자리 마다 , 를 찍는다. */
			},
			caption: "생일 목록",
			autowidth : true,
			multiselect : true,
			multiboxonly : true,
			autowidth : true,
			loadui : "disable",
			shrinkToFit : false,
			height : 400,
			rownumbers : true,
			viewrecords : true,
			gridview : true,
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