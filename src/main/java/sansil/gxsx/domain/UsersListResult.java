package sansil.gxsx.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UsersListResult {
	private long page;
	private long totalCount; //총 게시글 수
	private long pageSize;
	private List<Users> list;
	private long totalPageCount; //총 페이지 수
	
	public UsersListResult(long page, long totalCount, long pageSize, List<Users> list) {
		this.page = page;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	private long calTotalPageCount() {
		long tpc = totalCount/pageSize; 
		if(totalCount%pageSize != 0) tpc++;
		
		return tpc;
	}
	
}
