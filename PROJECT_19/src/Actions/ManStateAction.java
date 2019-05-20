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
import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;
import mybatis.vo.VOStateMan;

@Controller
public class ManStateAction {
	@Autowired
	private ServletContext application;

	@Autowired
	private HttpServletRequest request;

	// DB처리를 수행하는 객체(DAO)
	@Autowired
	private DAOManState dao;

	@RequestMapping("/stateListJqGrid.MASE")
	@ResponseBody
	public Map<String, Object> test22(VOStateMan pVo) {
		VOStateMan[] vo = dao.Select(pVo);
		Map<String, Object> maps = new HashMap<String, Object>();
		if (vo == null) {
			vo = new VOStateMan[0];
		}
		maps.put("data", vo);
		/*
		 * maps.put("total", 3); maps.put("page", 5); maps.put("records", 100);
		 */

		return maps;

	}

	@RequestMapping("/stateList.MASE")
	public String jqGrid() {
		return "mngManState"; // ??/mngManState.jsp호출
	}

	@RequestMapping("/stateOneS.MASE")
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
		return "mngManState"; // ??/mngManState.jsp호출
	}

}
