package sansil.gxsx.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemListResult;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.mapper.LostitemXXMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("LostitemXXMapper")
@AllArgsConstructor
public class LostitemXXserviceImpl implements LostitemXXservice {

	private LostitemXXMapper lostitemxxMapper;
	private FileUploadservice fileuploadsevice;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	@Override
	public List<LostItemPicVo> list() {
		
		return lostitemxxMapper.list();
	}

//	@Override
//	public List<LostItemPicVo> getlist(HttpServletRequest request, HttpSession session) {
//		String cpStr = request.getParameter("cp");
//		String psStr = request.getParameter("ps");
//		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);
//		LostItemPicVo query = new LostItemPicVo();
//		Long listCount = lostitemxxMapper.selectCountLostitem();
//		query.setPaging(new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs()));
//		List<LostItemPicVo> lostitem = lostitemxxMapper.list();
//		System.out.println("asdasdasdaTLqkf" + pagingutil.getPs());
//		System.out.println("@!@#!@#!@#!@#" + lostitem);
//		log.info("@!@#!@#!@#!@#" + lostitem);
//		return lostitem;
//	}

//	@Override
//	public Pagination getAjaxPagination(int selectedPage, HttpServletRequest request, HttpSession session) {
//		long listCount = lostitemxxMapper.selectCountLostitem();
//		PagingUtil page = new PagingUtil(null,null,session);
//		
//		return new Pagination(listCount, selectedPage, page.getPs());
//	}

	@Override
	public List<LostItemPicVo> getlist(Pagination page) {
//		LostItem query = new LostItem();
//		query.setPaging(page);
		log.info("#>getlist() page: "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+page.getEndPage()+"/"+page.getPageSize());
//		HashMap<String, Object> query = new HashMap<String, Object>();
//		query.put("page", page);
		return lostitemxxMapper.selectPerPage(page);
	}

