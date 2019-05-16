package birthDay.mybatis.service;



import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {//static초기화 역역
		try {
			
		
		Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
		
		factory =new SqlSessionFactoryBuilder().build(r);
		r.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
