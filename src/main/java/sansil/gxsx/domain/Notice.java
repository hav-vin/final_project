package sansil.gxsx.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int nono;
	private String nouid;
	private String nosub;
	private String nocon;
	private Date nodate;
	private String nocate;
}
