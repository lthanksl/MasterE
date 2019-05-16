package common;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;

public class common {
	public static Map<String, String> MMSettingToFile(String Path, ServletContext pApplication) {
		// "/WEB-INF/action.properties"

		// 받은 action.properties파일의 경로를
		// 절대경로화 시킨다.
		// 서블릿에서는 application을 직접 구해야 한다.
		ServletContext application = pApplication;
		String path = application.getRealPath(Path);

		// 절대경로화 시킨 이유는
		// 해당 파일의 내용(클래스 경로들)을 스트림을
		// 이용하여 읽어와서 properties객체에 담기 위함이다.

		Properties props = new Properties();

		// Properties의 load함수를 이용하여 내용들을 읽기를 수행해야 한다.
		// 이때 필요한 것이 InputStream이다.
		FileInputStream fis = null;
		try {
			// action.properties파일과 연결되는 스트림
			fis = new FileInputStream(path);
			// action.properties 내용들을 읽어서 비어있던 Properties객체에
			// 키와 값을 쌍으로 저장했다.
			// 예)greet ---> "am.action.GreetAction"
			props.load(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
		////////////////////////////////////////////////////////////
		/// 생성할 객체들의 경로가 모두 properties로 저장 되었다. 하지만 현재 컨트롤 입장에서는 생성할
		/// 객체가 몇개이며, 어떤 객체인지? 알지 못한다. Properties에 저장된 키들을 모두 가져와 봐야
		/// 알수 있다.
		////////////////////////////////////////////////////////////

		Iterator<Object> it = props.keySet().iterator();

		// 키들을 모두 얻었으니 키에 연결된 클래스 경로를 하나씩 얻어내어 객체를 생성한 후
		// actionMap에 저장하자!
		Map<String, String> Maps = new HashMap<String, String>();
		while (it.hasNext()) {
			// 먼저 키를 하나 가져와서 문자열로 변환
			String key = (String) it.next();
			// 위에서 얻어낸 키와 연결된 Value를 얻자!
			// "am.action.%
			String value = props.getProperty(key);
			/* actionMap.put(key, value); */
			Maps.put(key, value);

			/*
			 * try { Object obj = Class.forName(value).newInstance(); actionMap.put(key,
			 * (Action) obj); } catch (Exception e) { e.printStackTrace(); }
			 */
		} // while 끝
		return Maps;
	}

	public void dbcon() {

//		try {
//
//			Connection conn = null;
//			// db parameters
//			String url = "jdbc:sqlite:C:/DB/Ones.db";
//			// create a connection to the database
//			conn = DriverManager.getConnection(url);
//			Statement statement = conn.createStatement();
//
//			String sql = "";
//
//			statement.executeUpdate(sql);
//			System.out.println(sql);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}

	}
}
