package Actions;

import java.io.File;
import java.io.FileInputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.DataVO;


@Controller
public class DataController {

	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/data.MASE",method = RequestMethod.GET)
	public ModelAndView data() {
		ModelAndView mv = new ModelAndView();
		try {
			
			//공공데이터 서버와 연결하기 위해 필요한 객체
			//가이드 23페이지의 하단 요청경로를 URL에 붙어넣고
			//맨 뒤에 날짜와 인증키를 수정한다.
//			URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=jxUWYWwiFSosMQ67GEYEl9NK3ttW4BhISpc46m77Rg7yZFxlvsLYhHMMSqVLaC5S43pb6B97%2BO4Pnd%2BXpbgQqg%3D%3D&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&eventStartDate=20190501"); 
//			
//			//연결객체 생성
//			HttpURLConnection conn = ((HttpURLConnection)url.openConnection());
//			
//			//마인 타입
//			conn.setRequestProperty("Content-Type", "application/xml");
//			
//			conn.connect();
			
			//JDOM활용
			//mvnrepository사이트에서 "jdom"으로 검색하여 
			// org.jdom >> jdom2 항목을 선택하여 dependency를 pom.xml로 추가
			

			
			String filepath = "data.xml";
			SAXBuilder builder = new SAXBuilder(); 
			FileInputStream fis = new FileInputStream(new File(request.getSession().getServletContext().getRealPath(filepath)));
			org.jdom2.Document doc = builder.build(fis);
			Element root = doc.getRootElement();
			Element body = root.getChild("body");
			Element items = body.getChild("items");
			List<Element> item_list = items.getChildren("item");
			for (Element element : item_list) {
				System.out.println(element.getName() +":" + element.getValue());
			}
			
			DataVO[] ar = new DataVO[item_list.size()];
			int i = 0;
			for (Element element : item_list) {
				String title =element.getChildText("title");
				String eventstartdate =element.getChildText("eventstartdate");
				String firstimage =element.getChildText("firstimage");
				String firstimage2 =element.getChildText("firstimage2");
				
				String addr1 =element.getChildText("addr1");
				String addr2 =element.getChildText("addr2");
				String mapx =element.getChildText("mapx");
				String mapy =element.getChildText("mapy");
				
				DataVO vo = new DataVO();
				vo.setTitle(title);
				vo.setEventstartdate(Integer.parseInt(eventstartdate) );
				vo.setFirstimage(firstimage);
				vo.setFirstimage2(firstimage2);
				vo.setMapx(Double.valueOf( mapx));
				vo.setMapy(Double.valueOf( mapy));
				vo.setAddr1(addr1);
				vo.setAddr2(addr2);
			
				ar[i] = vo;
				i++;
			}
			
			fis.close();
			System.out.println(root.getName());
			mv.addObject("ar", ar[0]);
			mv.addObject("ars", ar);
			mv.setViewName("data");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
}
