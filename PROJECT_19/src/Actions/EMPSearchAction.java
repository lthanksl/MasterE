package Actions;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;
import spring.util.FileRenameUtil;
import spring.util.VOFile;

@Controller
public class EMPSearchAction {

	// 파일이 저장될 경로
	private String uploadPath = "/upload";
	private String uploadPathEditor = "/editor_upload";

	@Autowired
	private ServletContext application;

	@Autowired
	private HttpServletRequest request;

	// DB처리를 수행하는 객체(DAO)
	@Autowired
	private EmpDAO dao;

	@RequestMapping("/list.MASE")
	public String writeForm() {
		return "SearchAjax"; // WebContent/write.jsp호출
	}

	@RequestMapping("/list2.MASE")
	public String writeForm2() {
		return "write"; // WebContent/write.jsp호출
	}

	@RequestMapping("/write.MASE")
	public ModelAndView Search(EmpDAO vo) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("/test2.MASE")
	@ResponseBody
	public Map<String, EmpVO[]> test2() {
		String id = request.getParameter("id");
		String text = request.getParameter("text");
		EmpVO[] vo = dao.search(id, text);
		Map<String, EmpVO[]> maps = new HashMap<String, EmpVO[]>();
		maps.put("ar", vo);
		return maps;

//		EmpVO t1 = new EmpVO();
////		t1.setIdx("100");
////		t1.setName("name1");
////		t1.setEmail("email1");
////		t1.setPhone("phone1");
//		
//		
//		
//		EmpVO[] ar = new EmpVO[3];
//		ar[0] = t1;
//		
//		
//		Map<String,EmpVO[]> maps = new HashMap<String, EmpVO[]>();
//		maps.put("ar", ar);
//		
//	
//		
//		return maps;
	}

	@RequestMapping("/test3.MASE")
	@ResponseBody
	public Map<String, String> test3(MultipartHttpServletRequest request) {

		// 첨부된 파일이 저장될 위치를 절대경로화 시킨다.
		String allPath = "";

		// 첨부된 파일을 vo로부터 얻어낸다.

		Iterator<String> files = request.getFileNames();
		MultipartFile mf  = null;
		while (files.hasNext()) {
			String uploadFile = files.next();

			mf = request.getFile(uploadFile);
		
		}
		Map<String, String> maps = new HashMap<String, String>();
		try {
			// 파일이 첨부되지 않았다면 mf가 null은
			// 아니지만 용량이 0일 것이다.
			// 파일이 첨부되었는지?를 확인할 때는
			// size로 확인하면 된다.
			if (mf.getSize() > 0) {
				// 파일이 첨부되었을 때만 수행하는 곳!!!!

				// 먼저 첨부파일이 저장될 위치를
				// 절대경로로 얻어낸다.
				String path = application.getRealPath(uploadPathEditor);

				// 첨부파일명을 얻기
				String f_name = mf.getOriginalFilename();

				// 이미 저장될 파일명과 동일한지? 아닌지?는
				// 따로 확인해야 함!
				f_name = FileRenameUtil.checkFileName(path, f_name);

				// 파일업로드!!!!
				mf.transferTo(new File(path, f_name));
				/* allPath = path + "/" + f_name; */
				allPath = request.getContextPath() +"/editor_upload/"+f_name;
				maps.put("url", allPath);
			}
		} catch (Exception e) {

		}

		return maps;

//		EmpVO t1 = new EmpVO();
////		t1.setIdx("100");
////		t1.setName("name1");
////		t1.setEmail("email1");
////		t1.setPhone("phone1");
//		
//		
//		
//		EmpVO[] ar = new EmpVO[3];
//		ar[0] = t1;
//		
//		
//		Map<String,EmpVO[]> maps = new HashMap<String, EmpVO[]>();
//		maps.put("ar", ar);
//		
//	
//		
//		return maps;
	}
	@RequestMapping("/test22.MASE")
	@ResponseBody
	public Map<String, Object> test22() {
		String id = "0";
		String text = "%%";
		EmpVO[] vo = dao.search(id, text);
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("data", vo);
		return maps;

//		EmpVO t1 = new EmpVO();
////		t1.setIdx("100");
////		t1.setName("name1");
////		t1.setEmail("email1");
////		t1.setPhone("phone1");
//		
//		
//		
//		EmpVO[] ar = new EmpVO[3];
//		ar[0] = t1;
//		
//		
//		Map<String,EmpVO[]> maps = new HashMap<String, EmpVO[]>();
//		maps.put("ar", ar);
//		
//	
//		
//		return maps;
	}
	@RequestMapping("/jqGrid.MASE")
	public String jqGrid() {
		return "jqgrid_ori"; // WebContent/write.jsp호출
	}
}
