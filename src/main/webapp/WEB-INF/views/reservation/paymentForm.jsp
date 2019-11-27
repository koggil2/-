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
	#paymentMain{height:800px;width:1100px;}
	#reservationRgt{float:left;width:550px;height:900px;background:;margin-top:50px;box-sizing: border-box;}
	#goPay{width:550px;background:;height:900px;float:left;margin-top:50px;}
	#reservationRgt div, #order div{margin-bottom:10px;}
	#reservationRgt h3, #goPay h3{text-align:left;margin-bottom:30px;margin-top:30px;}
	#reservationRgt label, #order label{float:left;
						  line-height:35px;
						  margin-bottom:0;
						  width:100px;
						  text-align:left;
						  }

	#reservationRgt input{width:300px;left:80px;position:relative;}
	#reservationRgt h5{text-align:left;margin-bottom:-15px;}
	#txt{size:15px;height:300px;width:600px;border-radius:5px;text-align:left;}
	/* ============ */
	#order{width:450px;height:500px;padding-left:30px;padding-top:15px;left: 70px;
    position: relative;border:1px solid black;}
	#order input{width:300px;left:100px;}
	#order div{border-bottom:1px solid lightgray;width:400px;height:35px;}
	#order label:nth-child(even){float:right;}
	#order div:nth-child(5){top:15px;position:relative;border-bottom:#fff}
	#order div:nth-child(6), #order div:nth-child(7), #order div:nth-child(8), #order div:nth-child(9){border-bottom:#fff}
	#order div:nth-child(6) label{font-size:30px;width:145px;}
	#goPay h3{left:70px;position:relative;}
</style>
<section>
	<form id="paymentMain">	
		<div id="reservationRgt">
			<h3>주문자 정보</h3>
			<div><label>이름*</label><input type="text" class="ipf form-control" name="reserName" id="reserName" maxlength='15' value="${vo3.reserName }" readonly></div>
			<div><label>이메일 주소*</label><input type="text" class="ipf form-control" name="reserEmail" id="reserEmail" maxlength='20' value="${vo3.reserEmail }" readonly></div>
			<div><label>연락처*</label>
				<input type="text" class="ipf form-control" name="reserTel" id="reserTel1" maxlength='10' value="${vo3.reserTel }" style="" readonly>
			</div>
			<div class="uk-margin">
            	<label>문의 사항*</label><textarea class="uk-textarea" rows="5" style="width:480px;height:200px;float:left;" value="${vo3.resermemo }" readonly></textarea>
        	</div>		
			
		</div>
		<div id="goPay">
			<h3>주문 상품정보</h3>
			<div id="order" style="background:#fff">
				<div><label>상품코드*</label><label>${vo3.goodCode }</label></div>
				<div><label>인원*</label><label>${vo3.goodNum }</label></div>
				<div><label>출발일*</label><label></label></div>
				<div><label>도착일*</label><label>AAAA04</label></div>
				<div><label></label><label>총 결제금액</label></div>
				<div><label></label><label>199000원</label></div>
				<div class="uk-margin uk-grid-small uk-child-width-auto uk-grid" style="    margin-bottom: -25px;">
            		<label style="width: 150px;font-size: 15px;"><input class="uk-radio" type="radio" name="radio2" style="width:16px;left:0;" checked> 신용카드 결제</label>
            	</div>
            	<div class="uk-margin uk-grid-small uk-child-width-auto uk-grid" style="margin-bottom: -25px;">
            		<label style="width:150px;"><input class="uk-radio" type="radio" name="radio2" style="width:16px;left:0;" > 실시간 계좌이체</label>
            	</div>
            	<div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
            		<label style="width:150px;"><input class="uk-radio" type="radio" name="radio2" style="width:16px;left:0;" > 가상계좌 결제</label>
            		
            	</div>
            	<input type="button" class="btn btn-danger" name="paying" onclick="" value="결제하기" style="left:-10px;position:relative;width:400px;top:40px;">
            	
            		
            	
			</div>			
		</div>
	</form>
</section>