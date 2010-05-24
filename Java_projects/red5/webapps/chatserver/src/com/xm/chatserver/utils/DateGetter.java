package com.xm.chatserver.utils;

import java.util.Date;

public class DateGetter {
	public static String getCurrentDate() {
		Date date = new Date();
		return date.getMonth() + "-" + date.getDate() + " " + date.getHours()
				+ ":" + date.getMinutes() + ":" + date.getSeconds();
	}
}