	@Override
	public Pagination getPagination(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		LostItem query = new LostItem();
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Long listCount = lostitemxxMapper.selectCountLostitem();

		return new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs());
	}
	@Override
	public void insertS(LostItemPicVo lostitem) {
		lostitemxxMapper.insert(lostitem);
		
	}
	@Override
	public void insertP(LostItemPicVo lostitem, ArrayList<MultipartFile> files) {
		lostitemxxMapper.insert(lostitem);
		for(MultipartFile file : files) {
            String ofname = file.getOriginalFilename();
            if(ofname != null) {
                ofname = ofname.trim();
                if(ofname.length() != 0) {
                	lostitem.setLopicname(ofname);
                	lostitemxxMapper.insert1(lostitem);
                    String url = fileuploadsevice.saveStore2(file);
                }
            }
        }
	int get_lono = lostitem.getLono();
	}
	
	@Override
	public List<LostItemPicVo> ContentS(int lono) {
		return lostitemxxMapper.Content(lono);
	}
	@Override
	public String areaS(int lono) {
		return lostitemxxMapper.area(lono);
	}
	@Override
	public void deleteS(int lono) {
		lostitemxxMapper.delete(lono);
	}
	@Override
	public List<LostItemPicVo> UpdatefS(int lono) {
		return lostitemxxMapper.Updatef(lono);
	}

	@Override
	public boolean UpdateS(LostItemPicVo lostitem) {
		return lostitemxxMapper.Update(lostitem);
	}
	@Override
	public List<LostItemPicVo> getLostRelated(){
		return lostitemxxMapper.getLostRelated();
	}

	@Override
	public LostItemListResult getLostItemResultByKeyword(String losub, int page, int pageSize) {
		List<LostItemPicVo> list = selectByNameS(losub);
		long totalCount = lostitemxxMapper.selectCount();		
		return new LostItemListResult(page, pageSize, totalCount, list);
	}	

	@Override
	public List<LostItemPicVo> selectByNameS(String query){
		return lostitemxxMapper.selectByName(query);
	}

	@Override
	public Pagination getPaginationByCondition(HttpServletRequest request, HttpSession session, String option, String condition, String sorting) {
		System.out.println("==============> getPaginationByCondition Start");
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");

		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("option", option);
		paramMap.put("condition", condition);
		paramMap.put("sorting", sorting);

		Long listCount = lostitemxxMapper.selectCountByCondition(paramMap);
		System.out.println("listCount ==> " + listCount);
		return new Pagination(listCount, pagingutil.getCp(), pagingutil.getPs());
	}

	@Override
	public 	LostItemListResult listResult(String losub, int page, int pageSize) {
		long totalCount = lostitemxxMapper.selectCount2(losub);
		LostItemVo lostitemVo = new LostItemVo(losub, page, pageSize);
		List<LostItemPicVo> list = lostitemxxMapper.selectPerPage2(lostitemVo);

		System.out.println("list2: " + list);
		return new LostItemListResult(page, pageSize, totalCount, list);		
	}
	@Override
	public List<LostItemPicVo> getlistByCondition(Pagination page, String option, String condition, String sorting){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", page.getStartRow());
		paramMap.put("endRow", page.getEndRow());
		paramMap.put("option", option);
		paramMap.put("condition", condition);
		paramMap.put("sorting", sorting);
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("startRow"));
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("endRow"));
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("option"));
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("condition"));
		System.out.println("#>getlist() page: " + page.getCurrentPage() + "/" + page.getStartPage() + "/"
				+ page.getEndPage() + "/" + page.getPageSize());
		log.info("#>getlist() page: " + page.getCurrentPage() + "/" + page.getStartPage() + "/" + page.getEndPage()
				+ "/" + page.getPageSize());
		return lostitemxxMapper.selectPerPageByCondition(paramMap);
	}

	@Override
	public ResponseListVo getListService(HashMap<String, Object> requestQuery) {
String psStr = request.getParameter("ps");

		int selectedPage = 0;
		String option = null;
		String keyword = null;
		String sorting = null;
		log.info("#> size ? "+requestQuery.size());
		log.info("#> null ? "+requestQuery.get("selectedPage"));

		if(requestQuery != null) {
			selectedPage = Integer.parseInt(requestQuery.get("selectedPage").toString());
			if((boolean)requestQuery.get("search")) {
				option = (String)requestQuery.get("option");
				keyword = (String)requestQuery.get("keyword");
				sorting = (String)requestQuery.get("sorting");
			}
		}

		PagingUtil util = new PagingUtil(String.valueOf(selectedPage), psStr, session);

		log.info("#> o : "+option);
		log.info("#> k : "+keyword);
		log.info("#> s : "+sorting);
		Map<String, Object> query = new HashMap<String, Object>();
		query.put("option", option);
		query.put("sorting", sorting);
		query.put("keyword", keyword);

		long listCount = lostitemxxMapper.selectListCount(query);
		Pagination page = new Pagination(listCount, selectedPage, util.getPs());

		query.put("page", page);
		List<LostItemPicVo> list = lostitemxxMapper.selectList(query);

		for (LostItemPicVo lostitem : list) {
			List<LostPic> picList = lostitemxxMapper.selectLostPic(lostitem.getLono());
			for (LostPic pic : picList) {
				lostitem.setLopicno(pic.getLopicno());
				lostitem.setLopno(pic.getLopno());
				lostitem.setLopicname(pic.getLopicname());
				break;
			}
		}
		return new ResponseListVo(list, page);
	}

	@Override
	public 	ModelAndView searchLostItem(String nextPage, String query, LostItemPicVo lostitem, String isSearch, ModelAndView mv) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");

		if(isSearch.trim().equals("true")) {
			session.removeAttribute("cp");
			session.removeAttribute("ps");
		}

		int cp = 1;
		if(isSearch.equals("true")) {
			if(cpStr == null) {
				Object cpObj = session.getAttribute("cp");
				if(cpObj != null) {
					cp = (Integer)cpObj;
				}
			}else {
				cpStr = cpStr.trim();
				cp = Integer.parseInt(cpStr);
			}
			session.setAttribute("cp", cp);
		} else {
			cp = Integer.parseInt(nextPage);
		}
		int ps = 8;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);

			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}

			ps = psParam;
		}
		session.setAttribute("ps", ps);

		HashMap<String, Object> dbQuery = new HashMap<String, Object>();


		dbQuery.put("lostitem", lostitem);
		if(lostitem.getStartDate().equals("")) {
			dbQuery.put("date", "date");
		} else {
			dbQuery.put("date", null);
		}
		if(lostitem.getLoano() == -1) {
			dbQuery.put("area", null);
		} else {
			dbQuery.put("area", lostitem.getLoano());
		}
		long totalCount = lostitemxxMapper.selectCountSearch(dbQuery);
		Pagination page = new Pagination(totalCount, cp, ps);
		dbQuery.put("page", page);
		List<LostItemPicVo> list = lostitemxxMapper.selectSearch(dbQuery);

		if(list.size() != 0) {
			for(LostItemPicVo obj : list) {
				List<LostPic> temp = lostitemxxMapper.selectLostPic(obj.getLono());
				if(temp.size() != 0) obj.setLopicname(temp.get(0).getLopicname());
			}
		}
		LostItemListResult listResult = new LostItemListResult(list, page);
		mv.setViewName("gxsx/losearch_result");
		mv.addObject("lostResult", listResult);
		mv.addObject("prevData", lostitem);
		return mv;
	}

	@Override
	public ModelAndView getSearchOptions() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("area", lostitemxxMapper.selectArea());
		mv.addObject("category", lostitemxxMapper.selectCategory());
		return mv;
	}


}