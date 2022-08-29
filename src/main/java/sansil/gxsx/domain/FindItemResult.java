package sansil.gxsx.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FindItemResult {
	private int page;
	private int pageSize;
	private long totalCount;
	private List<FindItem> list;
	private long totalPageCount;
	
	public FindItemResult(int page, int pageSize, long totalCount, List<FindItem> list) {
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