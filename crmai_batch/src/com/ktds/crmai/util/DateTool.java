package com.ktds.crmai.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTool {

	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	
	
	public static String getTimestamp(){
		
		//method 1
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //System.out.println(timestamp);

        //method 2 - via Date
        Date date = new Date();
        //System.out.println(new Timestamp(date.getTime()));

        //return number of milliseconds since January 1, 1970, 00:00:00 GMT
        //System.out.println(timestamp.getTime());
		
		String stamp = sdf.format(timestamp);
		
		return stamp;
	}

}
