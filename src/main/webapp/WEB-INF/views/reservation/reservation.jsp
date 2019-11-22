<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "구트투어";
	pageSideName = "예약하기";
	pageImage = "main_img_banner_8.jpg";
%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/css/uikit.min.css" />

<script src="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit-icons.min.js"></script>
	<style>
			*{font-family:'Noto Sans KR',sans-serif;}
			#tbid{width:100%; margin-top:10px; }
			#trid th{font-size:25px; font-weight:bold; }
			h1{text-align:left; margin-top:10px;}
			a:link, a:visited{color:red; text-decoration:none;}
			a:hover{color:blue; text-decoration:underline;}
			#join form, #join p{text-align:left; font-weight:bold; font-size: 20px;}
			ol,ul{padding-left:0;}
			#telid{width:20px;}  
			#btn-rev{text-align:center; marign:50px auto; }
			#btn-rev button{margin:50px auto;width:100%; height:50px; background:#00a7f0; color:white}
			#rev-tel, #trv-tel, #rev-email, #rev-tel1, #rev-email1, #rev-txt{height:40px; text-align:center; } 
			#email-bar, #email-bar2, #email-bar3, #email-bar4{width:181px; height:34px;text-align:left;}
			#rev-name1, #rev-name, #trv-name{text-align:left;margin-top:10px;}
			#rev-txt{text-align:left;}
	
		
     	</style>
    	<script type="text/javascript">
    	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
    	$("#imgBannerText>h1").text("<%=pageName%>");
    	$("#imgBannerText>h2").text("<%=pageSideName%>");
    	
    	$(function(){
/*     		var same = $(this).checked;
    		$('#samecheck').click(function(){
    			var temp = document.getElementById('rev-name').value
    			var temp2 = document.getElementById('rev-tel').value
    			var temp3 = document.getElementById('rev-tel2').value
    			document.getElementById('trv-name').value=temp;
    			document.getElementById('trv-tel').value=temp2;
    			document.getElementById('trv-tel2').value=document.getElementById('rev-tel2').value;
    			document.getElementById('trv-tel3').value=document.getElementById('rev-tel3').value;
    			if(same===true){
    				$('#samecontent input').filter('input:text')
    				.attr('disabled','disabled')
    				.css('opactiy', 0.5);
    			}else	
	    			$('#samecontent input').filter('input:text').attr('readonly',false)
	    			.css('opacity', 1);
    		}); */
    		
			$('#btn1').on('click',function(){
				$(this).css('background-color','orange').css('color','#fff');
				alert('예약이완료됨.');
			});
				
			$("#samecheck").change(function(){
				if(this.checked){
					for(i=1; i<=6; i++){
						$("#sameFrm input:nth-of-type("+i+")").val($("#reserFrm input:nth-of-type("+i+")").val());
					}
					$("#sameFrm input").prop("readonly",true);
				}else{
					$("#sameFrm input").val("");
					$("#sameFrm input").prop("readonly",false);
				}
			});
    	}); 
     	</script>



