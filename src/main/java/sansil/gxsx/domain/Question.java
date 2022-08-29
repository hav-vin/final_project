package sansil.gxsx.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {
	private String rnum;
	private int qno;
	private String quid;
	private String qsub;
	private String qcon;
	private String qreply;
	private int qread;
	private Pagination paging;
	private String content;
}
