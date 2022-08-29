package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.mapper.QuestionMapper;

@Log4j
@Service("QuestionMapper")
@AllArgsConstructor
public class QuestionServiceImpl implements QuestionService {
	
	private QuestionMapper questionMapper;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@Override
	public List<Question> getQuestion(Pagination page, String quid) {
		Question query = new Question();
		query.setQuid(quid);
		query.setPaging(page);
		
		return questionMapper.selectQuestion(query.getQuid());
	}	

	@Override
	public ResponseListVo getQuestionListService(int selectedPage) {
		Users user = (Users)session.getAttribute("loginuser");
		log.info("user : "+user);
		long listCount = questionMapper.selectCountQuestion(user.getUserid());
		Pagination paging = new Pagination(listCount, selectedPage, 5);
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("paging", paging);
		query.put("usersid", user.getUserid());
		
		List<Question> list = questionMapper.selectPerPage(query);
		return new ResponseListVo(list, paging);
	}
	
	@Override
	public ResponseListVo getAllQuestionListService(int selectedPage) {
		Users user = (Users)session.getAttribute("loginuser");
		log.info("user : "+user);
		long listCount = questionMapper.allCountQuestion(user.getUserid());
		Pagination paging = new Pagination(listCount, selectedPage, 5);
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("paging", paging);
		query.put("usersid", user.getUserid());
		
		List<Question> list = questionMapper.allSelectPerPage(query);
		return new ResponseListVo(list, paging);
	}
	
	
	@Override
	public Question contentS(long qno) {
			return questionMapper.content(qno);
	}

	@Override
	public Question insertS(Question question) {		
		return questionMapper.Insert(question);
	}
	@Override
	public void updateS(int qno, String content) {		
		questionMapper.update(qno, content);
	}
	@Override
	public Question updateS(Question question) {
		return questionMapper.update(question);
	}

	@Override
	public long deleteS(long qno) {
		return questionMapper.Delete(qno);
	}
	@Override
	public void QuestioninsertS(Question questioninsert) {
		 questionMapper.Questioninsert(questioninsert);
	}
	
	@Override
	public void QuestionupdateS(Question questionupdate) {
		 questionMapper.Questionupdate(questionupdate);
	}
	
	@Override
	public long QuestiondeleteS(long qno) {
		return questionMapper.Questiondelete(qno);
	}
	
	@Override
	public void contentReadS(long qno) {
		questionMapper.contentread(qno);
	}
}
