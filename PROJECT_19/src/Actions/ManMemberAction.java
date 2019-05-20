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

import mybatis.vo.VOStateMan;


@Controller
public class ManMemberAction {
	@Autowired
	private ServletContext application;

	@Autowired
	private HttpServletRequest request;

	// DB처리를 수행하는 객체(DAO)
	@Autowired
	private DAOManState dao;
	
	
	
	@RequestMapping("/member.inc")
	public String stateOneS(VOStateMan pVo) {
		try {
			ArrayList<String> para = new ArrayList<String>();
			para.add("1");
			/* para.add(pVo.getS_ID()); */
			VOStateMan[] ar = dao.SelectOne(para);
			int dd = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Master/mngMember"; // ??/mngManState.jsp호출
	}
}
