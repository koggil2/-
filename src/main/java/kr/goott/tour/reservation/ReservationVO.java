package kr.goott.tour.reservation;

public class ReservationVO {
	private int num;
	private String goodCode;
	private int sc_num;
	private String userId;
	private String t1;
	private String t2;
	private String t3;
	private String tel;
	
	private String email;
	private String emailDomain;
	private String emailId;
	
	
	private String goodMemo;
	private String reserDate;//���೯¥
	private int price;
	private String payDate;//������¥
	private int goodNum;//�ο�
	private String state;//�������
	private String pay;//����
	private String goodOk;//��ǰ������
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String t[] = tel.split("-");
		t1 = t[0];
		t2 = t[1];
		t3 = t[2]; 
		
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		
		String mail[] = email.split("@");
		emailId = mail[0];
		emailDomain = mail[1];
		
		
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
	public String getGoodMemo() {
		return goodMemo;
	}
	public void setGoodMemo(String goodMemo) {
		this.goodMemo = goodMemo;
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
	
	

	
	
	
}
