package sansil.gxsx.utils;

import javax.servlet.http.HttpSession;

public class PagingUtil {
	private int cp = 1;
	private int ps = 8;
	
	public PagingUtil(String cpStr, String psStr, HttpSession session) {
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			System.out.println("24!!!!!!!!!!!!!: "+ps);
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			System.out.println("30!!!!!!!!!!!!!: "+psStr);
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
	}

	public int getCp() {
		return cp;
	}

	public int getPs() {
		return ps;
	}
}
