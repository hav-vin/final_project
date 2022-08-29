package sansil.gxsx.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LostItemListResult {
	private int page;
	private int pageSize;
	private long totalCount;
	private List<LostItemPicVo> list;
	private long totalPageCount;
	private Pagination paging;
	
	public LostItemListResult(int page, int pageSize, long totalCount, List<LostItemPicVo> list) {
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	
	public LostItemListResult(List<LostItemPicVo> list, Pagination paging) {
		this.list = list;
		this.paging = paging;
	}
	
	private long calTotalPageCount() {
		long tpc = totalCount/pageSize; 
		if(totalCount%pageSize != 0) tpc++;
		
		return tpc;
	}

}