package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.EmpVO;

public class EmpDAO {

	@Autowired
	private SqlSessionTemplate ss;

	public EmpDAO() {
		System.out.println("EmpDAO생성!");
	}
	public void setSs(SqlSessionTemplate ss) {
		this.ss = ss;
	}
	
	public EmpVO[] search(String type, String value) {
		
		EmpVO[] ar = null;
		
		//인자값 type을 searchType으로,
		// value를 searchValue로 Map에 저장
		Map<String, String> map = 
			new HashMap<String, String>();
		map.put("searchType", type);
		map.put("searchValue", value);
		
		List<EmpVO> list = ss.selectList("emp.Search1", map);
		
		if(list != null && list.size() > 0) {
			ar = new EmpVO[list.size()];
			
			list.toArray(ar);
		}
		
		return ar;
	}
}








