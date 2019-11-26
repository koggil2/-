package kr.goott.tour.product;

public class ScheduleVO {
	private int sc_num;			//일정번호
	private String goodCode;	//상품코드
	private String startDate;	//출발날짜
	private String backDate;	//도착날짜
	
	private String userId;		//사용자 아이디
	private int j_num;			//여행바구니 일련번호
	private int jang;			//여행바구니
	
	private int h_num;			//관심 일련번호
	private int heart;			//관심
	
	
	public int getSc_num() {
		return sc_num;
	}
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}
	public String getGoodCode() {
		return goodCode;
	}
	public void setGoodCode(String goodCode) {
		this.goodCode = goodCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getBackDate() {
		return backDate;
	}
	public void setBackDate(String backDate) {
		this.backDate = backDate;
	}
	
	
}
