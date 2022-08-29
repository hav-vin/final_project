package sansil.gxsx.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import sansil.gxsx.domain.Question;
import sansil.gxsx.mapper.QuestionMapper;

@Service("MessageService")
@AllArgsConstructor
public class MessageServiceImpl implements MessageService {
	private QuestionMapper questionMapper;
	
	@Override
	public List<Question> messageList(String userid) {
		return questionMapper.messageQuestion(userid);
	}
}
