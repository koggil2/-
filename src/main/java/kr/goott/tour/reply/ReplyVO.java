package kr.goott.tour.reply;

public class ReplyVO {
	
		
		private int num;//�۹�ȣ	rno
		private int sc_num;// sc_num(������ȣ)&goodCode(��ȣ) �ʿ���
		private String goodCode;//�Խñ۹�ȣ (�ڵ�) bno
		private String userId; //�ۼ��� username
		private int jumsu; //������
		private String content;	// ���� replytext
		private String regDate; // �ð� regdatetime 
		
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
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public int getJumsu() {
			return jumsu;
		}
		public void setJumsu(int jumsu) {
			this.jumsu = jumsu;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
	    public int getSc_num() {
			return sc_num;
		}
		public void setSc_num(int sc_num) {
			this.sc_num = sc_num;
		}
		public String getRegDate() {
			return regDate;
		}
		public void setRegDate(String regDate) {
			this.regDate = regDate;
		}
		// toString()
	    @Override
	    public String toString() {
	        return "ReplyVO [num=" + num + ", goodCode=" + goodCode + ", userId=" + userId + ", jumsu=" + jumsu
	                + ", content=" + content + ", regdate=" + regDate +"]";
	    }
	    
	
}
