package birthDay.mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import birthDay.mybatis.service.FactoryService;
import birthDay.mybatis.vo.VOBirthD;


public class DAOBirDay {
	/* <!-- 1-1.1insert --> */
	// 회원 추가시 JSP에서 입력 받은 값들을 인자로
	// 받아야 한다.( NAME,WRITER,DATE1,IDX )
	public static boolean insert(String NAME, String WRITER, String DATE1) {
		boolean is = false;
		try {
	
		// 인자로 받은 값들을 mybatis 환경으로 보내기 위해 Map구조로 다시 포장해야 한다.
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("NAME", NAME);
		map.put("WRITER", WRITER);
		map.put("DATE1", DATE1);
		
		int result = ss.insert("birDay.insert", map);

		
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

	public static VOBirthD[] getSearchAll() {
		SqlSession ss = FactoryService.getFactory().openSession();
		VOBirthD[] ar = null;
		try {
			List<VOBirthD> list = ss.selectList("birDay.total");
			if (list != null && list.size() > 0) {
				ar = new VOBirthD[list.size()];

				// list의 킉와 똑같은 크기의 배열을 준비한 이유는 한번에 list의 //내요을 배열로 복사하기 위해서다.
				list.toArray(ar);

			}
			else
			{
				ar = new VOBirthD[list.size()];
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	

		
		ss.close();
		return ar;

	}
	public static VOBirthD getSearchID(String IDX) {
		
		try {
			SqlSession ss = FactoryService.getFactory().openSession();
			
			VOBirthD vo = ss.selectOne("birDay.searchId",IDX);

			return vo;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return new VOBirthD();
	}
	/* <!-- 2-2.2select 끝 --> */

	/* <!-- 1-3.3update -> */
	public static boolean update(String NAME, String WRITER, String DATE1, String IDX){
		boolean is = false;
		try {
			SqlSession ss = FactoryService.getFactory().openSession();
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("NAME", NAME);
			/* map.put("NAME", NAME); */
			map.put("WRITER", WRITER);
			map.put("DATE1", DATE1);
			map.put("IDX", IDX);

			int result = ss.update("birDay.update", map);
			
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
	/* <!-- 1-3.3update 끝 --> */

}
