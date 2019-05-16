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
    $(document).ready(function () {
        $("#gridMain").jqGrid({
            colModel: [
                {
					label: 'Title',
                    name: 'Title',
                    width: 150,
                    formatter: formatTitle
                }
            ],

            viewrecords: true, // show the current page, data rang and total records on the toolbar
            width: 780,
            height: 200,
            rowNum: 15,
			datatype: 'local',
            pager: "#jqGridPager",
			caption: "Load live data from stackoverflow"
        });

        fetchGridData();

        function fetchGridData() {
            
            var gridArrayData = [];
			// show loading message
			/* $("#gridMain")[0].grid.beginReq(); */
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
        }

        function formatTitle(cellValue, options, rowObject) {
            return cellValue.substring(0, 50) + "...";
        };

        function formatLink(cellValue, options, rowObject) {
            return "<a href='" + cellValue + "'>" + cellValue.substring(0, 25) + "..." + "</a>";
        };

        

    });
	</script>

</html>