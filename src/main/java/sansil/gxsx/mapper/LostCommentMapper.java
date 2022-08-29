package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.LoComments;


public interface LostCommentMapper {
	
	List<LoComments> LostCommentList(int lono);	

	boolean LostCommentDelete(LoComments locomments);

	boolean LostCommentInsert(LoComments locomments);
	
	boolean CommentReplyInsert(LoComments locomments);
	
	boolean LostCommentDelete(int comno);
	
	List<LoComments> reSelectComment(LoComments locomments);

	boolean LostCommentUpdate(LoComments locomments);

}

