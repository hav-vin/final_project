package sansil.gxsx.domain;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FindItPic {
	//finditem
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
	private Pagination paging;
	
	//findpicture
	private int fipicno;
	private long fipno;
	private String fipicname;
	
	//검색 조건 변수
	private String startDate;
	private String endDate;
}