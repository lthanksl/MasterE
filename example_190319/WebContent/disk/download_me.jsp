<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//전달되어 오는 파라미터들 받기(cPath, f_name)
	String cPath = request.getParameter("cPath");
	String f_name = request.getParameter("f_name");
	
	//위의 값들을 연결하여 절대경로화 시킨다.
	String path = application.getRealPath("/member/" + cPath+ "/" + f_name);
	
	File f = new File(path);
	
	//실제 존재하는지 판단
	if(f.exists()){
		byte[] buf = new byte[2048];//바구니
		int size = 0;
		
		//다운로드에 필요한 스트림 준비
		BufferedInputStream bis = null;
		FileInputStream fis = null;
		
		BufferedOutputStream bos = null;
		ServletOutputStream sos = null;
	//응답을 하는 것이 접속자 PC로 다운로드 시켜야 하기 때문에 response를 통해 스트림을 생성해야 한다.
	//그것이 바로  ServletOutputStream이다.
	try
	{
		
		//접속자 화면에 다운로드 창을 보여준다.
		response.setContentType(
				"application/x-msdownload");
			response.setHeader(
				"Content-Disposition",
				"attachment;filename="+
				new String(f_name.getBytes(), "8859_1"));
		
		fis = new FileInputStream(f);
		bis = new BufferedInputStream(fis);
		
		//response를 통해 이미 out이라는 생성된 스트림이 존재하기 때문에 오류가 발생한다.
		out.clear();
		out = pageContext.pushBody();
		
		sos= response.getOutputStream();//*****
		bos = new BufferedOutputStream(sos);
		
		while((size = bis.read(buf)) != -1)
		{
			bos.write(buf,0,size);
			bos.flush();
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
   	finally{
   	try{
   		if(fis!=null)
   			fis.close();
   		if(bis!=null)
   			bis.close();
   		if(sos!=null)
   			sos.close();
   		if(bos!=null)
   			bos.close();
   		
   	}
   	catch(Exception e){
   		e.printStackTrace();
   	}
	}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>