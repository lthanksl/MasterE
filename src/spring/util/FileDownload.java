package spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/FileDownload")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값들 받기(dir, filename)
		request.setCharacterEncoding("utf-8");
		String dir = request.getParameter("dir");
		String filename = 
			request.getParameter("filename");
		
		//dir을 절대경로화 시켜야 한다.
		// jsp처럼 application이 내장객체로 존재하지
		//않지만 application의 자료형이 
		//ServletContext다. 서블릿에서는 메서드로 
		//제공된다.
		String path = 
			getServletContext().getRealPath(dir);
		
		//다시 파일명과 연결시키자
		String fullPath = path+
			System.getProperty("file.separator")+filename;
		
		//전체경로가 준비되었으니 파일을 보내기 위해
		//파일 객체로 생성하자!
		File f = new File(fullPath); 
				
		byte[] buf = new byte[2048];//바구니 역활
		
		//전송할 데이터가 스트림 처리될 때 문자셋 지정
		response.setContentType(
			"application/octet-stream;charset=8859_1");
		
		//다운로드 대화상자 처리
		response.setHeader("Content-Disposition", 
			"attachment;filename="+
			new String(
				filename.getBytes("utf-8"),"8859_1"));
		
		//전송타입이 이진데이터(binary)
		response.setHeader("Content-Transfer-Encoding",
				"binary");
		
		if(f.isFile()) {
			BufferedInputStream bis = 
				new BufferedInputStream(
					new FileInputStream(f));
			
			//요청한 곳으로 보내기 위해
			//스트림을 요청객체로 부터 얻어낸다.
			BufferedOutputStream bos =
				new BufferedOutputStream(
					response.getOutputStream());
			
			int size = -1;
			try {
				//읽어서 보내기
				while((size = bis.read(buf)) != -1) {
					
					bos.write(buf,0,size);//보내기
					bos.flush();//스트림 비우기
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
