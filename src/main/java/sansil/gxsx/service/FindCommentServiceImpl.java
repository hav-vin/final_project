package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.mapper.FindCommentMapper;

@Log4j
@Service("FindCommentService")
@AllArgsConstructor
public class FindCommentServiceImpl implements FindCommentService {
	
	
	private FindCommentMapper findcommentMapper;
	
	public List<FiComments> FindCommentList(int fino) {
		return findcommentMapper.FindCommentList(fino);
	}

	@Override
	public boolean FindCommentInsert(FiComments ficomments) {
//		LoComments parentComment = LostcommentMappe
		if(ficomments.getCogroup() == 0) {
			return findcommentMapper.FindCommentInsert(ficomments);
		} else {
			return findcommentMapper.CommentReplyInsert(ficomments);
		}
	}

	@Override
	public boolean FindCommentUpdate(FiComments fiComments) {		
		return findcommentMapper.FindCommentUpdate(fiComments);
	}

	@Override
	public boolean FindCommentDelete(HashMap<String, Object> request) {
		return findcommentMapper.FindCommentDelete(Integer.parseInt(request.get("comno").toString()));
	}
	
	@Override
	public boolean CommentReplyInsert(FiComments ficomments) {
		return findcommentMapper.CommentReplyInsert(ficomments);
	
	}

	@Override
	public List<FiComments> reSelectComment(FiComments ficomments) {
		// TODO Auto-generated method stub
		return null;
	}
}