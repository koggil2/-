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
	$("#imgBannerText>h2").text("<%=pageSideName%>
	");
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

.container {
	margin-top: 200px;
	max-width: 1400px;
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

section {
	width: 1400px;
	margin: 0;
	padding: 0;
}

.tabcontent {
	display: none;
	color: #fff
}

.tabcontent.current {
	display: block;
}

/*  */


</style>
<script>
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

<!-- Page Content -->
<div id="listAll" class="container">
	<%@ include file="../inc/sf_list_sidebar.jspf"%>
	<div class="row">
		<!-- Sidebar -->
		<ul id="sidebar-wrapper" class="tabs">
			<li id="sidebar-top" class="sidebar-heading">TOUR LIST
				<ul id="sidebar-content" class="tab list-group list-group-flush">
					<!-- class tab -->
					<li class="current" data-tab="tab1"><a href="#"
						class="list-group-item list-group-item-action">수학여행</a></li>
					<li data-tab="tab2"><a href="#"
						class="list-group-item list-group-item-action">현장학습</a></li>
					<li data-tab="tab3"><a href="#"
						class="list-group-item list-group-item-action">가족여행</a></li>
					<li data-tab="tab4"><a href="#"
						class="list-group-item list-group-item-action">기업/일반단체</a></li>
				</ul>
			</li>
		</ul>


		<!-- /.col-lg-9  tab1-->

		<div id="tab1" class="col-lg-9 tabcontent current">


			<!-- 슬라이드 div  -->
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<!-- 1번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<!-- 여행분류과 상품코드 필요함. product_view?goodcode=?&treveltype=? -->
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">1111</a>
							</h4>
							<h5>30,000원</h5>
							<p class="card-text">남한산성과 수원화성 - 성남시, 수원시</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 2번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">22222</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 3번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">33333</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 4번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">Item Four</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 5번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">Item Five</a>
							</h4>
							<h5>$-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9825;</small>
						</div>
					</div>
				</div>
				<!-- 6번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">Item Six</a>
							</h4>
							<h5>$-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 id=tab1  끝-->

		<!-- /.col-lg-9  tab2-->

		<div id="tab2" class="col-lg-9 tabcontent">


			<!-- 슬라이드 div  -->
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<!-- 1번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">하나하나하나</a>
							</h4>
							<h5>30,000원</h5>
							<p class="card-text">남한산성과 수원화성 - 성남시, 수원시</p>
						</div>
						<div class="card-footer">
							<a href="product_view"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 2번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="product_view"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view">둘둘둘둘</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 3번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">셋셋셋셋</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 4번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Four</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 5번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Five</a>
							</h4>
							<h5>$-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9825;</small>
						</div>
					</div>
				</div>
				<!-- 6번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Six</a>
							</h4>
							<h5>$-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->

		</div>

		<!-- /.col-lg-9 id= tab2 끝 -->



		<!--  tab3 시작 -->
		<div id="tab3" class="col-lg-9 tabcontent">


			<!-- 슬라이드 div  -->
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<!-- 1번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">1111</a>
							</h4>
							<h5>30,000원</h5>
							<p class="card-text">남한산성과 수원화성 - 성남시, 수원시</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 2번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">22222</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 3번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">33333</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 4번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Four</a>
							</h4>
							<h5>-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>
				<!-- 5번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Five</a>
							</h4>
							<h5>$-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9825;</small>
						</div>
					</div>
				</div>
				<!-- 6번째 소메뉴  -->
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Six</a>
							</h4>
							<h5>$-</h5>
							<p class="card-text">없음</p>
						</div>
						<div class="card-footer">
							<a href="#"><small class="text-muted">&#9825;</small></a>
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 id=tab3  끝-->


	<!--  기업/일반단체 탭  -->
	<div id="tab4" class="col-lg-9 tabcontent">
		<div class="container">
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
	</div>
	</div>
	</div>
</div>
<!-- /.container #listAll 전체 div -->