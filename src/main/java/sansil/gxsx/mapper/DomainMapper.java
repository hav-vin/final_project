package sansil.gxsx.mapper;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Notice;
import sansil.gxsx.domain.NoticeVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Users;

public interface DomainMapper {
	////////// 메인  //////////
	List<LostItem> listlo();
	List<FindItem> listfi();
	List<LostPic> listlopic();
	List<FindPic> listfipic();
	void signup(Users users);
	Users login(HashMap loginmap);
	Users usercheck(String kid); //카카오로그인시 등록되어있는 회원인지 확인
	void kakaouser(Users kakaouser);
	int idcheck(String userid);
	
	////////// 공지사항  //////////
	List<NoticeVo> noticelist(Pagination listpage);
	List<NoticeVo> noticesearch(HashMap searpaging);
	long noticecount();
	long noticeScount(String query);
	Notice noticecon(int nono);
	Notice noticeup(int nono);
	Notice noticedown(int nono);
	
	String userpower(String userid);
	void noticewrite(Notice notice);
	void noticeedit(Notice notice);
	void noticedel(int nono);
}
