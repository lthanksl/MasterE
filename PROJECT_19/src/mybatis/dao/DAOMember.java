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
import mybatis.vo.VOTypeSeq;
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
	//3-11.3insert
		public int insert(VOMember pVo) {

			int result = ss.insert("MngMember.insert", pVo);
			/*
			 * if (result > 0) ss.commit(); else ss.rollback();
			 */
			return result;

		}

		// 3-11.3insert 끝
		
		//3-12.3select
	

	public String SelectOne(VOMember pVo) {
		VOMember[] ar = null;

		Map<String, String> maps = new HashMap<String, String>();
		
		
		List<VOMember> list = ss.selectList("MngMember.Search1", pVo);

		if (list != null && list.size() > 0) {
			return "5";
		}
		else
			return "4";

		
	}
	public VOMember[] Select(VOMember pVo) {
		VOMember[] ar = null;

		List<VOMember> list = ss.selectList("MngMember.Search", pVo);

		if (list != null && list.size() > 0) {
			ar = new VOMember[list.size()];
			list.toArray(ar);
		}
		
		return ar;

		
	}
	//3-12.3select 끝


//임베디드 쿼리 샘플
	public VOStateMan[] SelectEmbedeedsql(ArrayList<String> pPara) throws Exception {
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
