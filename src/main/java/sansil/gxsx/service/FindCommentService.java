package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.Pagination;

public interface FindCommentService {
	
	List<FiComments> FindCommentList(int fino);
	
	boolean FindCommentInsert(FiComments findcomments);
	
	boolean FindCommentDelete(HashMap<String, Object> request);

	boolean FindCommentUpdate(FiComments fiComments);

	boolean CommentReplyInsert(FiComments fiComments);
	
	List<FiComments> reSelectComment(FiComments ficomments);

}