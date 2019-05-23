package spring.util;

import java.io.File;

public class FileRenameUtil {
	
	public static String checkFileName(String path,String fname)
	{
		//인자인 fname에서 확장자를 뺀 파일명 가려내자
		//그렇게 하려면 먼저 "."의 위치를 알아내야 함!
		int period = fname.lastIndexOf(".");
		
		//파일명과 확장자를 분리한다.
		String name = fname.substring(0,period);
		String suffix = fname.substring(period);//확장자
		
		//전체경로
		/* String savePath = path+ "/" + fname; */
		String savePath = path+ System.getProperty("file.separator") + fname;
		
		//이제 위의 경로를 가지고 java.io.File객체를 생성하자!(이유는 파일의 존재여부를
		//확인하기 위해서다. -exists())
		File f = new File(savePath);
		
		//같은 이름이 있을 경우 파일명 뒤에 숫자를 붙여줘야 한다.(int형 변수 필요)
		int idx = 1;
		
		//같은 이름의 파일이 있는 경우 파일명 뒤에 숫자를 붙여 파일명을 변경함!
		while (f.exists()) {	
			StringBuffer sb = new StringBuffer();
			sb.append(name);
			sb.append(idx++);
			sb.append(suffix);//확장자
			
			fname = sb.toString();
			
			savePath = path+ System.getProperty("file.separator") + fname;
			
			f = new File(savePath);
		}
		
		return fname;
	}
}
