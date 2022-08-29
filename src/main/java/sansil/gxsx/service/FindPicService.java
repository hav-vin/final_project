package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Pagination;

public interface FindPicService {
	
	List<FindPic> selectFindPic();
	List<FindItPic> getlist(HttpServletRequest request, HttpSession session);
	Pagination getAjaxPagination(int selectedPage, HttpServletRequest request,HttpSession session);
	List<FindItPic> getlist(Pagination page);
	Pagination getPagination(HttpServletRequest request, HttpSession session);
}