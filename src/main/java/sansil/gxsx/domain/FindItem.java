package sansil.gxsx.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FindItem {
	private long fino;
	private String fiuid;
	private String fisub;
	private String ficon;
	private Date fidate;
	private int fiano;
	private String fiplace;
	private String fistor;
	private String ficname;
	private int fifin;
}
