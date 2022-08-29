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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FindCommentService;
import sansil.gxsx.service.FindItemService;
import sansil.gxsx.service.MessageService;

@RequestMapping("/finditem/")
@Controller
@Log4j
public class FindItemController {
	@Resource(name="FindItem")
	private FindItemService service; //Spring 4.3~ ( with @AllArgsConstructor )
	@Resource(name="FindCommentService")
	private FindCommentService findCommentService;
	@Resource(name="MessageService")
	private MessageService messageService;
	
	@GetMapping("write2.do")
	public ModelAndView write(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("loginuser")==null) { //로그인 안되었을 때
			return DomainController.login(session);
		}
		else {
			mv.setViewName("gxsx/fiwrite");
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
			return mv;
		}
	}
	
	@PostMapping("write2.do")
	public String write(FindItPic findItPic) {
		
		log.info("==========YJ write findpic : " + findItPic);
		service.write(findItPic);
		return "redirect:list.do";
	}
	
	@RequestMapping("/update.do")
	public ModelAndView updatef(long fino, HttpServletRequest request, HttpSession session) {
		List<FindItPic> finditem = service.UpdatefS(fino);
		
		Users user = (Users)session.getAttribute("loginuser");
		String userid = user.getUserid();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/fiupdate");
		mv.addObject("fiupdate", finditem);
		mv.addObject("userid", userid);
		
		return mv;
	}
	@PostMapping("/update.do")
	public String update(FindItPic finditem) {
		service.UpdateS(finditem);
		return "redirect:list.do";
	}
	
	
	@GetMapping("del.do")
	public String delete(long fino) {
		service.remove(fino);
		return "redirect:list.do";
	}
	
	/////////////////////////////////////////////////////////index
	
	//ajax
	@ResponseBody
	@PostMapping(value="search02", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<FindItPic> search02(String fisub) {
		List<FindItPic> list = service.selectByNameS(fisub);
		return list;
	}	
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session, String query) {
		ModelAndView mv = service.getSearchOptions();
		mv.setViewName("gxsx/filist");
		if(session.getAttribute("loginuser")!=null) {
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		mv.addObject("query", query);
		return mv;
	}
	
	// 테스트중
	@RequestMapping("list2.do")
	public ModelAndView list2(HttpServletRequest request, HttpSession session, String query) {
		ModelAndView mv = service.getSearchOptions();
		mv.setViewName("gxsx/filist");
		if(session.getAttribute("loginuser")!=null) {
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
//		mv.addObject("query", query);
		return mv;
	}
	
	@RequestMapping("slist.do")
	public ModelAndView slist(String nextPage, String query, FindItPic requestData, String isSearch, HttpServletRequest request, HttpSession session) {
		System.out.println("nullroQkrclsek:" + query);
		System.out.println("isSearch:" + isSearch);
		System.out.println("requestData:" + requestData);
		
		ModelAndView mv = new ModelAndView();
		mv = service.searchFindItem(nextPage, query, requestData, isSearch, mv);
		if(session.getAttribute("loginuser")!=null) { 
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		return mv;
	}
	
	@GetMapping("content.do")
	public ModelAndView content(long fino, HttpSession session) {
		List<FindItPic> findItPic = service.getFindItPic(fino);
		String area = service.areaS(fino);
		int finoInt = (int)fino;
		List<FiComments> ficomment = service.FindCommentList(finoInt);
		List<FindItPic> related = service.getFindRelated();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/ficontent");
		
		Users user = (Users)session.getAttribute("loginuser");
		List<Question> messageResult = messageService.messageList(user.getUserid());			
		mv.addObject("messageResult", messageResult);

		mv.addObject("content", findItPic);		 
		mv.addObject("ficomment", ficomment);
		mv.addObject("area", area);
		mv.addObject("related", related);
		mv.addObject("userid", user.getUserid());
		
		return mv;
	}
	
}