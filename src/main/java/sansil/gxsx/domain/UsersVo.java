package sansil.gxsx.domain;


import lombok.NoArgsConstructor;

@NoArgsConstructor
public class UsersVo {
	private long pageCnt;// 한 블럭에 들어가는 페이지 수
	private long currentPage;//현재페이지	
	private long pageStartNum;//한블럭의 첫페이지
	private long listCnt;// 한 페이지에 들어가는 행 수
	private long total;// 총 행 수
	private String louid;
	
	{
		pageCnt = 10; 
		currentPage = 0;
		pageStartNum = 1;
		listCnt = 5;
	}
	
	public UsersVo(long page, long pageSize, String louid) {
		this.currentPage= 0;
		this.listCnt = pageSize;
		this.louid = louid;
		pageStartNum = 1;
		pageCnt = 10; 
	}
	public long getStart() {
		return (currentPage-1)*listCnt+1;
	}
	public long getLast() {
		long endPage = (getStart()+listCnt)-1;
		if(endPage > listCnt) {
			endPage = listCnt;
			return endPage;
		} else {
			return endPage;
		}
	}
	public long getPageLastNum() {
		long remainListCnt = total-listCnt*(pageStartNum-1);
		long remainPageCnt = remainListCnt/listCnt;
		if(remainListCnt%listCnt != 0) {
			remainPageCnt++;
		}
		long pageLastNum = 0L;
		if(remainListCnt <= listCnt) {
			pageLastNum = pageStartNum;
		}else if(remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt+pageStartNum-1;
		}else {
			pageLastNum = pageCnt+pageStartNum-1;
		}
		return pageLastNum;
	}
	public boolean getLastChk() {
		int n = (int)Math.ceil((double)total/listCnt);
		return getPageLastNum()==n ? false : n==0 ? false : true;
	}
	
	public long getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
//	public long getIndex() {
//		return index;
//	}
//	public void setIndex(int index) {
//		this.index = index;
//	}
	public long getPageStartNum() {
		return pageStartNum;
	}
	public void setPageStartNum(long pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public long getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
//	@Override
//	public String toString() {
//		return "UsersVo [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
//				+ listCnt + ", total=" + total + "]";
//	}
	public String getLouid() {
		return louid;
	}
	public void setLouid(String louid) {
		this.louid = louid;
	}
	
}
