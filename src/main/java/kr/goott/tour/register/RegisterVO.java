package kr.goott.tour.register;

public class RegisterVO {
	
	private int num;
	private String userId;
	private String userPwd;
	private String userName;
	
	private String t1;
	private String t2;
	private String t3;
	private String tel;
	
	private String zipCode;
	private String addr;
	private String detailAddr;
	
	private String email;
	private String emailDomain;
	private String emailId;
	
	private String memType;
	
	

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
		return t1+"-"+t2+"-"+t3;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String t[] = tel.split("-");
		t1 = t[0];
		t2 = t[1];
		t3 = t[2]; 
		
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getEmail() {
		return emailId+"@"+emailDomain;
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
	
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}

	
}
