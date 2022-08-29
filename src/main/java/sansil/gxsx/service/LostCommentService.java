package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.LoComments;

public interface LostCommentService {
	
	List<LoComments> LostCommentList(int lono);
	
	boolean LostCommentInsert(LoComments locomments);
	
	boolean LostCommentDelete(HashMap<String, Object> request);

	boolean LostCommentUpdate(LoComments locomments);
	
	List<LoComments> reSelectComment(LoComments locomments);
}