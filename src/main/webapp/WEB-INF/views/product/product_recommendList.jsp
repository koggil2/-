<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "구트투어";
	pageSideName = "여행상품";
	pageImage = "main_img_banner_3.jpg";
%>
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Dokdo|Jua|Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/css/uikit.min.css" />
<script defer src="/tour/resources/js/all.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit-icons.min.js"></script>
<script>
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");
	
			$(function() {
				$('ul.tab li').click(function() {
					var activeTab = $(this).attr('data-tab');
					$('ul.tab li').removeClass('current');
					$('.tabcontent').removeClass('current');
					$(this).addClass('current');
					$('#' + activeTab).addClass('current');
				})
			});
			/* 	$(function(){
			 $("#tabmenu>div").on("click",function(){
			 if(($(this).index() == 1)){
			 $(this).css("background","#00a7f0").css("color","white")
			 $("#tabmenu>div").not($(this)).css("background","white").css("border-bottom","1px solid #ddd").css("color","black")
			 $("#list2").css("display","block")
			 $("#list1").css("display","none")
			 }
			 else{
			 $(this).css("background","#00a7f0").css("color","white")
			 $("#tabmenu>div").not($(this)).css("background","white").css("border-bottom","1px solid #ddd").css("color","black")
			 $("#list1").css("display","block")
			 $("#list2").css("display","none")
			 }
			 })
			 }) */
</script>

<style>
#tabmenu {
	position: absolute;
	margin-left: 30%;
	top: 700px;
	left: 100px;
	width: 105px;
	height: 100px;
	margin: 0px auto;
	border: 1px solid #ddd;
}

#tabmenu>div {
	float: left;
	width: 100px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 1.1em
}

#tabmenu>div:nth-child(1) {
	background: #00a7f0;
	color: white
}

#list1, #list2 {
	width: 100%;
	height: 1500px;
	margin: 0px auto;
	margin-top: 20px;
	border: 1px solid #ddd
}

#list2 {
	display: none;
}

.col-lg-3 {
	max-width: 200px;
}

.img-fluid {
	width: 1225px;
}

a:link, a:hover, a:visited {
	text-decoration: none;
}

#sidebar-wrapper {
	width: 200px;
	position: absolute;
	left: 200px;
}

#sidebar-wrapper ul, #sidebar-wrapper li {
	font-size: 20px;
}

#sidebar-top {
	text-align: left;
	height: 50px;
	line-height: 40px;
	font-size: 30px;
}

#sidebar-content a {
	text-align: left;
}

.col-lg-9 {
	flex: 0 0 90%;
	max-width: 75%;
	min-width: 992px;
	margin: 22px 5px;
}

.tabcontent {
	display: none;
	color: #fff;
	margin: 0 auto;
}

.tabcontent.current {
	display: block;
}

.card-text{
	color: gray;
}
.listImgH{
	 height:180px;
	 overflow:hidden;
 }
.listImgH img{
	position: relative;
	top: -15px;
}
.carousel-item active img{width:900px;height:600px;}
</style>

<section>
<!-- Page Content -->
<div id="listAll" class="container">
	<%@ include file="../inc/sf_list_sidebar.jspf"%>
	<div class="row">
		<!-- Sidebar -->
		<ul id="sidebar-wrapper" class="tabs">
			<li id="sidebar-top" class="sidebar-heading">TOUR LIST
				<ul id="sidebar-content" class="tab list-group list-group-flush">
					<!-- class tab -->
					<li class="current" data-tab="tab1">
						<a href="" class="list-group-item list-group-item-action" onclick="return false">가족여행</a>
					</li>
					<li data-tab="tab2">
						<a href=""	class="list-group-item list-group-item-action" onclick="return false">수학여행</a>
					</li>
					<li data-tab="tab3">
						<a href=""	class="list-group-item list-group-item-action" onclick="return false">현장학습</a>
					</li>
					<li data-tab="tab4">
						<a href=""	class="list-group-item list-group-item-action" onclick="return false">기업/일반단체</a>
					</li>
				</ul>
			</li>
		</ul>

		<!-- /.col-lg-9  tab1-->
		<div id="tab1" class="col-lg-9 tabcontent current">

			<!-- 슬라이드 div  -->
			<div id="carousel1" class="carousel slide my-4"	data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel1" data-slide-to="0" class="active"></li>
					<li data-target="#carousel1" data-slide-to="1"></li>
					<li data-target="#carousel1" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_1.jpg" alt="First slide" style="width:960px;height:500px">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_2.jpg" alt="Second slide" style="width:960px;height:500px">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_3.jpg" alt="Third slide" style="width:960px;height:500px">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel1" role="button" data-slide="prev"> 
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="sr-only">Previous</span>
				</a> 
				<a class="carousel-control-next" href="#carousel1" role="button" data-slide="next"> 
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<!-- 1번째 소메뉴  -->
				<c:forEach var="t1" items="${list1}">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="product_view?goodCode=${t1.goodCode}" class="listImgH">
								<img src="/tour/imgUpload/${t1.fileName}">
							</a>
							<!-- 여행분류과 상품코드 필요함. product_view?goodcode=?&treveltype=? -->
							<div class="card-body">
								<h4 class="card-title">
									<a href="product_view?goodCode=${t1.goodCode}">${t1.goodName }</a>
								</h4>
								<h5>${t1.price}</h5>
								<p class="card-text">${t1.destination}, ${t1.travelTerm}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 id=tab1  끝-->


		<!-- /.col-lg-9  tab2-->
		<div id="tab2" class="col-lg-9 tabcontent">
			<!-- 슬라이드 div  -->
			<div id="carousel2" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel2" data-slide-to="0" class="active"></li>
					<li data-target="#carousel2" data-slide-to="1"></li>
					<li data-target="#carousel2" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_4.jpg" alt="First slide" style="width:960px;height:500px">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_5.jpg" alt="Second slide" style="width:960px;height:500px">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_6.jpg" alt="Third slide" style="width:960px;height:500px">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel2" role="button" data-slide="prev"> 
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="sr-only">Previous</span>
				</a> 
				<a class="carousel-control-next" href="#carousel2" role="button" data-slide="next"> 
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<!-- 1번째 소메뉴  -->
				<c:forEach var="t2" items="${list2}">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="product_view?goodCode=${t2.goodCode}" class="listImgH">
								<img src="/tour/imgUpload/${t2.fileName}">
							</a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="product_view?goodCode=${t2.goodCode}">${t2.goodName }</a>
								</h4>
								<h5>${t2.price}</h5>
								<p class="card-text">${t2.destination}, ${t2.travelTerm}</p>
							</div>
						</div>
					</div>
				 </c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 id= tab2 끝 -->

		<!--  tab3 시작 -->
		<div id="tab3" class="col-lg-9 tabcontent">
			<!-- 슬라이드 div  -->
			<div id="carousel3" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel3" data-slide-to="0" class="active"></li>
					<li data-target="#carousel3" data-slide-to="1"></li>
					<li data-target="#carousel3" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_7.jpg" alt="First slide" style="width:960px;height:500px">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_8.jpg" alt="Second slide" style="width:960px;height:500px">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/tour/image/main_img_banner_9.jpg" alt="Third slide" style="width:960px;height:500px">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel3" role="button" data-slide="prev"> 
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carousel3"	role="button" data-slide="next"> 
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<!-- 1번째 소메뉴  -->
				<c:forEach var="t3" items="${list3}">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="product_view?goodCode=${t3.goodCode}" class="listImgH">
								<img src="/tour/imgUpload/${t3.fileName}">
							</a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="product_view?goodCode=${t3.goodCode}">${t3.goodName}</a>
								</h4>
								<h5>${t3.price}</h5>
								<p class="card-text">${t3.destination}, ${t3.travelTerm}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 id=tab3  끝-->

		<!--  기업/일반단체 탭  -->
		<div id="tab4" class="col-lg-9 tabcontent">
		<%@ include file="counseling.jspf"%>
		
