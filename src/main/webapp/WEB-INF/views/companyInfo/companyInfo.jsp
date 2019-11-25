<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "회사소개";
	pageSideName = "구트투어 회사소개";
	pageImage = "main_img_banner_6.jpg";
%>

<script>
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");
</script>

<style>
	*{font-family:'Noto Sans KR',sans-serif;}
	section h1{text-align:left; margin-left:30px; margin-top:40px}
	.divForm{width:100%; text-align:left; padding-left:120px; padding-right:120px;}
	section>div:last-child{text-align:center}
	hr{border:0; height: 3px; background:#ccc linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));}
	
	#history,#summary{width:100%;}
	#history tr td:first-child, #summary tr td:first-child{width:20%; height:100%; color:#00a7f0;}
	#history tr, #summary tr{border-bottom:1px dashed gray}
	#history tr:last-child, #summary tr:last-child{border-bottom:0px}
	#history tr td, #summary tr td{text-align:left; padding-left:30px; padding-top:10px; padding-bottom:10px}
	
	#goottMap{margin-left:15%; margin-top:50px}
	.title{text-align:left;}
	#goottMap li{margin-left:3px; margin-right:3px}
</style>

<section>
	<%@ include file="../inc/sidebar.jspf"%>
	<h1>회사소개</h1><hr/>
	<div class="divForm">
		우리 구트투어는 다양한 테마(수학여행,체험학습 등)의 여행을 기준으로 사용자가 원하는 여행을 제공하고,<br/>
		정해져 있는 여행이 아닌 사용자가 원하는 여행을 직접 만들어 여행할 수 있게 도와드리고 있습니다.<br/><br/>
		단체여행을 중점으로 다른 여행에 비해 저렴한 가격으로 고객님께서 이용하실 수 있고,<br/>
		해외여행 을 추구하는 최근 경향 과 다르게 국내의 다양한 장소를 사용자가 경험할 수 있게 하는 것을 목표로 하고있습니다. 
	</div>
	<h1>회사개요</h1><hr/>
	<div class="divForm">
		<table id="summary">
			<tr>
				<td>회사명</td>
				<td>구트투어</td>
			</tr>
			<tr>
				<td>소재지</td>
				<td>서울시 구로구 구로동</td>
			</tr>
			<tr>
				<td>대표이사</td>
				<td>누구</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>00-0000-0000</td>
			</tr>
			<tr>
				<td>설립일</td>
				<td>2200.01.01</td>
			</tr>
			<tr>
				<td>주요사업</td>
				<td>사업자등록번호:123-45-67890/국내관광업</td>
			</tr>
			<tr>
				<td>주요서비스</td>
				<td>일반여행업(제76호)</td>
			</tr>
		</table>
	</div>
	<h1>회사연혁</h1><hr/>
	<div class="divForm">
		<table id="history">
			<tr>
				<td>2200.01</td>
				<td>회사설립<br/>
					첫계약성사<br/>
					폐업
				</td>
			</tr>
			<tr>
				<td>2019.10</td>
				<td>회사설립</td>
			</tr>
			<tr>
				<td>2019.11</td>
				<td>폐업</td>
			</tr>
			<tr>
				<td>2200.04</td>
				<td>회사설립</td>
			</tr>
			<tr>
				<td>2200.10</td>
				<td>폐업</td>
			</tr>
			<tr>
				<td>2300.11</td>
				<td>회사설립</td>
			</tr>
			<tr>
				<td>3019.09</td>
				<td>폐업</td>
			</tr>
		</table>
	</div>
	<h1>오시는길</h1><hr/>
	<div class="divForm">
		<div id="goottMap">
			<!--
				* 카카오맵 - 약도서비스
				* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
				* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
			-->
			<!-- 1. 약도 노드 -->
			<div id="daumRoughmapContainer1569207905305" class="root_daum_roughmap root_daum_roughmap_landing"></div>
			
			<!-- 2. 설치 스크립트 -->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			
			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1569207905305",
					"key" : "v53e",
					"mapWidth" : "640",
					"mapHeight" : "360"
				}).render();
			</script>
		</div>
	</div>		
</section>