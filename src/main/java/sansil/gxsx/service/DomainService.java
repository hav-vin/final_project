package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Notice;
import sansil.gxsx.domain.NoticeVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Users;

public interface DomainService {
	////////// 메인  //////////
	List<LostItem> listloS();
	List<FindItem> listfiS();
	List<LostPic> listlopicS();
	List<FindPic> listfipicS();
	void signupS(Users users);
	Users loginS(HashMap loginmap);
	Users kakaologinS(String kid);
	Users kakaouser(Users kakaouser);	
	int idCheckS(String userid);
	
	////////// 공지사항  //////////
	List<NoticeVo> noticeListS(Pagination listpage);
	List<NoticeVo> noticeSearchS(HashMap searpaging);
	Notice noticeConS(int nono);
	Notice noticeUp(int nono);
	Notice noticeDown(int nono);
	String userPowerS(String userid);
	void noticeWriteS(Notice notice);
	void noticeEditS(Notice notice);
	void noticeDelS(int nono);
	
	Pagination getPagination(HttpServletRequest request, HttpSession session);
	Pagination getPaginationS(HttpServletRequest request, HttpSession session, String query);
}
