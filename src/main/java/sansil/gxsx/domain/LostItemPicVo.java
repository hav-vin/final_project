package sansil.gxsx.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LostItemPicVo {
	private int lono;
	private String louid;
	private String losub;
	private String locon;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date lodate;
	private int loano;
	private String loplace;
	private String locname;
	private int logift;
	private int lofin;
	private int lopicno;
	private int lopno;
	private String lopicname;
	private int ano;
	private String acity;
	private Pagination paging;
	
	//검색 조건 변수
	private String startDate;
	private String endDate;
}
