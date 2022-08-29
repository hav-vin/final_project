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
	 * ������ Pagination->LostListVo�� �Ѱܾ� �ҵ� (������������ �����͸� �Ѱܾ��ؼ�...)
	 * @param �� 3�� selectedPage=������ ������, louid=�α��ε� ���̵�, request, session
	 * @return ������ LostListVo
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
