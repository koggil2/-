package kr.goott.tour.product;

public class ProductVO {
	//상품  ( *규칙* 합성어 시작은 대문자)
	private int num;
	private String goodCode;
	private String travelType;
	private String goodName;
	private String startArea;
	private String destination;
	private String regDate;
	private String travelTerm;
	private String goodData;
	private int price;
	private int reserMin;
	private int reserNum;
	private String assure1;
	private String assure2;
	private String assure3;
	
	private String startDate;
	private String backDate;
	
	public ProductVO() {}
	public ProductVO(int num, String goodCode, String travelType, String goodName, String startArea, String destination, String regDate, String travelTerm,
		   			String goodData, int price, int reserMin, int reserNum, String assure1, String assure2, String assure3, String startDate, String backDate) {
		this.num=num;
		this.goodCode=goodCode;
		this.travelType=travelType;
		this.goodName=goodName;
		this.startArea=startArea;
		this.destination=destination;
		this.regDate=regDate;
		this.travelTerm=travelTerm;
		this.goodData=goodData;
		this.price=price;
		this.reserMin=reserMin;
		this.reserNum=reserNum;
		this.assure1=assure1;
		this.assure2=assure2;
		this.assure3=assure3;
		this.startDate=startDate;
		this.backDate=backDate;
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
	public String getTravelType() {
		return travelType;
	}
	public void setTravelType(String travelType) {
		this.travelType = travelType;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getStartArea() {
		return startArea;
	}
	public void setStartArea(String startArea) {
		this.startArea = startArea;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getTravelTerm() {
		return travelTerm;
	}
	public void setTravelTerm(String travelTerm) {
		this.travelTerm = travelTerm;
	}
	public String getGoodData() {
		return goodData;
	}
	public void setGoodData(String goodData) {
		this.goodData = goodData;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getReserMin() {
		return reserMin;
	}
	public void setReserMin(int reserMin) {
		this.reserMin = reserMin;
	}
	public int getReserNum() {
		return reserNum;
	}
	public void setReserNum(int reserNum) {
		this.reserNum = reserNum;
	}
	public String getAssure1() {
		return assure1;
	}
	public void setAssure1(String assure1) {
		this.assure1 = assure1;
	}
	public String getAssure2() {
		return assure2;
	}
	public void setAssure2(String assure2) {
		this.assure2 = assure2;
	}
	public String getAssure3() {
		return assure3;
	}
	public void setAssure3(String assure3) {
		this.assure3 = assure3;
	}

}
