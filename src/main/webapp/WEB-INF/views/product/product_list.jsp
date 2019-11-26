<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "구트투어";
	pageSideName = "여행상품";
	pageImage = "main_img_banner_8.jpg";
%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script>
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");
</script>
<style>



</style>

<section>
	<div class="container">
	  <h2>여행상품</h2>
	  <p>여행상품 리스트입니다.</p>            
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>사진</th>
	        <th>상품코드</th>
	        <th>여행분류</th>
	        <th>상품명</th>
	        <th>출발지</th>
	        <th>도착지</th>
	        <th>기간</th>
	        <th>가격</th>
	        <th>정원수</th>
	       	<th>최소인원</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="p" items="${list}">
	    		<tr>
	    			<td>상품이미지</td>
	    			<td>${p.goodCode}</td>
	    			<td>${p.travelType}</td>
	    			<td><a href="product_view?goodCode=${p.goodCode}&userId=${logid}">${p.goodName}</a></td>
	    			<td>${p.startArea}</td>
	    			<td>${p.destination}</td>
	    			<td>${p.travelTerm}</td>
	    			<td>${p.price}</td>
	    			<td>${p.reserNum}</td>
	    			<td>${p.reserMin}</td>
	    		</tr>
	    	</c:forEach>
	    </tbody>
	  </table>
	</div>
</section>