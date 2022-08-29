package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemResult;
import sansil.gxsx.domain.LostItemVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.mapper.LostItemMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("LostItem")
@AllArgsConstructor
public class LostItemServiceImpl implements LostItemService {
	@Autowired
	private LostItemMapper lostitemMapper;
	
	@Override
	public List<LostItem> Lostitem() {
		return lostitemMapper.selectLostitem();
	}	

	@Override
	public void insertS(LostItem lostitem) {
		lostitemMapper.insert(lostitem);
	}

	@Override
	public void deleteS(int lono) {
		lostitemMapper.delete(lono);
	}


	@Override
	public LostItem UpdatefS(int lono) {
		return lostitemMapper.Updatef(lono);
	}

	@Override
	public boolean UpdateS(LostItem lostitem) {
		return lostitemMapper.Update(lostitem);
	}
	
	//////////////////////////////////////////////////////////////////////
	@Override
	public LostItemResult getLostItemResult(int page, int pageSize) {
		long totalCount = lostitemMapper.selectCount();
		LostItemVo lostitemvo = new LostItemVo(null, page, pageSize);
		List<LostItem> list = lostitemMapper.selectPerPage(lostitemvo);
		
		return new LostItemResult(page, pageSize, totalCount, list);
	}
	
	@Override
	public List<LostItemPicVo> list() {
		return lostitemMapper.list();
	}
	
	@Override
	public Pagination getPagination(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		LostItem query = new LostItem();
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Long listCount = lostitemMapper.selectCountLostitem();

		return new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs());
	}
	
	@Override
	public List<LostItemPicVo> getlist(Pagination page) {
		log.info("#>getlist() page: "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+page.getEndPage()+"/"+page.getPageSize());

		return lostitemMapper.selectPerPage(page);
	}
	
	@Override
	public Pagination getAjaxPagination(int selectedPage, HttpServletRequest request, HttpSession session) {
		long listCount = lostitemMapper.selectCountLostitem();
		PagingUtil page = new PagingUtil(null,null,session);
		
		return new Pagination(listCount, selectedPage, page.getPs());
	}
	
	@Override
	public LostItemPicVo ContentS(int lono) {
		return lostitemMapper.Content(lono);
	}
	
	@Override
	public String areaS(int lono) {
		return lostitemMapper.area(lono);
	}
}
