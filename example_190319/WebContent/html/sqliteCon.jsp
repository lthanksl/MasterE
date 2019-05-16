<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>oracle jdbc</title>
</head>
<body>
	<%
		Class.forName("org.sqlite.JDBC");
		Connection conn = DriverManager.getConnection("jdbc:sqlite:c:/db/DB_SAMPLE.db");
		
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery("select * from TB_MEMBERS");
		int count =0;
		while (rs.next()) {
			count++;
		}
		
		rs.close();
		conn.close();
	%>
	<%=count %>
</body>
</html>