<!-- 			<div class="container">
				<table>
					<tr id="counselingTop">
						<td style="font-size:20px;color:lightblack;font-weight:bold">일반/기업 단체</td>
					</tr>
				</table>
				<div id="counselingImg">
					<div><a href=""><img src="../image/MenuLogo.png" style="width:200px;float:left;border-right:1px solid lightgray;" ></a></div>
					<div><h3>여행 컨설팅 제안</h3></div>
				</div>
			    <div style="padding:10px;text-align:left;" id="counselingCenter">
			         <p style="font-family: 'Poor Story', cursive;font-size:28px;text-align:center;background:lightblue;border-radius:15px"><i id="quo" class="fas fa-quote-left" style=""></i>목적과 참가자들에게 적합한 여행/연수 설계 <i id="quo2" class="fas fa-quote-right"></i></p>   
			    </div>
			    <h2 style="color:orange;margin-bottom:10px;"><i class="fas fa-hashtag" style="font-size:15px;"></i> 학생 단체여행, 일반 단체여행, 기업 단체여행, 연수까지!</h2>
			  	<h2 style="color:brown"><i class="fas fa-hashtag" style="font-size:15px;"></i> 단체 맞춤 여행 컨설팅 전문기업</h2>
			    <div id="counselingList" class="uk-child-width-1-3@m" uk-grid uk-scrollspy="cls: uk-animation-slide-bottom; target: .uk-card; delay: 300; repeat: true"> 	
			    	<ul class="uk-card uk-card-default uk-card-body" style="border-radius:15px">
			    		<li style="color:#fff;background:red;border-radius:10px">여행/연수 목적</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 문화유적답사</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 자연생태답사</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 기업 워크샵</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 리더십 캠프</li>
			    	</ul>
			    	<ul class="uk-card uk-card-default uk-card-body" style="border-radius:15px">
			    		<li style="color:#fff;background:blue;border-radius:10px">여행/연수 참가구성원</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 학생</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 동호회</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 기업 직장인</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 성인</li>
			    	</ul>
			    	<ul class="uk-card uk-card-default uk-card-body" style="border-radius:15px">
			    		<li style="color:#fff;background:green;border-radius:10px">여행/연수 희망지역</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 국내내륙여행</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 국내 섬 여행</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 해외여행</li>
			    		<li style="color:black;font-weight:bold;margin-left:50px;"><i class="far fa-circle" style="font-size:10px;position:relative;top:-2px;"></i> 리더십 캠프</li>
			    	</ul> 	
			    </div>
			    <div style="text-align: center;" class="uk-child-width-1-2@m uk-grid-match" style="">
			    	<button class="uk-button uk-button-primary" class="uk-card uk-card-default uk-card-body" uk-scrollspy="cls: uk-animation-slide-left; repeat: true" style="width:165px;border-radius:10px;top:30px;position:relative;margin:0 auto;left:-15px;">상담/신청하기 ></button>
			    </div>
			</div> -->
		</div>
	</div>
</div>
<!-- /.container #listAll 전체 div -->
</section>