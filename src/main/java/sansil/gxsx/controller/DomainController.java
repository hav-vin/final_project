package sansil.gxsx.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Notice;
import sansil.gxsx.domain.NoticeVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.DomainService;

import sansil.gxsx.service.MailService;
import sansil.gxsx.service.MessageService;

import sansil.gxsx.setting.AdminInfo;


@Log4j
@RequestMapping("/gxsx/")
@Controller
public class DomainController {
	@Resource(name="DomainService")
	private DomainService service;	
	@Resource(name="EmailService")
	private MailService mailService;
	@Resource(name="MessageService")
	private MessageService messageService;
	
	////////// 메인 화면  //////////
	@RequestMapping("domain.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) { 
		List<LostItem> lostResult = service.listloS();
		List<FindItem> findResult = service.listfiS();
		List<LostPic> lostpicResult = service.listlopicS();
		List<FindPic> findpicResult = service.listfipicS();		
		
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("gxsx/domain");
				
		mv.addObject("lostResult", lostResult);
		mv.addObject("findResult", findResult);
		mv.addObject("lostpicResult", lostpicResult);
		mv.addObject("findpicResult", findpicResult);
		
		if(session.getAttribute("loginuser")!=null) { //메세지확인용
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		
		if(session.getAttribute("klogin")!=null) { //kakao로 로그인 했을때
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);
			mv.addObject("kakaologout_url", kakaologoutUrl);			
		}
		return mv;
	}
	
