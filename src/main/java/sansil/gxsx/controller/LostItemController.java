package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemResult;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.LostItemService;
import sansil.gxsx.service.MessageService;

@RequestMapping("/lostitem2/")
@Controller
@Log4j
public class LostItemController {
	@Resource(name="LostItem")
	private LostItemService service;
	@Resource(name="MessageService")
	private MessageService messageService;
	
//////////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		Pagination listpage = service.getPagination(request, session);
		List<LostItemPicVo> list = service.getlist(listpage);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/lolist");
		mv.addObject("lostResult", list);
		mv.addObject("listpage", listpage);
		
		if(session.getAttribute("loginuser")!=null) { //메세지확인용
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		return mv;
	}
	
	@RequestMapping(value="paging",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	private ResponseListVo paging(int selectedPage, HttpSession session,
			HttpServletRequest request) {
		Pagination page = service.getAjaxPagination(selectedPage, request, session);
		List<LostItemPicVo> list = service.getlist(page);
		return new ResponseListVo(list, page);
	}
	
	@RequestMapping("/locontent.do")
	public ModelAndView content(int lono, HttpSession session) {
		LostItemPicVo lostitem = service.ContentS(lono);
		String area = service.areaS(lono);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lostitem/locontent");
		mv.addObject("locontent", lostitem);
		mv.addObject("area", area);
		if(session.getAttribute("loginuser")!=null) { //메세지확인용
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
			mv.addObject("userid", user.getUserid());
		}
		return mv;
	}
	
}
