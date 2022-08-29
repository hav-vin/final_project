package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;


public interface QuestionService {
	
	List<Question> getQuestion(Pagination page, String quid);

	Question contentS(long seq);
	
	/**
	 * ���� �۾��⸦ insert���ִ� �޼ҵ�
	 * @param question
	 * @return
	 */
	Question insertS(Question question);
	
	Question updateS(Question question);
	
	long deleteS(long qno);

	/**
	 * ����� insert���ִ� Service
	 * @param qno
	 * @param content
	 */
	void updateS(int qno, String content);

	//���ǰԽ��� ���ۼ� 
	void QuestioninsertS(Question questioninsert);
	//���ǰԽ��� ����
	void QuestionupdateS(Question questionupdate);
	//���ǰԽ��� ����
	long QuestiondeleteS(long qno);

	/**
	 * ���� �Խ��� ����Ʈ ��ȸ
	 * @param selectedPage ��û ������
	 * @return ResponseListVo ���� �Խ��� ����Ʈ, ����¡
	 */
	ResponseListVo getQuestionListService(int selectedPage);

	ResponseListVo getAllQuestionListService(int selectedPage);
	
	void contentReadS(long qno);
}
