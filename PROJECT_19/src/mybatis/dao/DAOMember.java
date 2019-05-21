package mybatis.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.VOMember;
import mybatis.vo.VOStateMan;
import util.sqlUtil;



public class DAOMember {

	@Autowired
	private SqlSessionTemplate ss;

	public DAOMember() {
		System.out.println("DAOMember생성!");
	}

	public void setSs(SqlSessionTemplate ss) {
		this.ss = ss;
	}

	/*
	 * public VOStateMan[] SelectAll() { VOStateMan[] ar = null;
	 * 
	 * List<VOStateMan> list = ss.selectList("ManState.all");
	 * 
	 * if (list != null && list.size() > 0) { ar = new VOStateMan[list.size()];
	 * 
	 * list.toArray(ar); }
	 * 
	 * return ar; }
	 */

	public VOMember[] Select(VOMember pVo) {
		VOMember[] ar = null;

		Map<String, String> maps = new HashMap<String, String>();
		/*
		 * maps.put("S_SUBJECT", pVo.getS_SUBJECT()); maps.put("S_CATEGORY",
		 * pVo.getS_CATEGORY());
		 */
		List<VOMember> list = ss.selectList("ManState.Search1", maps);

		if (list != null && list.size() > 0) {
			ar = new VOMember[list.size()];

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

	// 1.1멤버 변수
	// DB 연결에 필요한 객체들

	public VOStateMan[] SelectOne(ArrayList<String> pPara) throws Exception {
		VOStateMan[] ar;

		ArrayList<String> columns = new ArrayList<String>();
	
		columns.add("S_ID");
		columns.add("S_SUBJECT");
		columns.add("S_CATEGORY");
		
		StringBuilder sql = new StringBuilder(); 
		sql.append(" SELECT * FROM STATEMAN_T  ");
		sql.append(" 		WHERE S_ID  = ? ");
		ArrayList<ArrayList<String>> ListAr = sqlUtil.GetData(sql.toString(), pPara, columns);
		
		ar = new VOStateMan[ListAr.size()];
		for (int i = 0; i < ListAr.size(); i++) {
			ar[i] =  new VOStateMan();
			ar[i].setS_ID(ListAr.get(i).get(0));
			ar[i].setS_SUBJECT(ListAr.get(i).get(1));
			ar[i].setS_CATEGORY(ListAr.get(i).get(2));
		}

		return ar;

	}

	
}
