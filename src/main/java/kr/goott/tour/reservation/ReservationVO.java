package kr.goott.tour.reservation;

public class ReservationVO {
	private int num;
	private String goodCode;
	private int sc_num;
	private String userId;
	
	private String t1;
	private String t2;
	private String t3;
	private String reserTel;
	private String reserName;
	private String reserEmail;
	private String emailDomain;
	private String emailId;
	
	private String reserDate;//예약날짜
	private int price;
	private String payDate;//결제날짜
	private int goodNum;//인원
	private String state;//예약상태
	private String pay;//결제
	private String goodOk;//상품평유무
	private String resermemo;//문의사항
	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGoodCode() {
		return goodCode;
	}
	public void setGoodCode(String goodCode) {
		this.goodCode = goodCode;
	}
	public int getSc_num() {
		return sc_num;
	}
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getT1() {
		return t1;
	}
	public void setT1(String t1) {
		this.t1 = t1;
	}
	public String getT2() {
		return t2;
	}
	public void setT2(String t2) {
		this.t2 = t2;
	}
	public String getT3() {
		return t3;
	}
	public void setT3(String t3) {
		this.t3 = t3;
	}
	public String getReserTel() {
		return reserTel;
	}
	public void setReserTel(String reserTel) {
		this.reserTel = reserTel;
		
		String t[] = reserTel.split("-");
		t1 = t[0];
		t2 = t[1];
		t3 = t[2]; 
	}
	public String getReserEmail() {
		return reserEmail;
	}
	public void setReserEmail(String reserEmail) {
		this.reserEmail = reserEmail;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getReserDate() {
		return reserDate;
	}
	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getGoodOk() {
		return goodOk;
	}
	public void setGoodOk(String goodOk) {
		this.goodOk = goodOk;
	}
	public String getResermemo() {
		return resermemo;
	}
	public void setResermemo(String resermemo) {
		this.resermemo = resermemo;
	}
	public String getReserName() {
		return reserName;
	}
	public void setReserName(String reserName) {
		this.reserName = reserName;
	}
	
	
	

	
	
	
}
