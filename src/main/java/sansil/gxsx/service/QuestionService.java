package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;


public interface QuestionService {
	
	List<Question> getQuestion(Pagination page, String quid);

	Question contentS(long seq);
	
	/**
	 * 질문 글쓰기를 insert해주는 메소드
	 * @param question
	 * @return
	 */
	Question insertS(Question question);
	
	Question updateS(Question question);
	
	long deleteS(long qno);

	/**
	 * 댓글을 insert해주는 Service
	 * @param qno
	 * @param content
	 */
	void updateS(int qno, String content);

	//문의게시판 글작성 
	void QuestioninsertS(Question questioninsert);
	//문의게시판 수정
	void QuestionupdateS(Question questionupdate);
	//문의게시판 삭제
	long QuestiondeleteS(long qno);

	/**
	 * 문의 게시판 리스트 조회
	 * @param selectedPage 요청 페이지
	 * @return ResponseListVo 문의 게시판 리스트, 페이징
	 */
	ResponseListVo getQuestionListService(int selectedPage);

	ResponseListVo getAllQuestionListService(int selectedPage);
	
	void contentReadS(long qno);
}
