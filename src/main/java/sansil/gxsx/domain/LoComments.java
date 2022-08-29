package sansil.gxsx.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoComments {
	private int comno;
	private int lono;
	private String userid;
	private Date codate;
	private String contents;
	private int depth;
	private int pcom;
	private int cogroup;
}
