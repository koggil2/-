package kr.goott.tour.board;

public class BoardVO {
	private int num;//db�� ���� �� ��¥ ��ȣ
	private int no; //����Ʈ�� ������ ��ȣ
	private String commuPage;
	private String userId;
	private String subject;
	private String content;
	private String regDate;
	private int hit;
	
	//����¡�� �ʿ��� ����
	private int pageNum=1;//����������
	private int onePageRecord=10;//���������� ����� ���ڵ� ��
	private int totalPage;//����������
	private int totalRecord;//�ѷ��ڵ��
	private int startPage;//������ �ѹ� ���۰�
	private int onePageMax=10;//�ѹ��� ����� ����¡��ȣ ��
	
	//�˻�
	private String searchKey;//�˻�Ű
	private String searchWord;//�˻���
	
	
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
