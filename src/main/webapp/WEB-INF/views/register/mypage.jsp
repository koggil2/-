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

	
	
</script>
<style>
	#myProfile{height:300px;}
	#myProfile>div{border:1px solid #ddd; border-radius:5px; width:48.5%; float:left; height:280px;}
	#profileDiv{margin-right:30px; }
	#myProfile h4{margin-top:10px}
	#profileDiv>div{width:150px; height:150px; margin:20px 60px; border-radius:50%; overflow:hidden; float:left}
	#profileDiv h5{margin-top:70px; margin-bottom:10px}
	#profileDiv img{width:230px; position:relative; top:-40px; left:-40px;}
	#membershipDiv>div{width:100%; float:left; margin:50px auto;}
	#membershipDiv>select{margin-top:60px; margin-bottom:10px}
	#myReservation ,#myLike{margin:20px auto;}
	#myReservation>div>h3, #myLike>div>h3, #myPay>div>h3{float:left; line-height:30px}
	#myReservation>div>h5, #myLike>div>h5, #myPay>div>h5{float:right; line-height:30px}
	
	#revData , #payData {table-layout:fixed}
	#revData tr>td, #payData tr>td{width:10%}
	#revData tr>td:nth-child(2), #payData tr>td:nth-child(2){width:25%; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
	#revData tr>td:nth-child(6), #payData tr>td:nth-child(6){width:6%}
	#revData tr>td:nth-child(8), #payData tr>td:nth-child(8){width:9%}
	
 	#profileDiv input{width:120px;margin-top:5px;} 
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
			
			<input type="button" id ="edit-btn" class="btn btn-secondary" value="회원정보수정" onclick="location.href='editForm?userId=${logid}'"/><br/>
			<input type="button" id ="del-btn" class="btn btn-secondary" value="회원탈퇴" onclick="location.href='del?userId=${logid}'"/>
		</div>
		<div id="membershipDiv">
			<h4>회원등급</h4>
			<hr/>
			<div>
				<h3>나의 등급</h3>
				<h2 style="font-weight:bold; color:blue;">${memType}</h2>
			</div>
		</div>
	</div>
	<div id="myLike">
	<div><h3>■ 관심</h3></div>
		<table id="likeData" class="table table-bordered">
		  <tr>
			<td>상품코드</td>
			<td>상품명</td>
		    <td>출발일</td>
		 	<td>도착일</td>
		    <td>금액</td>
		  </tr>
		  <c:forEach var="l" items="${l_list}">
		  <tr>
		    <td><a href='#'>${l.goodCode}</a></td>
		   	<td>${pvo.goodName}</td>
			<td>${svo.startDate}</td>
			<td>${svo.backDate}</td>
		    <td>${pvo.price}</td>
		  </tr>
		  </c:forEach>
		</table>
	</div>
	<div id="myReservation">
	<div><h3>■ 예약정보</h3></div>
		<table id="revData" class="table table-bordered">
		  <tr>
			<td>상품코드</td>
			<td>상품명</td>
		    <td>출발일</td>
		 	<td>도착일</td>
		    <td>인원</td>
		    <td>금액</td>
		    <td>예약날짜</td> 
		    <td>예약</td>
		  </tr>
		  <c:forEach var="r" items="${r_list}">
			  <tr>
			    <td><a href='#'>${r.goodCode}</a></td>
			    <td>${pvo.goodName}</td>
			    <td>${svo.startDate}</td>
			    <td>${svo.backDate}</td>
			    <td>${r.goodNum}</td>
			    <td>${r.price}</td>
			    <td>${r.reserDate}</td>
			    <td>${r.state}</td>
			  </tr>
		  </c:forEach>
		</table>
	</div>
	<div id="myPay">
	<div><h3>■ 결제정보</h3></div>
		<table id="payData" class="table table-bordered">
		  <tr>
			<td>상품코드</td>
			<td>상품명</td>
		    <td>출발일</td>
		 	<td>도착일</td>
		 	<td>인원</td>
		    <td>가격</td>
		    <td>결제날짜</td>
		    <td>결제</td>
		  </tr>
		  <c:forEach var="p" items="${p_list}">
			  <tr>
			    <td><a href='#'>${p.goodCode}</a></td>
			    <td>${pvo.goodName}</td>
			    <td>${svo.startDate}</td>
			    <td>${svo.backDate}</td>
			    <td>${p.goodNum}</td>
			    <td>${p.price}</td>
			    <td>${p.payDate }</td>
			    <td>${p.pay}</td>
			  </tr>
		  </c:forEach>
		</table>
	</div>
</section>