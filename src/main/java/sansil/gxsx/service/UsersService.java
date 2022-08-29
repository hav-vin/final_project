package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.LostListVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Users;
import sansil.gxsx.domain.UsersListResult;
import sansil.gxsx.domain.UsersVo;

public interface UsersService {
	List<Users> listS();
	void deleteS(String UserId);
	void deleteAllS();
	List<Users> selectPerPageS(UsersVo usersVo);
	long selectCountS();
	void updateS(Users users);
	
	UsersListResult getUsersListResult(int cp, int ps);
	UsersListResult getUsersResult(long page, long pageSize);
	UsersListResult getUsersResultByKeyword(String keyword, int page, int pageSize);
	
	List<LostListVo> getLostList(String louid, HttpServletRequest request, HttpSession session);
	List<FindListVo> getFindList(String fiuId, HttpServletRequest request, HttpSession session);
	
	Pagination getLostPagination(String louid, HttpServletRequest request, HttpSession session);
	Pagination getFindPagination(String fiuId, HttpServletRequest request, HttpSession session);
	
	/*
	 * 리턴은 Pagination->LostListVo로 넘겨야 할듯 (다음페이지의 데이터를 넘겨야해서...)
	 * @param 총 3개 selectedPage=선택한 페이지, louid=로그인된 아이디, request, session
	 * @return 리턴은 LostListVo
	 */
	Pagination getAjaxLostPagination(int selectedPage, String louid, HttpServletRequest request, HttpSession session);
	List<LostListVo> getLostListVo(Pagination page, String louid);
	
	Pagination getAjaxFindPagination(int selectedPage, String fiuid, HttpServletRequest request, HttpSession session);
	List<FindListVo> getFindListVo(Pagination page, String fiuid);
	
	List<FindListVo> fselectByNameS(HashMap searchmap);
	List<LostListVo> lselectByNameS(HashMap searchmap);
	
	void editPwdS(HashMap editmap);
	void editProfileS(Users editUser);
	void leaveUserS(String userid);
}
