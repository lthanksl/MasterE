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

import com.sun.org.apache.bcel.internal.generic.Select;

import mybatis.vo.VOTypeSeq;
import oracle.jdbc.OracleConnection.CommitOption;
import util.sqlUtil;

public class DAOTypeSeq {

	@Autowired
	private SqlSessionTemplate ss;

	public DAOTypeSeq() {
		System.out.println("DAOTypeSeq생성!");
	}

	public void setSs(SqlSessionTemplate ss) {
		this.ss = ss;
	}

//3-11.3insert
	public String insert(VOTypeSeq pVo) {
		VOTypeSeq[] ar = null;

		
		int result = ss.insert("MngTypeSeq.insert", pVo);
		/*
		 * if (result > 0) ss.commit(); else ss.rollback();
		 */
		return "저장되었습니다.";

	}

	// 3-11.3insert 끝
	// 3-12.3select
	public VOTypeSeq Select(VOTypeSeq pVo) {


		VOTypeSeq r = ss.selectOne("MngTypeSeq.Search", pVo);
		return r;
	}
	public String SelectSeq(VOTypeSeq pVo) {


		String r = ss.selectOne("MngTypeSeq.SearchSeq", pVo);
		return r;
	}
	// 3-12.3select 끝
	//3-13.3update
	public String update(VOTypeSeq pVo) {
		int result = ss.update("MngTypeSeq.update", pVo);
		
		return "수정되었습니다.";

	}
	public String mmGetSeq(String type,String date) {
		VOTypeSeq pVo = new VOTypeSeq();
		pVo.setCLASS_TYPE(type);
		pVo.setSEQ_DATE(date);
		VOTypeSeq r =this.Select(pVo);
		if(r != null) 
			pVo.setMAX_NUM(r.getMAX_NUM());
		if(r == null || r.equals(""))
		{
			this.insert(pVo);
		}
		else
		{
			this.update(pVo);
		}
		String R =this.SelectSeq(pVo);
		return R;
	}
	

}
