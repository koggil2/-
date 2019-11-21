package kr.goott.tour.reply;

public class ReplyVO {
	
		//만족도 //
		private int num;
		private String goodCode;
		private String userId;
		private int jumsu;
		private String content;
		private String regdate;
		
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
		public String getReg_datetime() {
			return regdate;
		}
		public void setReg_datetime(String reg_datetime) {
			this.regdate = reg_datetime;
		}
		// 만족도 //
		
	    // toString()
	    @Override
	    public String toString() {
	        return "ReplyVO [num=" + num + ", goodCode=" + goodCode + ", userId=" + userId + ", jumsu=" + jumsu
	                + ", content=" + content + ", regdate=" + regdate +"]";
	    }
	    
	
}
