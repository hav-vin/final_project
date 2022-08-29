package sansil.gxsx.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class LostItemVo {
	String keyword;
	private int page; 
	private int pageSize; 
	
	public int getStartRow() {
		return (page-1)*pageSize;
		
	}
	public int getEndRow() {
		return page*pageSize; 
	}
}