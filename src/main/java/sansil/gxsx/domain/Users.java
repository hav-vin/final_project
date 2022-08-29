package sansil.gxsx.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private String userid;
	private String upwd;
	private String uname;
	private String uemail;
	private String upnum;
	private Date uoutdate;
}
