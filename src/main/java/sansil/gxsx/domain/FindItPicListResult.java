package sansil.gxsx.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FindItPicListResult {
	private int page;
	private int pageSize;
	private long totalCount;
	private List<FindItPic> list;
	private long totalPageCount;
	private Pagination paging;
	
	public FindItPicListResult(int page, int pageSize, long totalCount, List<FindItPic> list) {
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	
	public FindItPicListResult(List<FindItPic> list, Pagination paging) {
		this.list = list;
		this.paging = paging;
	}
	
	private long calTotalPageCount() {
		long tpc = totalCount/pageSize; 
		if(totalCount%pageSize != 0) tpc++;
		
		return tpc;
	}

}
