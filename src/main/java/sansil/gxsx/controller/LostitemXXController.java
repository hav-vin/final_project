package sansil.gxsx.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FileUploadservice;
import sansil.gxsx.service.LostCommentService;
import sansil.gxsx.service.LostPicService;
import sansil.gxsx.service.LostitemXXservice;
import sansil.gxsx.service.MessageService;

@RequestMapping("/lostitem/")
@Controller
@Log4j
@AllArgsConstructor
public class LostitemXXController {
	@Resource(name="LostitemXXMapper")
	private LostitemXXservice service;
	@Resource(name="LostCommentService")
	private LostCommentService lostCommentService;
	@Resource(name="MessageService")
	private MessageService messageService;
	
	private FileUploadservice fservice;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = service.getSearchOptions();
		mv.setViewName("gxsx/lolist");
		if(session.getAttribute("loginuser")!=null) {
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="search02", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<LostItemPicVo> search02(String losub) {
		List<LostItemPicVo> list = service.selectByNameS(losub);
		return list;
	}
	
	@RequestMapping("loslist.do")
	public ModelAndView slist(String nextPage, String query, LostItemPicVo requestData, String isSearch, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("loginuser")!=null) { 
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());
			mv.addObject("messageResult", messageResult);
		}
		mv = service.searchLostItem(nextPage, query, requestData, isSearch, mv);
		return mv;
	}
	
	@GetMapping("/write.do")
	public String write(HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("loginuser")==null) {
			return "redirect:../gxsx/login.do";
		}
		else {
			return "gxsx/lowrite";
		}
	}
	
	@PostMapping("/write.do")
	public String write(LostItemPicVo lostitem, ArrayList<MultipartFile> files) {
		service.insertP(lostitem, files);
		return "redirect:list.do";
	}
	
	@RequestMapping("/locontent.do")
	public ModelAndView content(int lono, HttpSession session) {
		List<LostItemPicVo> lostitem = service.ContentS(lono);
		List<LostItemPicVo> related = service.getLostRelated();

		String area = service.areaS(lono);
		
		List<LoComments> locomment = lostCommentService.LostCommentList(lono);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/locontent");
		mv.addObject("locontent", lostitem);
		mv.addObject("locomment", locomment);
		mv.addObject("related", related);
		mv.addObject("area", area);
		Users user = (Users)session.getAttribute("loginuser");
		List<Question> messageResult = messageService.messageList(user.getUserid());			
		mv.addObject("messageResult", messageResult);
		String userid = user.getUserid();
		mv.addObject("userid", userid);
		return mv;
	}
	
	@GetMapping("/del.do")
	public String delete(@RequestParam int lono,
			HttpSession session, HttpServletRequest request, Object page) {
		ServletContext application = session.getServletContext();
		log.info("#application" + application);
		service.deleteS(lono);
		return "redirect:list.do";
	}
	
	@RequestMapping("/updatef.do")
	public ModelAndView updatef(int lono,HttpServletRequest request, HttpSession session) {
		List<LostItemPicVo> lostitem = service.UpdatefS(lono);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/updatef");
		mv.addObject("updatef", lostitem);
		
		Users user = (Users)session.getAttribute("loginuser");
		List<Question> messageResult = messageService.messageList(user.getUserid());			
		mv.addObject("messageResult", messageResult);
		
		return mv;
	}
	
	@PostMapping("/update")
	public String update(LostItemPicVo lostitem) {
		service.UpdateS(lostitem);
		return "redirect:list.do";
	}
	
}