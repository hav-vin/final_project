package sansil.gxsx.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LostPicVo {
		
	private int lono;
	private String louid;
	private String losub;
	private String locon;
	private Date lodate;
	private int loano;
	private String loplace;
	private String locname;
	private int logift;
	private int lofin;
	private int lopicno;
	private int lopno;
	private String lopicname;
}	
