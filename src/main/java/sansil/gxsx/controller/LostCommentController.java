package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.LostCommentService;

@RequestMapping("LostComment")
@Controller
@Log4j
@AllArgsConstructor
public class LostCommentController {
	
	@Resource(name="LostCommentService")
	private LostCommentService service;
	
	@RequestMapping("comment.do")
	public ModelAndView comment(int lono) {
		List<LoComments> list = service.LostCommentList(lono);
		return new ModelAndView("gxsx/lost_comment_list", "comment", list);
	}
	
	@PostMapping("insert")
	@ResponseBody
	private boolean fCommentserviceInsert(HttpSession session, @RequestBody LoComments locomments) {
		Users user = (Users)session.getAttribute("loginuser");
		locomments.setUserid(user.getUserid());
		log.info("#> comment : "+locomments);
		return service.LostCommentInsert(locomments);
	}
	
	@RequestMapping("update")
	@ResponseBody
	private boolean fCommentserviceUpdate(HttpSession session, LoComments locomments) {
		Users user = (Users)session.getAttribute("loginuser");
		locomments.setUserid(user.getUserid());
		return service.LostCommentUpdate(locomments);
	}
	
	@RequestMapping("delete")
	@ResponseBody
	private boolean fCommentserviceDelete(HttpSession session, @RequestBody HashMap<String, Object> request) {
		log.info("#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return service.LostCommentDelete(request);
	}
}