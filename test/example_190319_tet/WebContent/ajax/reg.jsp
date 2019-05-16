<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/common.css" />
<link type="text/css" rel="stylesheet" href="../css/reg2.css" />
</head>
<body>


<table class="table_type01" 
		style="width: 900px;border-top: 0px">
			<colgroup>
				<col width="130px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>이름</th>
					<td>  
					<input type="text" name="" id="NAME" value="MASTER_E"
					    class="join"/>
					</td>
				</tr>
				<tr>
					<th>
					 <span class="req"></span>
					 아이디
					</th>
					<td>
					  <p class="guide_txt">
					   6~12자리의 영문, 숫자(혼용가능)를 입력해 주세요.
					  </p>
					  <p>
					   <label for="s_id" class="hidden">아이디</label>
					   <input type="text" name="" id="ID" value="MASTER_E"
					    class="join"/>
					    <span class="btn b_bdcheck" style="width: 60px;height: 30px;background-position: 0 -150px ">
					    	<div  id="box"></div>
					    </span>
					  </p>
					</td>
				</tr>
				<tr>
					<th>
					  <span class="req"></span>
					  비밀번호
					</th>
					<td>
					  <p class="guide_txt">
					   안전을 위해 10개 이상의 문자조합(
					   영문 대소문자 + 숫자 또는 기호(!~#@))를 
					   입력해 주세요.
					  </p>
					  <p>
					   <label for="s_pw" class="hidden">비밀번호</label>
					   <input type="password" name="" id="PW" value="MASTER_E"
					    class="join"/>					    
					  </p>
					</td>
				</tr>
				<tr>
					<th>
					  <span class="req"></span>
					  비밀번호 확인
					</th>
					<td>
					  <p class="guide_txt">
					   입력하신 비밀번호 확인을 위해 
					   다시한번 입력해 주세요.
					  </p>
					  <p>
					   <label for="s_pw2" class="hidden">비밀번호확인</label>
					   <input type="password" name="" id="PW2" value="MASTER_E"
					    class="join"/>					    
					  </p>
					</td>
				</tr>
				
			</tbody>
		</table>
		<script src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
			$(function(){
			
			
			//사용자가 id를 입력하기 위해
			//키보드를 누를 때마다 이벤트 적용
			//$("#s_id").on('keydown',function(){
			$("#ID").on('keyup',function(){
				//alert("**");
				// 사용자가 입력한 문자값이 현재 4자 이상일 때만
				// 서버로 보낸다.
				//s_id인 요소에서 값을 얻어낸다
				/* var str = $("#s_id").val(); */
				var str = $(this).val();
				/* console.log(str);
				return; */
				
				//str의 값에서 공백이 있는지? 없는지? 판단하고 있다면 
				//정규표현식 등을 
				//이용하여 제거하는 작업이 필요하다.
				//아이디를 4자 이상 입력 했을경우
				if(str.trim().length > 3){
					/* console.log(str);
					return; */
					//4자 이상일 때만 서버로 보내서 사용가능한 id인지?판단하도록 
					//하자
					$.ajax({
						url: "checkId.jsp",
						type: "POST",
						data:"u_id="+encodeURIComponent(str)
					}).done(function(res){
						//도착함수:성공시
						$("#box").html(res);
					}).fail(function(err) {
						//실패시-서버에서 오류가 발생시
						console.log(err);
						
					});
				}else{
					//사용자가 입력한 id 값 길이가
					//4미만일 때 아이디가 box인 요소의 내용을 없앤다.
					$("#box").html("");
				}
			});
		});
		
		
		function sendFile(file, editor){
			var NAME = $("#NAME").val();
			var ID = $("#ID").val();
			var PW = $("#PW").val();
			var PW2 = $("#PW2").val();
			if(PW !=PW2)
			{
				alert("2개의 패스워드가 일치하지 않습니다.")
				return;
			}
			
			//비동기식 통신
			$.ajax({
				url: "save.jsp",
				/* data:"u_id="+encodeURIComponent(str) */
				data:"u_id=1", 
				cache: false,
				contentType: false,
				processData: false,
				type: "post",
				dataType: "json"//서버로 부터 받을 데이터 형식
			}).done(function(data){
				$("#content").summernote(
					"editor.insertImage", data.url);
			}).fail(function(err){
				
			});
			
		}
	
		
		
		
	</script>
</body>
</html>