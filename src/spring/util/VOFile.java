package spring.util;

import org.springframework.web.multipart.MultipartFile;

public class VOFile {
	//첨부파일
		private MultipartFile upload;

		public MultipartFile getUpload() {
			return upload;
		}

		public void setUpload(MultipartFile upload) {
			this.upload = upload;
		}
		
}
