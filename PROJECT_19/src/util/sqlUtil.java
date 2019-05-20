package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public  class sqlUtil {
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
	
	public static ArrayList<ArrayList<String>> GetData(String sql, ArrayList<String> pPara, ArrayList<String> pColumns)
			throws Exception, SQLException {
		con = sqlUtil.con();
		psSearch = con.prepareStatement(sql);
		for (int i = 1; i <= pPara.size(); i++) {
			psSearch.setString(i, pPara.get(i-1));
		}

		rs = psSearch.executeQuery();

		ArrayList<String> Lists1 = new ArrayList<String>();
		ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
		int count =0;
		while (rs.next()) {
			for (int i = 0; i < pColumns.size(); i++) {
				Lists1.add(rs.getString(pColumns.get(i)));
				
			}
			data.add(Lists1);
			count++;
		}
		
		
		return data;

	}
}