	////////// 카카오 로그인  //////////
	@RequestMapping(value = "kakaologin.do", produces = "application/json") 
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception {

			JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음 
			JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
			JsonNode scope = node.get("scope"); // 사용자의 정보 
			JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken); 
			String token = node.get("access_token").toString();
			String kemail = null;
			String kname = null;
			String kid = null;
			JsonNode properties = userInfo.path("properties"); 
			JsonNode kakao_account = userInfo.path("kakao_account"); 
			kid = userInfo.findPath("id").asText();
			kemail = kakao_account.path("email").asText(); 
			kname = properties.path("nickname").asText(); 
			session.setAttribute("token", token); 
			session.setAttribute("kemail", kemail); 
			session.setAttribute("kname", kname);
			session.setAttribute("kid", kid);
			session.setAttribute("klogin", "klogin");
			
			
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);	//로그아웃가능하게 주소 미리 받아줌
			
		    ModelAndView mv = new ModelAndView(); // 결과값을 node에 담아줌 
			mv.setViewName("gxsx/domain");		
			mv.addObject("kakaologout_url", kakaologoutUrl);
			
			Users usercheck = service.kakaologinS(session.getAttribute("kid").toString()); //DB에 카카오아이디가 등록된 회원인지 확인
			
			// *** 등록되지 않은 회원 *** //
			if(usercheck==null) { //kakao로 회원계정이 등록되어있지않으면 -> 등록하게해야함
				if(session.getAttribute("kemail").toString().length()!=0) { //이메일도 선택해서 제공하는 사람
					mv.addObject("usercheck", "email");
				}else { //이메일 선택안한사람
					session.setAttribute("usercheck", "no_email");
					Users kakaouser = new Users(session.getAttribute("kid").toString(), "temp", 
							session.getAttribute("kname").toString(), "temp", "temp", null);
					session.setAttribute("kakaouser", kakaouser);
				}
			}
			
			// *** 등록된 회원  *** //
			else { //kakao로 로그인했고 & 회원계정이 등록 되어있음 -> 그 계정으로 로그인 한번더(session에 넘겨줌)
				HashMap<String, String> loginmap = new HashMap<String, String>(); 
				loginmap.put("userid", usercheck.getUserid().toString());
				loginmap.put("upwd", usercheck.getUpwd().toString());
				Users users = service.loginS(loginmap);
				
				if(users == null || users.getUoutdate()!=null) { //로그인 실패
					session.setAttribute("loginuser", null);
				}
				else { //로그인 성공 (users값이 비어져있지 않고 탈퇴날짜없음)
					session.setAttribute("userid", null);
					session.setAttribute("upwd", null);
					session.setAttribute("loginuser", users);
				}
			}
			return "redirect:domain.do"; //로그인 완료되었으니 domain.do 로 돌아감
	}
	
	////////// 로그인 화면  //////////
	@RequestMapping("login.do")
	public static ModelAndView login(HttpSession session) {
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/login");
		mv.addObject("kakao_url", kakaoUrl);
		return mv;
	}
	

	//Ajax
	////////// 로그인 기능  //////////
	@ResponseBody
	@PostMapping("logincheck.do")
	public boolean logincheck(HttpServletRequest request, HttpSession session, String userid, String upwd) { 
		String userids = (String)userid;
		String upwds = (String)upwd;

		HashMap<String, String> loginmap = new HashMap<String, String>(); 
		loginmap.put("userid", userids);
		loginmap.put("upwd", upwds);
		
		Users users = service.loginS(loginmap);
		String userpower = service.userPowerS(userids); //권한 뿌리기(회원 or 관리자)

		if(users == null || users.getUoutdate()!=null) { //로그인 실패
			session.invalidate();
			return false;
		}
		else { //로그인 성공
			session.setAttribute("loginuser", users);
			session.setAttribute("userpower", userpower);
			return true;
		}

	}
	
	////////// 일반 유저 로그아웃  //////////
	@RequestMapping("logout.do")
	public String Logout(HttpSession session) {
			session.setAttribute("loginuser", null);//일반 로그인시 로그아웃 하고 user비워줌
			session.setAttribute("admin", null);
			
			System.out.println("access_token:"+(String)session.getAttribute("access_Token"));
        return "redirect:domain.do";
    }
	
	////////// 카카오 유저 로그아웃  //////////
	@RequestMapping(value = "kakaologout.do", produces = "application/json")
	public String kakaologout(HttpSession session) {
	        KakaoController.Logout((String)session.getAttribute("access_Token")); //access_Token : 사용자 정보
	        session.invalidate();

        return "redirect:domain.do";
    }
	
	////////// 회원가입 페이지  //////////
	@GetMapping("signupform.do")
	public ModelAndView signupform() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000; //이메일 확인용
		mv.setViewName("gxsx/signup");
		mv.addObject("random", ran);
		return mv;
	}
	
	////////// 회원가입 기능  //////////
	@PostMapping("signup.do")
	public String signup(Users users, HttpSession session) {
		service.signupS(users);
		return "redirect:domain.do";
	}
	
	//Ajax
	////////// 아이디 중복 확인  //////////
	@PostMapping("idCheck.do")
	@ResponseBody
	public boolean idconfirm(String userid) {
		int id_exist = service.idCheckS(userid);
		if(id_exist==0) {
			return true;
		}
		else {
			return false;
		}		
	}
	
	//Ajax
	////////// 이메일 코드 전송  //////////
	@RequestMapping(value="emailCheck.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public boolean emailCheck(@RequestParam String uemail, @RequestParam int random, HttpServletRequest req){
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		
		//이메일로 전송되는 내용
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");

		return mailService.send(subject, sb.toString(), "javaoneteam@gmail.com", uemail, null); //이메일 전송
	}
	
	
	//Ajax
	////////// 이메일 코드 확인  //////////
	@ResponseBody
	@GetMapping(value="emailAuth", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public boolean emailAuth(HttpSession session, String uemailauth){
		String originalJoinCode = (String) session.getAttribute("authCode");
		if(originalJoinCode.equals(uemailauth)) { //인증 성공
			return true;
		}
		else { //인증 실패
			return false;
		}
	}
	
	////////// 문의 메뉴 이동  //////////
	@RequestMapping("contact.do")
	public ModelAndView contact(HttpSession session) { //로그인 해야 이동 가능
		Users user = (Users)session.getAttribute("loginuser");
		
		if(user == null) { //로그인X
			if(session.getAttribute("kakaouser")!=null) { //카카오O, 회원정보X
				return new ModelAndView("redirect:../gxsx/tempsignupform.do");
			}
			else { //로그인X, 카카오X
				return new ModelAndView("redirect:../gxsx/login.do");
			}
			
		}
		else { //로그인O
			if(user.getUserid().equals(AdminInfo.ADMIN_ID)) { //관리자
				session.setAttribute("admin", true);
			}
			ModelAndView mv = new ModelAndView();
			List<Question> messageResult = messageService.messageList(user.getUserid()); //메세지 확인용		
			mv.setViewName("gxsx/contact");
			mv.addObject("messageResult", messageResult);
			return mv;
		}
	}
	
	////////// 카톡으로 로그인했지만 user정보가  DB에 저장 안되어있을 때  //////////
	@RequestMapping("tempsignupform.do")
	public ModelAndView tempsignupform(HttpSession session) {
		Users kakaouser = (Users)session.getAttribute("kakaouser");
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("gxsx/signup2");
		mv.addObject("kakaouser", kakaouser);
		mv.addObject("random", ran);
		return mv;
	}	
	
	////////// DB에 카톡유저 등록할 때 호출  //////////
	@PostMapping("tempsignup.do")
	public String tempsignup(HttpServletRequest request, HttpSession session, Users kakaouser) {
		Users users = service.kakaouser(kakaouser);
		session.setAttribute("loginuser", users);
		
		return "redirect:domain.do";
	}
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////// 공지사항 부분
	
	////////// 공지사항 페이지  //////////
	@GetMapping("notice.do")
	public ModelAndView notice(HttpServletRequest request, HttpSession session) {
		Pagination listpage = service.getPagination(request, session);
		List<NoticeVo> notice = service.noticeListS(listpage);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/notice");
		mv.addObject("noticeList", notice);
		mv.addObject("listpage", listpage);
		
		if(session.getAttribute("loginuser")!=null) { //메세지확인용
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		if(session.getAttribute("userpower")!=null) { //관리자인지 유저인지(관리자만 글쓰기 버튼 보임)
			String userpower = (String)session.getAttribute("userpower");
			mv.addObject("user", userpower);
		}
		return mv;
	}
	
	////////// 공지사항 검색  //////////
	@ResponseBody
	@GetMapping("noticeSearch")
	private ModelAndView noticeSearch(HttpServletRequest request, HttpSession session, String query) {
		Pagination listpage = service.getPaginationS(request, session, query);
		
		HashMap<String, Object> searpaging = new HashMap<String, Object>(); 
		searpaging.put("paging", listpage);
		searpaging.put("query", query);
		
		List<NoticeVo> notice = service.noticeSearchS(searpaging);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/noticeSearch");
		mv.addObject("noticeList", notice);
		mv.addObject("listpage", listpage);
		mv.addObject("query", query);
		return mv;
	}

	////////// 공지사항 상세내용  //////////
	@GetMapping("noticeCon.do")
	public ModelAndView noticeCon(HttpServletRequest request, HttpSession session, String nono) {
		Notice notice = service.noticeConS(Integer.parseInt(nono));
		Notice noticeup = service.noticeUp(Integer.parseInt(nono));
		Notice noticedown = service.noticeDown(Integer.parseInt(nono));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/noticecontent");
		mv.addObject("noticeList", notice);
		mv.addObject("noticeup", noticeup);
		mv.addObject("noticedown", noticedown);
		
		if(session.getAttribute("loginuser")!=null) { //메세지확인용
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		if(session.getAttribute("userpower")!=null) { //관리자인지 아닌지 (관리자만 글 삭제, 수정 버튼 있음)
			String userpower = (String)session.getAttribute("userpower");
			mv.addObject("user", userpower);
		}
		return mv;
	}
	
	////////// 공지사항 수정 페이지  //////////
	@ResponseBody
	@GetMapping("noticeEditForm")
	private ModelAndView noticeEditForm(int nono) {
		Notice result = service.noticeConS(nono);
		return new ModelAndView("gxsx/noticeedit", "notice", result);
	}
	
	////////// 공지사항 수정 기능  //////////
	@RequestMapping("noticeEdit")
	private String noticeEdit(HttpServletRequest request, HttpSession session, Notice notice) {
		service.noticeEditS(notice);
		return "redirect:notice.do";
	}
	
	////////// 공지사항 삭제 기능  //////////
	@RequestMapping("noticeDel.do")
	private String noticeDel(HttpServletRequest request, HttpSession session, int nono) {
		service.noticeDelS(nono);
		return "redirect:notice.do";
	}
	
	////////// 공지사항 글쓰기 페이지  //////////
	@RequestMapping("noticeForm.do")
	public ModelAndView noticeForm(HttpServletRequest request, HttpSession session) {
		Users user = (Users)session.getAttribute("loginuser");
		String userid = user.getUserid();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/noticewrite");
		mv.addObject("userid", userid);
		return mv;
	}
	
	////////// 공지사항 글쓰기 기능  //////////
	@RequestMapping("noticeWrite.do")
	public String noticeWrite(HttpServletRequest request, HttpSession session, Notice notice) {		
		Users user = (Users)session.getAttribute("loginuser");
		service.noticeWriteS(notice);
		
		return "redirect:notice.do";
	}
}