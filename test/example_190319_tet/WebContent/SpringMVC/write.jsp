<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/summernote-lite.css">
<script type="text/javascript">
	function check(ff){
		//유효성 검사
		
		ff.submit();
	}
</script>
</head>
<body>

	<form id="uploadForm" action="write.inc" method="post" 
	enctype="multipart/form-data">
	<input type="hidden" id="bname" name="bname" value="BBS" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" height="10"></td>
        </tr>
        <tr>
          <td align="center"><u><b>BBS 글쓰기</b></u></td>
        </tr>
        <tr>
          <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="556" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="2" bgcolor="#C3C3C3"></td>
              </tr>
              <tr>
                <td bgcolor="#E5E5E5"><table width="100%" border="0" cellspacing="1" cellpadding="2">

                    <tr>
                      <td width="90" height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">작성자</font></td>
                      <td bgcolor="#F2F7F9" align="left"> <input type="text" name="writer" value="writer" cssStyle="width:100px" theme="simple"/></td>
                    </tr>

                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">제목</font></td>
                      <td bgcolor="#F2F7F9" align="left"> <input type="text" name="title" value="title" size="50" theme="simple"/></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">내용</font></td>
                      <td bgcolor="#F2F7F9" align="left"> <textarea id="content" name="content" cols="50" rows="10" theme="simple">content</textarea></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
                      <td bgcolor="#F2F7F9" align="left">
                        <input  type="file" name="upload" cssStyle="width:300px" theme="simple"/>
                      </td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">비밀번호</font></td>
                      <td bgcolor="#F2F7F9" align="left"> <input type="password" value="1111" name="pwd" cssStyle="width:200px" theme="simple"/>
                        <font color="#0066CC">* 삭제.수정시 필요</font> </td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="556" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20" valign="middle"><img src="/images/sub_it/point_line.gif" width="556" height="3"></td>
              </tr>
              <tr>
                <td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="315" align="center">
                        
                      </td>
                      <td width="241" align="right">
                      <input type="button" onclick="check(this.form)" value="보내기"/>
                      <input type="reset" value="재입력"/>
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="19"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

	</form>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/summernote-lite.js"></script>
	<script src="js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
	
		$(function(){
			//jquery시작부분
			
			$("#content").summernote({
				height: 200,
				lang: "ko-KR",
				focus: true, /* 커서를 미리  
							가져다 놓는다. */
				callbacks:{
					onImageUpload: function(files, editor){
						//이미지가 에디터에 추가될 때마다 수행!!
						//추가되어 들어온 이미지가 배열로 인식됨!
						for(var i=0; i<files.length; i++)
							sendFile(files[i], editor);
						//위의 sendFile이라는 함수가 서버와
						//비 동기식 통신을 하는 함수다.
					}
				}
			});
			
			$("#content").summernote(
				"lineHeight", .7);
			
		});
		
		function sendFile(file, editor){
			var frm = new FormData();
			
			//보내고 싶은 자원을 위에서 만든
			//폼객체에 파라미터로 넣어준다.
			frm.append("upload", file);
			
			//비동기식 통신
			//var form = new FormData(document.getElementById('uploadForm'));
			//var dd = document.getElementById('uploadForm');
			
			

			$.ajax({
				url: "/ex/test3.MASE",
				data: frm,
				cache: false,
				contentType: false,
				processData: false,
				type: "post",
				dataType: "json"//서버로 부터 받을 데이터 형식
			}).done(function(data){
				/* alert('2');*/
				console.log(data.url); 
				 $("#content").summernote(
					"editor.insertImage", data.url);
			}).fail(function(err){
				console.log(err);
			});
		}
	
		
		
	</script>
</body>
</html>












