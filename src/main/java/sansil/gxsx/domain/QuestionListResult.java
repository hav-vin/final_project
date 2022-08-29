package sansil.gxsx.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QuestionListResult {
	private long page;
	private long totalCount; //�� �Խñ� ��
	private long pageSize;
	private List<Question> list;
	private long totalPageCount; //�� ������ ��
	
	public QuestionListResult(long page, long totalCount, long pageSize, List<Question> list) {
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
