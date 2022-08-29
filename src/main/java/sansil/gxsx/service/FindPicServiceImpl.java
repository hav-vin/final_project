package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.mapper.FindPicMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("FindPic")
@AllArgsConstructor
public class FindPicServiceImpl implements FindPicService {
		
	private FindPicMapper findpicMapper;

	@Override
	public List<FindPic> selectFindPic() {
		return findpicMapper.selectFindPic();
	}	
	@Override
	public List<FindItPic> getlist(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);
		FindItPic query = new FindItPic();
		Long listCount = findpicMapper.selectCountFindItPic();
		query.setPaging(new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs()));
		List<FindItPic> findItPic = findpicMapper.list();
		System.out.println("asdasdasdaTLqkf" + pagingutil.getPs());
		return findItPic;
	}

	@Override
	public Pagination getAjaxPagination(int selectedPage, HttpServletRequest request, HttpSession session) {
		long listCount = findpicMapper.selectCountFindItPic();
		PagingUtil page = new PagingUtil(null,null,session);
		
		return new Pagination(listCount, selectedPage, page.getPs());
	}

	@Override
	public List<FindItPic> getlist(Pagination page) {
		log.info("#>getlist() page: "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+page.getEndPage()+"/"+page.getPageSize());

		return findpicMapper.selectPerPage(page);
	}

	@Override
	public Pagination getPagination(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		FindItPic query = new FindItPic();
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Long listCount = findpicMapper.selectCountFindItPic();

		return new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs());
	} 

}
