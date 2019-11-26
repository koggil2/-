<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "구트투어";
	pageSideName = "결제하기";
	pageImage = "main_img_banner_8.jpg";
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/css/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit-icons.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

</script>
<style>
	#paymentMain{height:1000px;width:1500px;}
	#reservationRgt{float:left;width:700px;height:900px;background:lightgray;margin-top:50px;box-sizing: border-box;}
	#goPay{width:700px;background:gray;height:900px;float:left;margin-top:50px;}
	#reservationRgt div, #order div{margin-bottom:10px;}
	#reservationRgt h3, #goPay h3{text-align:left;margin-bottom:30px;margin-top:30px;}
	#reservationRgt label, #order label{float:left;
						  line-height:35px;
						  margin-bottom:0;
						  width:100px;
						  text-align:left;
						  }

	#reservationRgt input{width:300px;left:180px;position:relative;}
	#reservationRgt h5{text-align:left;margin-bottom:-15px;}
	#txt{size:15px;height:300px;width:600px;border-radius:5px;text-align:left;}
	/* ============ */
	#order{width:500px;height:400px;padding-left:30px;}
	#order input{width:300px;left:100px;position:relative;}
	#order div{border-bottom:1px solid red;width:650px;}
</style>
<section >
	<form id="paymentMain">	
		<div id="reservationRgt">
			<h3>주문자 정보</h3>
			<div><label>이름*</label><input type="text" class="ipf form-control" name="reserName" id="reserName" maxlength='15'></div>
			<div><label>이메일 주소*</label><input type="text" class="ipf form-control" name="reserEmail" id="reserEmail" maxlength='20'></div>
			<div><label>연락처*</label><input type="text" class="ipf form-control" name="reserTel" id="reserTel" maxlength='20'></div>
			<div><label>생년월일*</label><input type="text" class="ipf form-control" name="reserBirth" id="reserBirth" maxlength='20'></div>
			<div style="height:38px;"><label>주소*</label><input type="button" class="btn btn-secondary" name="reserZip" onclick="sample3_execDaumPostcode()" value="검색" style="width:100px;float:left;"></div>
			<div><input type="text" class="ipf form-control" name='addr' id='addr'style="width:400px;left:280px;text-align:left;"></div>
			<div><input type="text" class="ipf form-control" name='detailAddr' id='detailAddr' placeholder="* 상세주소 입력(필수)" style="width:400px;left:280px;text-align:left;"></div>
			
			
		</div>
		<div id="goPay">
			<h3>주문 상품정보</h3>
			<div id="order">
				<div><label>상품코드*</label><input type="text" class="ipf form-control" name="reserCode" id="reserCode" maxlength='20'></div>
				<div><label>인원*</label><input type="text" class="ipf form-control" name="reserPeople" id="reserPeople" maxlength='5'></div>
				<div><label>출발일*</label><input type="text" class="ipf form-control" name="reserGo" id="reserGo" maxlength='15'></div>
				<div><label>도착일*</label><input type="text" class="ipf form-control" name="reserBack" id="reserBack" maxlength='15'></div>
				<div><label>결제금액</label></div>
			</div>			
		</div>
	</form>
</section>