<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "구트투어";
	pageSideName = "마이 페이지";
	pageImage = "main_img_banner_7.jpg";
%>
<script>
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");

	$(function(){
		$("#edit-btn").click(function(){
			location.href= "/Hye/project/register/registerEdit.do";
		})
	})
	

</script>
<style>
	#myProfile{height:300px;}
	#myProfile>div{border:1px solid #ddd; border-radius:5px; width:48.5%; float:left; height:280px;}
	#profileDiv{margin-right:30px; }
	#myProfile h4{margin-top:10px}
	#profileDiv>div{width:150px; height:150px; margin:20px 60px; border-radius:50%; overflow:hidden; float:left}
	#profileDiv h5{margin-top:70px; margin-bottom:10px}
	#profileDiv img{width:230px; position:relative; top:-40px; left:-40px;}
	#membershipDiv>div{width:50%; float:left; margin-top:50px}
	#membershipDiv>select{margin-top:60px; margin-bottom:10px}
	#myReservation{margin:20px auto;}
	#myReservation>div>h3{float:left; line-height:30px}
	#myReservation>div>h5{float:right; line-height:30px}
	
	#revData{table-layout:fixed}
	#revData tr>td{width:12%}
	#revData tr>td:nth-child(3){width:25%; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
	#revData tr>td:nth-child(6){width:6%}
	#revData tr>td:nth-child(8){width:9%}
</style>

<section>
	<h2>마이페이지</h2>
	<hr class="hrStyle"/>
	<div id="myProfile">
		<div id="profileDiv">
			<h4>내 프로필</h4>
			<hr/>
			<div><img src="/tour/image/myPageProfile.png"/></div>
			<h5>${logname}님</h5>
			
			<input type="button" id ="edit-btn" class="btn btn-secondary" value="회원정보수정"/>
		</div>
		<div id="membershipDiv">
			<h4>회원등급</h4>
			<hr/>
			<div>
				<h5>나의 등급</h5>
				<h3 style="font-weight:bold"><a href="/tour/image/membership.jsp">${memType}</a></h3>
			</div>
			<select><option>사용가능한 쿠폰</option></select>
			<h6>쿠폰내역</h6>
		</div>
	</div>
	<div id="myReservation">
	<div><h3>■ 예약정보</h3><h5><a href="/tour/image/reservationchk.jsp">더보기</a></h5></div>
		<table id="revData" class="table table-bordered">
		  <tr>
			<td>예약날짜</td> 
			<td>상품코드</td>
			<td>상품명</td>
		    <td>출발일</td>
		 	<td>도착일</td>
		    <td>인원</td>
		    <td>결제금액</td>
		    <td>상태</td>
		  </tr>
		  <tr>
		    <td>2019년9월19일</td>
		    <td><a href='#'>AAP3412TWB</a></td>
		    <td>제주도 5일_특급 신라호텔 바로출발,제주도 5일_특급 신라호텔 바로출발</td>
		    <td>2019년10월20일</td>
		    <td>2019년10월22일</td>
		    <td>2</td>
		    <td>500,000</td>
		    <td>예약대기</td>
		  </tr>
		</table>
	</div>
</section>