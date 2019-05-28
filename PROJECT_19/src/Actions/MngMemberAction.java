package Actions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.DAOManState;
import mybatis.dao.DAOMember;
import mybatis.dao.DAOTypeSeq;
import mybatis.vo.VOMember;
import mybatis.vo.VOStateMan;
import mybatis.vo.VOTypeSeq;
import util.util;

@Controller
public class MngMemberAction {
	@Autowired
	private ServletContext application;

	@Autowired
	private HttpServletRequest request;

	// DB처리를 수행하는 객체(DAO)
	@Autowired
	private DAOMember dao;
	@Autowired
	private DAOTypeSeq daoTypeSeq;

	@RequestMapping("/memberListI.inc")
	public String memberListI() {
		return "Master/mngMemberInsert"; // /Master/mngMember.jsp호출
	}

	@RequestMapping("/mngMemberInsert.inc")
	@ResponseBody
	public String insert(VOMember pVo) {

		String rS = dao.Select(pVo);
		if(rS.equals("5"))
		{
			return "5";
		}
		java.util.Date date = new java.util.Date();
		String dateR = util.Now(date, "yyyyMMdd");

		String r = daoTypeSeq.mmGetSeq("mem", dateR); // dataR =날짜 :"20190528"
		pVo.setMEMBER_SEQ(r);
		pVo.setIP_INSERT(request.getRemoteAddr());
		pVo.setIP_UPDATE(request.getRemoteAddr());
		int ri = dao.insert(pVo);
		if (ri >= 1) {
			return "1";
		} else {
			return "0";
		}

		/*
		 * VOMember[] vo = dao.Select(pVo); Map<String, Object> maps = new
		 * HashMap<String, Object>(); if(vo == null) { vo = new VOMember[0]; }
		 * maps.put("data", vo);
		 * 
		 * maps.put("total", 3); maps.put("page", 5); maps.put("records", 100);
		 * 
		 * 
		 * 
		 * return maps;
		 */

	}

	/*
	 * @RequestMapping("/memberListJqGrid.inc")
	 * 
	 * @ResponseBody public Map<String, Object> test22(VOMember pVo) { VOMember[] vo
	 * = dao.Select(pVo); Map<String, Object> maps = new HashMap<String, Object>();
	 * if (vo == null) { vo = new VOMember[0]; } maps.put("data", vo);
	 * 
	 * maps.put("total", 3); maps.put("page", 5); maps.put("records", 100);
	 * 
	 * 
	 * return maps;
	 * 
	 * }
	 */

	@RequestMapping("/memberList.inc")
	public String jqGrid() {
		return "Master/mngMember"; // /Master/mngMember.jsp호출
	}

	@RequestMapping("/member.inc")
	public String stateOneS(VOStateMan pVo) {
		try {
			VOTypeSeq vo = new VOTypeSeq();
			java.util.Date date = new java.util.Date();

			/*
			 * String dateR = util.Now(date, "yyyyMMdd"); String r =
			 * daoTypeSeq.mmGetSeq("mem",dateR); // dataR =날짜 :"20190528"
			 */

			ArrayList<String> para = new ArrayList<String>();
			para.add("1");
			/* para.add(pVo.getS_ID()); */
			VOStateMan[] ar = dao.SelectOne(para);
			int dd = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Master/mngMember"; // /Master/mngMember.jsp호출
	}
}
