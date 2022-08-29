package sansil.gxsx.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FindListVo {
	
	private int fipicno;
	private int fipno;
	private String fipicname;
	private int fino;
	private String fiuid;
	private String fisub;
	private String ficon;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date fidate;
	private int fiano;
	private String fiplace;
	private String fistor;
	private String ficname;
	private int fifin;
	private Pagination paging;
}
