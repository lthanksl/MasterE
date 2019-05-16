<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link type="text/css" rel="stylesheet" href="../css/main.css" /> 



<!-- jquery -->

<link href="../Content/bootstrap.min.css" rel="stylesheet" />

 
<style type="text/css">	

	
</style>

</head>
<body>

<form action="" method="post">
	<div id="wrap">
	<div class="panel-body">
		<div class="form-inline">
			<div class="form-group">
				<label for="s_id">
								아이디 :
							</label>
			</div>
			<div class="form-group">
				<input id="s_id" 
								name="id"/>
			</div>
			<div class="form-group">
				<label for="s_pw">
								비밀번호 :
							</label>
			</div>
			<div class="form-group">
				<input type="password"
							 id="s_pw" name="pw"/>
			</div>
			<div class="form-group">
				<input type="button" 
								value="로그인" onclick="sendData(this.form)"/>
				
			</div>
			<div class="form-group">
				<input type="button" 
								value="회원가입"/>
				
			</div>

		</div>
		
	</div>
		
	<!-- 하단 영역 끝 -->
	</div>
</form>
</body>
 					
					
 	<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>

    <script src="../js/bootstrap/bootstrap.min.js"></script>
    

	<script type="text/javascript">
		function sendData(frm){
			//유효성 검사...(생략)
			frm.submit();
		}
	</script>
   

</html>