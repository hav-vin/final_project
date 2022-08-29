package sansil.gxsx.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LostItemResult {
	private int page;
	private int pageSize;
	private long totalCount;
	private List<LostItem> list;
	private long totalPageCount;
	
	public LostItemResult(int page, int pageSize, long totalCount, List<LostItem> list) {
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
		this.totalPageCount = calTotalpageCount();
	}
	private long calTotalpageCount() {
		long tpc = totalCount/pageSize;
		if(totalCount%pageSize != 0) tpc++;
		
		return tpc;
	}
}