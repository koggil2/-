package kr.goott.tour.product;

public class ScheduleVO {
	private int sc_num;			//������ȣ
	private String goodCode;	//��ǰ�ڵ�
	private String startDate;	//��߳�¥
	private String backDate;	//������¥
	
	private String userId;		//����� ���̵�
	private int j_num;			//����ٱ��� �Ϸù�ȣ
	private int jang;			//����ٱ���
	
	private int h_num;			//���� �Ϸù�ȣ
	private int heart;			//����
	
	
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
