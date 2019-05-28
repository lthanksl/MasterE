package util;

import java.text.SimpleDateFormat;

public class util {

	public static String Now(java.util.Date date, String pFormat) {
		SimpleDateFormat formatter = new SimpleDateFormat(pFormat);
		String format = formatter.format(date);
		return format;
	}
}
