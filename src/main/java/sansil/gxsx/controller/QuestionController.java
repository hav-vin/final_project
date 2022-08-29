package sansil.gxsx.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.MessageService;
import sansil.gxsx.service.QuestionService;

@RequestMapping("Question")
@Controller
@Log4j
@AllArgsConstructor
public class QuestionController {
	
	private static final String qcon = null;
	@Resource(name="MessageService")
	private MessageService messageService;
	@Resource(name="QuestionMapper")
	private QuestionService service;
	@Autowired
	HttpSession session;
	
	
	//question.jsp
	@RequestMapping("list.do")
	public String list() {
		if(session.getAttribute("loginuser") == null) return "redirect:../gxsx/login.do";
		else if(session.getAttribute("loginuser") != null && session.getAttribute("usercheck") == null) return "redirect:../gxsx/tempsignupform.do"; \
		else return "gxsx/contact";
	}
	
	//ResponseListVo
	@ResponseBody
	@PostMapping("otherPageQu")
	private ModelAndView otherPageQu(int selectedPage) {
		log.info("#>>selectedPage : "+selectedPage);
		if(session.getAttribute("admin") != null) { //관리자
			ResponseListVo result = service.getAllQuestionListService(selectedPage);
			return new ModelAndView("gxsx/questionAllList", "vo", result);
		}else { 
			ResponseListVo result = service.getQuestionListService(selectedPage);
			return new ModelAndView("gxsx/questionList", "vo", result);
		}
	}
	
	@ResponseBody
	@RequestMapping("/questionco.do")
	public ModelAndView questionco(@RequestParam long qno) {		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/questionform");
		mv.addObject("question", service.contentS(qno));
		if(session.getAttribute("admin") == null) { //관리자
			service.contentReadS(qno);
		}
		
		if(session.getAttribute("loginuser")!=null) { //메세지확인
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		return mv;
	}
	
	@RequestMapping(value="reupdate.do",method = RequestMethod.POST)
	private String reupdate(int qno, String content) {
		Question comment =  new Question();
		service.updateS(qno, content);
		comment.setQno(qno);
		comment.setContent(content);
	
		return "redirect:questionco.do?qno="+qno;
			
	}

	//글쓰기 페이지
	@RequestMapping("/write.do")
	private ModelAndView write(HttpSession session) {
		Users user = (Users)session.getAttribute("loginUser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("question/write");
		mv.addObject("user", user);
		return mv;

	}
	
	//글쓰기
	@PostMapping("/Questioninsert.do")
	private String Questioninsert(Question questioninsert) {
		service.QuestioninsertS(questioninsert);
		
		return "gxsx/contact";
	}
	//글수정
	@GetMapping("/Questionupdate.do")
	private String Questionupdate(Question questionupdate) {
		service.QuestionupdateS(questionupdate);
		return "redirect:list.do";
	}
	//글삭제
	@GetMapping("/Questiondelete.do")
	private String Questiondelete(long qno) {
		service.QuestiondeleteS(qno);
		return "redirect:list.do";
	}
	
}