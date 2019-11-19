package kr.goott.tour.board;

public class BoardVO {
	private int num;//db에 저장 된 진짜 번호
	private int no; //리스트에 보여질 번호
	private String commuPage;
	private String userId;
	private String subject;
	private String content;
	private String regDate;
	private int hit;
	
	//페이징에 필요한 변수
	private int pageNum=1;//현재페이지
	private int onePageRecord=10;//한페이지당 출력할 레코드 수
	private int totalPage;//총페이지수
	private int totalRecord;//총레코드수
	private int startPage;//페이지 넘버 시작값
	private int onePageMax=10;//한번에 출력할 페이징번호 수
	
	//검색
	private String searchKey;//검색키
	private String searchWord;//검색어
	
	
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCommuPage() {
		return commuPage;
	}
	public void setCommuPage(String commuPage) {
		this.commuPage = commuPage;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getOnePageMax() {
		return onePageMax;
	}
	public void setOnePageMax(int onePageMax) {
		this.onePageMax = onePageMax;
	}
	
	
}
