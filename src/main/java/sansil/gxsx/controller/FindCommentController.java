package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
import sansil.gxsx.service.FindCommentService;

@RequestMapping("FindComment")
@Controller
@Log4j
@AllArgsConstructor
public class FindCommentController {
	
	@Resource(name="FindCommentService")
	private FindCommentService service;
	

	//Find 댓글
	@RequestMapping("findcomment.do")
	public ModelAndView findcomment(int fino) {	
		List<FiComments> list = service.FindCommentList(fino);			
		return new ModelAndView("gxsx/find_comment_list", "comment", list);
	}
	
	//Find 글작성
		@PostMapping("findinsert")
		@ResponseBody
		private boolean FindCommentInsert(HttpSession session, @RequestBody FiComments ficomments) {
			Users user = (Users)session.getAttribute("loginuser");
			ficomments.setUserid(user.getUserid());
			log.info("#> comment : "+ficomments);		 
			return service.FindCommentInsert(ficomments);
		}
	
	@RequestMapping("fiupdate")//Find 수정
	@ResponseBody
	private boolean FindCommentUpdate(HttpSession session, FiComments fiComments) {
		Users user = (Users)session.getAttribute("loginuser");
		fiComments.setUserid(user.getUserid());
		return service.FindCommentUpdate(fiComments);
	}
	
	@RequestMapping("fidelete")//Find 삭제
	@ResponseBody
	private boolean FindCommentDelete(HttpSession session, @RequestBody HashMap<String, Object> request) {
		log.info("#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return service.FindCommentDelete(request);
	}
}