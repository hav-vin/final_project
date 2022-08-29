package sansil.gxsx.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.LostItemListResult;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;

public interface LostitemXXservice {
	
	List<LostItemPicVo> list();
//	List<LostItemPicVo> getlist(HttpServletRequest request, HttpSession session);
//	Pagination getAjaxPagination(int selectedPage, HttpServletRequest request,
//							HttpSession session);
	List<LostItemPicVo> getlist(Pagination page);
	Pagination getPagination(HttpServletRequest request, HttpSession session);

	
	void insertS(LostItemPicVo lostitem);
	
	void insertP(LostItemPicVo lostitem, ArrayList<MultipartFile> files);

	
	
	List<LostItemPicVo> ContentS(int lono);
	String areaS(int lono);
	void deleteS(int lono);
	List<LostItemPicVo> UpdatefS(int lono);
	boolean UpdateS(LostItemPicVo lostitem);
	List<LostItemPicVo> getLostRelated();
	
	///////////////////////////////////////////////////////
	
	LostItemListResult getLostItemResultByKeyword(String losub, int page, int pageSize);	
	List<LostItemPicVo> selectByNameS(String losub);
	
	Pagination getPaginationByCondition(HttpServletRequest request, HttpSession session, String option, String condition, String sorting);
	
	
	LostItemListResult listResult(String losub, int cp, int ps);
	
	
	List<LostItemPicVo> getlistByCondition(Pagination page, String option, String condition, String sorting);
	
	ResponseListVo getListService(HashMap<String, Object> query);
	
	
	//FindItem 검색 서비스
	ModelAndView searchLostItem(String nextPage, String query, LostItemPicVo lostitem, String isSearch, ModelAndView mv);
	
	ModelAndView getSearchOptions();
	
}