<section style="text-align:left">
	<%@ include file="../inc/sidebar.jspf" %>
	<div id='main'>
	<h1 id='rev-h1'>예약하기</h1>
	<hr class="hrStyle"/>
		<table class="table table-bordered" style="table-layout:fixed">
			<thead>
			  <tr>
				<th style='width:145px;'>예약날짜</th> 
				<th style='width:130px;'>상품코드</th>
				<th style='width:200px;'>상품명</th>
				<th style='width:100px;'>결제금액</th>
				<th style='width:60px;'>인원</th>
			    <th style='width:145px;'>출발일</th>
			    <th>여행도우미</th>
			    <th style="width:90px">예약상태</th>
			    <th>상품평</th>
			  </tr>
			</thead>
			<tbody id='rev-body'>
			  <tr>
			    <td>2019년9월19일</td>
			    <td><a href='#'>AAP3412TWB</a></td>
			    <td style="width:240px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">제주도 5일_특급 신라호텔 바로출발제주도 5일_준특급 신라호텔</td>
			    <td>500,000</td>
			    <td>2</td>
			    <td>2019년10월20일</td>
			    <td>man</td>
			    <td>Yes</td>
			    <td><button class='btn btn-secondary'>작성하기 </button></td>
			  </tr>
			</tbody>
		</table>
	<div id='join'>
	
	<form id="reserFrm">
		예약자
		<div class="uk-margin" id='rev-name'>
	        <div class="uk-inline" id="rev-User" style="width:150px;text-align: left">
	            <span class="uk-form-icon" uk-icon="icon: user"></span>
	            <input class="uk-input" type="text">
	        </div>
	    </div>
		연락처
		<div class="uk-margin" id='rev-tel' style="max-width:;">
	        <div class="uk-inline" id="" style="float:left;">
	            <span class="uk-form-icon" uk-icon="icon: receiver"></span>
	            <input class="uk-input" type="text" style="width:150px;text-align:center;"maxlength="3"name='rev-tel1' id='rev-tel1'> -
	            <input class="uk-input" type="text" style="width:130px;text-align:left;"maxlength="4"name='rev-tel2' id='rev-tel2'> -
	            <input class="uk-input" type="text" style="width:130px;text-align:left;"maxlength="4"name='rev-tel3' id='rev-tel3'>
	        </div>
	    </div>
		이메일
		<div class="uk-margin" id='rev-email' style="max-width:;">
	        <div class="uk-inline" id="" style="float:left;">
	            <span class="uk-form-icon" uk-icon="icon: mail"></span>
	            <input class="uk-input" type="text" style="width:230px;text-align:center;"maxlength="15"> @
	            <input class="uk-input" type="text" style="width:200px;text-align:left;"maxlength="15"> 
	            
	        </div>
	    </div>
		</form>		 
		<hr style='margin:10px auto;'/>
		<br/> 
		<div id='samecontent'>
		<p style='margin-top: -15px; font-size:15px'><input type='checkbox' id='samecheck' >실제 여행자와 예약자가 동일하면 체크해주세요.</p>
		</div>
		<hr style='margin:10px auto;'/>

	<form id="sameFrm">
		예약자
		<div class="uk-margin" id='rev-name1'>
	        <div class="uk-inline" id="reservationUser" style="width:150px;text-align: left">
	            <span class="uk-form-icon" uk-icon="icon: user"></span>
	            <input class="uk-input" type="text">
	        </div>
	    </div>
		연락처
		<div class="uk-margin" id='rev-tel1'>
	        <div class="uk-inline" id="reservationTel" style="float:left;">
	            <span class="uk-form-icon" uk-icon="icon: receiver"></span>
	            <input class="uk-input" type="text" style="width:150px;text-align:center;"maxlength="3"name='trv-tel' id='trv-tel'> -
	            <input class="uk-input" type="text" style="width:130px;text-align:left;"maxlength="4"name='trv-tel2' id='trv-tel2'> -
	            <input class="uk-input" type="text" style="width:130px;text-align:left;"maxlength="4"name='trv-tel3' id='trv-tel3'>
	        </div>
	    </div>
		이메일
		<div class="uk-margin" id='rev-email1'>
	        <div class="uk-inline" id="reservationEmail" style="float:left;">
	            <span class="uk-form-icon" uk-icon="icon: mail"></span>
	            <input class="uk-input" type="text" style="width:230px;text-align:center;"maxlength="15"> @
	            <input class="uk-input" type="text" style="width:200px;text-align:left;"maxlength="15"> 
	        </div>
	    </div>
		문의사항
		<div class="uk-margin" id='rev-txt'>
			<div class="uk-inline" id="reservationCommenting" style="float:left;">
		        <textarea class="uk-textarea" rows="5" style="font-size:20px;width:450px;"></textarea>
	        </div>
	    </div>
		<div id='btn-rev'>
		<a href='https://www.naver.com'><button class='btn active' id='btn1'>예약하기</button></a>
		</div>
	</form>
	</div>	
	</div>	
</section>