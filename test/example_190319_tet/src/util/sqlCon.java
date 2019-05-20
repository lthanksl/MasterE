package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public  class sqlCon {
	// DB 연결에 필요한 객체들
	static Connection con;
	static PreparedStatement psSearch;
	static ResultSet rs;
	static String driver = "oracle.jdbc.OracleDriver";
	static String dbURL = "jdbc:oracle:thin:@192.168.0.35:1521:xe";
	static String user = "hr";
	static String pw = "1111";

	public static java.sql.Connection con() throws Exception {
		Class.forName(driver);
		con = DriverManager.getConnection(dbURL, user, pw);
		return con;
	}
}
