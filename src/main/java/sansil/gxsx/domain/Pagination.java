package sansil.gxsx.domain;

public class Pagination {
	//한 페이지 당 게시글 수
	private int pageSize; 
	//한 블럭(range)당 페이지 수
	private int rangeSize = 10;
	//현재 페이지
	private int currentPage = 1;
	//현재 블럭(range)
	private int currentRange = 1;
	//총 게시글 수
	private long listCount;
	//총 페이지 수
	private int pageCount;
	//총 블럭(range)
	private int rangeCount;
	//시작 페이지
	private int startPage = 1;
	//끝 페이지
	private int endPage = 1;
	//시작 index
	private int startIndex = 0;
	//이전 페이지
	private int prevPage;
	//다음 페이지
	private int nextPage;
	//시작 행
	private int startRow;
	//끝 행
	private int endRow;
	
	public Pagination(long listCount, int currentPage, int pageSize) {
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		
		//총 페이지 수
		setPageCount(listCount);
		//현재 블럭 setting
		setCurrentRange(currentPage);
		//총 블럭(range) 수
		setRangeCount(pageCount);
		//블럭(range) setting
		rangeSetting(currentPage);
		setStartIndex(currentPage);
		setStartRow(currentPage, pageSize);
		setEndRow(currentPage, pageSize);
	}
	
	public void setStartRow(int currentPage, int pageSize) {
		this.startRow = (currentPage-1)*pageSize+1;
	}
	public void setEndRow(int currentPage, int pageSize) {
		this.endRow = currentPage*pageSize;
	}
	
	public void setPageCount(long listCount) {
		this.pageCount = (int)Math.ceil(listCount*1.0/pageSize);
	}
	
	public void setRangeCount(int pageCount) {
		this.rangeCount = (int)Math.ceil(pageCount*1.0/rangeSize);
	}
	public void setCurrentRange(int currentPage) {
		this.currentRange = ((int)((currentPage-1)/rangeSize)+1);
	}
	
	public void setStartIndex(int currentPage) {
		this.startIndex = (currentPage-1)*pageSize;
	}
	
	//cp=1 -> 1, 10
	//cp=2 -> 11, 20
	//cp=3 -> 21, 30
	//cp=4 -> 31, 40
	public void rangeSetting(int currentPage) {
		this.startPage = (currentRange-1)*rangeSize+1;
		this.endPage = startPage + rangeSize-1;
		if(endPage>pageCount) {
			this.endPage=pageCount;
		}
		this.prevPage = currentPage-1;
		this.nextPage = currentPage+1;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public long getListCount() {
		return listCount;
	}

	public void setListCount(long listCount) {
		this.listCount = listCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getCurrentRange() {
		return currentRange;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getRangeCount() {
		return rangeCount;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
}