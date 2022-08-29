package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemResult;
import sansil.gxsx.domain.Pagination;

public interface LostItemService {
	
	void insertS(LostItem lostitem);
	void deleteS(int lono);
	LostItem UpdatefS(int lono);
	boolean UpdateS(LostItem lostitem);
	
	List<LostItem> Lostitem();
	
	///////////////////////////////////////////////////////////
	LostItemResult getLostItemResult(int page, int pageSize);
	List<LostItemPicVo> list();
	Pagination getPagination(HttpServletRequest request, HttpSession session);
	List<LostItemPicVo> getlist(Pagination page);
	Pagination getAjaxPagination(int selectedPage, HttpServletRequest request,
			HttpSession session);
	LostItemPicVo ContentS(int lono);
	String areaS(int lono);
	
}
