<%@page import="mybatis.vo.VOMem"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	//선언부는 멤버변수 또는 멤버메서드를 정의할 때 사용한다.
	
	//개인이 사용한 용량을 측정하는 메서드
	//(File은 파일만 용량을 얻을 수 있으며, 폴더는 용량을 구하지 못한고 안에 있는 파일들의 용량을 모두 더해야 한다.
	// 그래서 재귀 호출 기법을 활용해야 한다.)
	public int useSize(File f){
		// 인자로 전달된 File객체가 폴더여야 한다.
		// 이 폴더의 하위요소들의 File용량을 모두 더해야 한다.
		// 우선 하위요소들을 얻어내자
		//64k 용량
		//cos라이버리는 5MB 용량
		File[] list = f.listFiles();
		
		int size = 0;
		
		//파일일 경우엔 용량을 size에 누적시키고
		//폴더일 경우엔 현재 함수를 다시 호출(재귀호출)
		for(File sf : list)
		{
			if(sf.isFile())
				size += sf.length();
			else
				size += useSize(sf);
		}
		return size;
	}

%>
<%
	int totalSize = 1024*1024*10;//10MByte bit>byte>kb>mb>gb>tb
	int useSize = 0;
	
	//현재 페이지는 무조건 로그인이 되어 있어야 사용 가능한 페이지다면
	//이쯤에서 로그인 여부를 확인해야한다.
	Object obj =session.getAttribute("vo_mem");
	
	if(obj != null)
	{
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");
		
		//현재 위치값(cPath)을 받는다.
		String dir = request.getParameter("cPath");
		
		//사용자가 폴더를 선택했을 경우라면 f_name이라는 파라미터 또한 넘어온다.
		
		String fname = request.getParameter("f_name");

		//회원정보를 정확하게 알 수 있도록 VOMem으로 캐스팅
		VOMem voMem = (VOMem)obj;
		
		String path = null;//절대경로를 저장할 곳
		
		if(dir == null)
		{
			//left.jsp에서 [MyDisk]라는 버튼을 클릭하여 들어온 경우!
			//이때는 해당 사용자의 ID와 같은 폴! 즉
			//개인의 홈디렉토리를 지정한다.
			path = application.getRealPath("/members/"+ voMem.getID());
			
			//사용자의 사용용량을 구한다.
			useSize = useSize(new File(path));
			
			//현재 위치값을 사용자 ID로 설정하자
			dir = voMem.getID();
		}
		else
		{
			//현재 영역은 MyDisk화면에서 원하는 폴더를 선택할 경우에 수행하는 곳!
			if(fname != null && fname.trim().length()>0)
			{
				dir = dir+"/" +fname;
			}
			path = application.getRealPath("/members/" + dir);
		}
		
		
		//아래는 엄청 중요한 정보다. 나중에 파일 첨부시 upload.jsp에서 어느
		//위치에 파일을 저장해야 할지 몰라서 난감한 경우가 생긴다. 그래서 session에 
		//저장할 폴더위치를 저장해 둔 것이다.
		session.setAttribute("dir", dir);
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 600px;
		border: 1px solid #27a;
		border-collapse: collapse;
	}
	table th, table td{
		border: 1px solid #27a;
		padding: 4px;
	}
	table th{ background-color: #bcbcbc; }
	.title { background-color: #bcbcbc; width: 25%; }
	
	.btn{
		display: inline-block;
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;	
		margin-right: 20px;	
	}
	.btn a{
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color: #fff;
		border-radius: 3px;
		text-decoration: none;
		font-size: 12px;
		font-weight: bold;
	}
	.btn a:hover{
		background: #fff;
		color: #27a;
		border: 1px solid #27a;
	}
	
	#f_win{
		width: 220px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#f_win2{
		width: 300px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#m_id{
	color: #00f;
	font-weight: bold;	
	}
</style>
</head>
<body>
	<h1>My Disk service</h1>
	<hr/><%=voMem.getNAME()%>
	(<span class="m_id"><%=voMem.getID() %></span>)님의 디스크
	&nbsp;[<a href="javascript:home()">Home</a>]
	<hr/>
	
	<table summary="사용량을 표시하는 테이블">
		<tbody>
			<tr>
				<th class="title">전체용량</th>
				<td><%=totalSize/1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">사용량</th>
				<td><%=useSize/1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">남은용량</th>
				<td><%=(totalSize-useSize)/1024 %> KB</td>
			</tr>
		</tbody>
	</table>
	<hr/>
		<div id="btn_area">
			<p class="btn">
				<a href="javascript:selectFile()">
					파일올리기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:makeFolder()">
				
					폴더생성
				</a>
			</p>
			<p class="btn">
				<a href="javascript:exe()">
					파일생성
				</a>
			</p>
		</div>		
	<hr/>
	
	<label for="dir">현재위치:</label>
	<span id="dir"><%=dir %></span>
	
	<table summary="폴더의 내용을 표현하는 테이블">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="80px"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>폴더 및 파일명</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<tbody>
		<%
			//현재위치의 값과 사용자의 id값이 서로 다를 때만 상위로 기능을 보여준다.
			if(!voMem.getID().equals(dir)) {
				
				
			//예를 들어 현재위치값(dir의 값)이 admin/abc/"라고 가정하면 상위로의 기능은 "admin의 위치를 의미한다.
			//이렇게 하기 위해서는 현재 위치값에서 가장~~~뒤에 있는 "/"의 index값을 얻어내어 앞에서 그 index까지만 
			//substring()하면 된다.
			int pp = dir.lastIndexOf("/");
			String upPath = dir.substring(0,pp);
		%>
			<tr>
				<td>↑</td>
				<td colspan="2">
				
					<a href="javascript:goUp('<%=upPath%>')">
						상위로...
					</a>
					
				</td>		
			</tr>
		<%
			}
		
		
			// 현재위치(dir)값을 가지고 절대경로화 시킨다.
			String c_path = application.getRealPath("/members/" +dir);
			
			// 절대경로를 만드는 이유는 File객체를 생성하기 위해서다.
			File s_file = new File(c_path);
			
			
			//해당 위치의 하위 요소들(파일과 폴더들)을 모두 가져온다.
			File[] s_files = s_file.listFiles();
			for(File f : s_files)
			{
				
		%>
			<tr>
				<td>
<% 
					if(f.isFile()){
%>
						<img src="../images/file.png"/>

<%
					}
					else //폴더인 경우
					{
%>
						<img src="../images/folder.png"/>
<%
					}
%>
				</td>
				<td>
<%
					if(f.isDirectory())
					{
%>
					<a href="javascript: gogo('<%=f.getName() %>')">
						<%=f.getName() %>
					</a>
<%
					}
					else //파일인 경우엔 다운로드
					{
%>
					<a href="javascript:down('<%=f.getName() %>')">
						<%=f.getName() %>
					</a>
				
<%
					}
%>
				</td>
				<td></td>
			</tr>
<%
			}
%>
		</tbody>
	</table>
	
	<form name="ff" method="post">
		<input type="hidden" name="f_name"/>
		<input type="hidden" name="cPath" value="<%=dir%>"/>
	</form>
	
	
	<div id="f_win">
		<form action="makeFolder.jsp" method="post" name="frm">
			<input type="hidden" name="cPath" value="<%=dir%>"/>
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name" value="mkFolder"/><br/>
			<p class="btn">
				<a href="javascript:newFolder()">
					만들기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	

	<div id="f_win2">
		<!-- 파일 첨부시 JSP nctype="multipart/form-data"을 넣어 주어야 한다. -->
		<form action="upload.jsp" method="post" name="frm2"
		enctype="multipart/form-data">
		
			<label for="selectFile">첨부파일:</label>
			<input type="file" id="selectFile" 
				name="upload"/><br/>
				
			<p class="btn">
				<a href="javascript:upload()">
					보내기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin2()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
	<script type="text/javascript">
		function home(){
			parent.location.href="../index.jsp";
		}
		
		function gogo(fname){
			//현재 문서(document)에
			// 이름이 ff인 form객체를 검색한다.
			// 검색된 form객체 안에 이름이 fname인 요소의
			//값으로 인자로 받은 폴더명을 넣어준다.
			document.ff.f_name.value = fname;
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
		}
		
		function goUp(upPath){
			document.ff.cPath.value = upPath;
			document.ff.action = "myDisk.jsp";
			document.ff.submit();//현재페이지를 다시 로드한다.(reload수행)
		}
		
		function makeFolder(){
			document.getElementById("f_win").style.display = "block";
		}
		function closeWin(){
			document.getElementById("f_win").style.display = "none";
		}
		
		function newFolder(){
			//사용자가 새로 만들 폴더명을 입력했는지 판단하자!
			var str = document.frm.f_name.value;
			
			//정규표현식을 이용한 공백제거 작업
			
			if(str.trim().length < 1){
				alert("폴더명을 입력하세요");
				document.frm.f_name.focus();
				return;
			}
			document.frm.submit();//서버로 보낸다.(makeFolder.jsp)
		}
		
		function selectFile(){			
			//숨겨져 있던 div를 보여준다.
			document.getElementById("f_win2").style.display = "block";
		}
		
		function upload(){
			//선택된 파일의 값을 가져오자!
			var select_f = document.frm2.upload.value;
			//document.frm2.upload.value = "test.txt";
			//위는 input type="file" 에서는 절대 허용되지 않는다.
			//이유는 보안문제에 걸려 브라우저에서 막아뒀다.
			
			//alert(select_f);
			if(select_f.trim().length < 1){
				alert("파일을 선택하세요!");
				return;
			}
			document.frm2.submit();
		}
		function closeWin2(){
			document.getElementById("f_win2").style.display = "none";
		}
		
		function down(fname){
			//인자로 넘어온 파일명을 현재문서(document)에
			//"ff"라는 폼안에 f_name이라는 이름을 가진 요소의
			//value값으로 지정해야 한다.
			document.ff.f_name.value = fname;
			// cPath도 같이 있는 폼의 action을 변경하자!
			document.ff.action = "download.jsp";
			
			document.ff.submit();
			
			document.ff.f_name.value = "";//돌아올 때 파일명이 있어서
					//오류가 발생할 수 있어서 삭제함!
		}
		
		function exe(){
			//현재 문서에 이름이 ff인 폼객체의 action을
			// newFile.jsp로 변경하자!
			document.ff.action = "newFile.jsp";
			document.ff.submit();
		}
	</script>
</body>
</html>
	
	<%
	}
	else
	{
	 %>
	 <script type="text/javascript">
	  parent.location.href = "../index.jsp"
	 </script>
	 <%	
	}
	%>