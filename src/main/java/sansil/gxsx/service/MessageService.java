package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.Question;

public interface MessageService {
	public List<Question> messageList(String userid);
}
