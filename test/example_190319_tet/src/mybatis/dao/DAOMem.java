package mybatis.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.common;
import mybatis.service.FactoryService;
import mybatis.vo.VOMem;

public class DAOMem {
	/* <!-- 1-1.1insert --> */
	// 회원 추가시 JSP에서 입력 받은 값들을 인자로
	// 받아야 한다.
	public static boolean insert(String ID, String NAME, String PW, String EMAIL, String PHONE,String ADDR) {
		boolean is = false;
		try {
	
		// 인자로 받은 값들을 mybatis 환경으로 보내기 위해 Map구조로 다시 포장해야 한다.
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();

		map.put("ID", ID);
		map.put("NAME", NAME);
		map.put("PW", PW);
		map.put("EMAIL", EMAIL);
		map.put("PHONE", PHONE);
		map.put("ADDR", ADDR);

		int result = ss.insert("mem.insert", map);

		
		if (result > 0) {
			ss.commit();
			is = true;
		} else {
			ss.rollback();
		}
		ss.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return is;

	}
	/* <!-- 2-1.1insert --> */
	/* <!-- 1-2.2select --> */
	public static boolean checkId(String ID) {
		boolean value = false;
		try {
			
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection("jdbc:sqlite:c:/db/DB_SAMPLE.db");
			
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("SELECT ID FROM TB_MEMBERS WHERE ID = '"+ID+"' ");
			int count =0;
			while (rs.next()) {
				count++;
			}
			
			
			return value;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return false;
	}
	
	public static VOMem login(String ID,String PW) {
		
		try {
			SqlSession ss = FactoryService.getFactory().openSession();
			Map<String, String> map = new HashMap<String, String>();

			map.put("ID", ID);
			map.put("PW", PW);
			
			VOMem voMem = ss.selectOne("mem.login",map);

			return voMem;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	/* <!-- 2-2.2select 끝 --> */

}
