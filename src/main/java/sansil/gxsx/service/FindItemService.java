package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;

public interface FindItemService {
	List<FindItem> finditem();

	void insertS(FindItPic findItPic);
	void deleteS(long fino);
//	FindItPic selectBySeqS(long fino); // 추정불가 메소드 ㅠㅠ
//	FindItPic UpdatefS(FiComments ficomments);
	boolean UpdateS(FindItPic findItPic);
	List<FindItPic> UpdatefS(long fino);
	
	void write(FindItPic findItPic);
	void edit(FindItPic findItPic);
	void remove(long seq);

//	FindItPicListResult getFindItPicListResult(int cp, int ps);

	
	////////////////////////////////////////////////////////////////////////////////////////////Ȯ���������(������ �������ﲨ��)
	FindItPicListResult getFindItemResultByKeyword(String fisub, int page, int pageSize);	
	List<FindItPic> selectByNameS(String fisub);
	

	Pagination getPagination(HttpServletRequest request, HttpSession session);
	Pagination getPaginationByCondition(HttpServletRequest request, HttpSession session, String option, String condition, String sorting);
	List<FindItPic> getlist(Pagination page);
//	FindItPicListResult listResult(int cp, int ps);
	FindItPicListResult listResult(String fisub, int cp, int ps);
	
	List<FindItPic> getFindItPic(long fino);
	String areaS(long fino);
	List<FindItPic> getFindRelated();
	
	List<FindItPic> getlistByCondition(Pagination page, String option, String condition, String sorting);
	
	int insertBoard(FindItem findItem);
	int insertBoardPic(Map<String, Object> paramMap);
	
	///////////////////////////////////////////////////////////////////////////////////////�ڸ�Ʈ
	List<FiComments> FindCommentList(int fino);

	ResponseListVo getListService(HashMap<String, Object> query);


	
	//FindItem 검색 서비스
	ModelAndView searchFindItem(String nextPage, String query, FindItPic findItPic, String isSearch, ModelAndView mv);

	ModelAndView getSearchOptions();
	
}