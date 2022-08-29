package sansil.gxsx.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticeVo {
	private int nono;
	private String nouid;
	private String nosub;
	private String nocon;
	private Date nodate;
	private String nocate;
	private Pagination paging;
}
