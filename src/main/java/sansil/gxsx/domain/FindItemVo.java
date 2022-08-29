package sansil.gxsx.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class FindItemVo {

	String keyword; //for 검색
	private int page; //페이지 번호
	private int pageSize; //페이지 사이즈
	
	public int getStartRow() {
		return (page-1)*pageSize;
		
	}
	public int getEndRow() {
		return page*pageSize; 
	}
}
