package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import mybatis.vo.VOStateMan;

public class DAOManState {

	@Autowired
	private SqlSessionTemplate ss;

	
	public DAOManState() {
		System.out.println("DAOManState생성!");
	}

	public void setSs(SqlSessionTemplate ss) {
		this.ss = ss;
	}

	public VOStateMan[] SelectAll() {
		VOStateMan[] ar = null;

		List<VOStateMan> list = ss.selectList("ManState.all");

		if (list != null && list.size() > 0) {
			ar = new VOStateMan[list.size()];

			list.toArray(ar);
		}

		return ar;
	}
	
	public VOStateMan[] Select(VOStateMan pVo) {
		VOStateMan[] ar = null;

		Map<String, String> maps = new HashMap<String, String>();
		maps.put("S_SUBJECT", pVo.getS_SUBJECT());
		maps.put("S_CATEGORY", pVo.getS_CATEGORY());
		List<VOStateMan> list = ss.selectList("ManState.Search1",maps);

		if (list != null && list.size() > 0) {
			ar = new VOStateMan[list.size()];

			list.toArray(ar);
		}

		return ar;
	}
	/*
	 * public EmpVO[] search(String type, String value) {
	 * 
	 * EmpVO[] ar = null;
	 * 
	 * //인자값 type을 searchType으로, // value를 searchValue로 Map에 저장 Map<String, String>
	 * map = new HashMap<String, String>(); map.put("searchType", type);
	 * map.put("searchValue", value);
	 * 
	 * List<EmpVO> list = ss.selectList("emp.Search1", map);
	 * 
	 * if(list != null && list.size() > 0) { ar = new EmpVO[list.size()];
	 * 
	 * list.toArray(ar); }
	 * 
	 * return ar; }
	 */
}
