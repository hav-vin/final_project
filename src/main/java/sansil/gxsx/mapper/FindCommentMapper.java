package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.FiComments;


public interface FindCommentMapper {
	
	List<FiComments> FindCommentList(int fino);
	
	boolean FindCommentInsert(FiComments findcomments);

	boolean FindCommentDelete(FiComments fiComments);
	
	List<FiComments> reSelectComment(FiComments findcomments);

	boolean CommentReplyInsert(FiComments fiComments);

	boolean FindCommentUpdate(FiComments fiComments);
	
	boolean FindCommentDelete(int comno);
}

