<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//첨부된 파일이 저장될 위치를 절대경로화 시킨다.
	String path = application.getRealPath("/editor_upload");
	
	MultipartRequest mr = 
		new MultipartRequest(request, path, 
				1024*1024*5, "utf-8",
				new DefaultFileRenamePolicy());
	//다시 요청한 곳으로 저장된 파일의 경로를
	//보내줘야 하기 때문에 정확한 이름과 경로를 
	//JSON표기법으로 출력하자!
	String f_name = null;
	File f = mr.getFile("upload");
	if(f != null)
		f_name = f.getName();//저장된 파일명
%>    
{
	"url":"<%=request.getContextPath() %>/editor_upload/<%=f_name %>"
}

