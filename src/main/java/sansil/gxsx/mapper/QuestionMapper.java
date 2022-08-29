package sansil.gxsx.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import sansil.gxsx.domain.Question;

public interface QuestionMapper {
	
	List<Question> selectQuestion(String query);
	
	long selectCountQuestion(String query);
	
	long allCountQuestion(String query);
	
	List<Question> selectPerPage(HashMap<String, Object> query);
	
	List<Question> allSelectPerPage(HashMap<String, Object> query);
	
	Question content(long qno);
	
	public Question Insert(Question question);
	
	public void update(@Param("qno") int qno, @Param("qreply")String qreply);
	
	public Question update(Question question);
	
	public long Delete(long qno);
	
	public void Questioninsert(Question questioninsert);

	public void Questionupdate(Question questionupdate);

	public long Questiondelete(long qno);
	
	List<Question> messageQuestion(String userid);
	
	void contentread(long qno);


}
