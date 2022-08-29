package sansil.gxsx.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FiComments {
	private int comno;
	private int fino;
	private String userid;
	private Date codate;
	private String contents;
	private int depth;
	private int pcom;
	private int cogroup;
}
