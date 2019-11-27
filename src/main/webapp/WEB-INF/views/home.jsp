<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width,initial-scale=1">
<title>GOOTTOUR</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/tour/resources/css/headerFooterStyle.css" type="text/css"/>
<link rel="stylesheet" href="/tour/resources/css/home.css" type="text/css"/>
<%

%>
</head>
	<script>
		var imgNum = 1;
		$(function(){
			var sectionHeight = $("section").height();
			var sideBarHeight = $("#sideBar").height();
			
			if(sideBarHeight>=sectionHeight){
				$("section")};
			
			var imgBannerTextWidth = $("#imgBanner>div").width();
			$("#imgBanner>div").css("left",(1920-imgBannerTextWidth)/2+"px");
			
			//배너 이미지 변경
			$("#bannerImg").click(function(){
				$("#bannerImg").attr("src","/tour/image/mainimg"+imgNum+".jpg");
				imgNum++;
				if(imgNum>5)imgNum=1;
			});
			
			$(".overlay").click(function(){
				$("#bannerImg").attr("src","/tour/image/mainimg"+imgNum+".jpg");
				imgNum++;
				if(imgNum>5)imgNum=1;
			});
			
			
			//자동이벤트 발생
			setInterval(function(){
					//						이벤트.
					$("#bannerImg").trigger("click");
			}, 8000);
			
			
			//검색
			$(".searchBtn").on("click",function(){
				location.href="search?searchWord="+$(this).prev().val();
			});
		});
		
	</script>
<body>
		<header class="navbar navbar-expand-lg" id='mainbanner'>
			<div>
				<div id="mainMenu">
					<!-- 작은메뉴 -->
					<ul id="miniMenu" class="navbar-header">
					<li class="nav-item"><a href="/tour/board/list?commuPage=infoCenter">고객센터</a></li>
					<c:if test="${logid!=null }">
					<li class="nav-item"><a href="/tour/reservation/basket?userId=${logid}">여행바구니</a></li>
					</c:if>
					<c:if test="${logid==null }">
					<li class="nav-item"><a href="/tour/register/registerForm">회원가입</a></li>
					<li class="nav-item"><a href="/tour/register/loginForm">로그인</a></li>
					</c:if>
					<c:if test="${logid!=null }">
					<li class="nav-item"><a href="/tour/register/mypage">마이페이지</a></li>
					<li class="nav-item">${logname }님 <a href="/tour/register/logoutOk">로그아웃</a></li>
					</c:if>
					</ul>
				<!-- 주메뉴 -->
					<ul class="navbar-header"> 
						<li class="nav-brand"><a href="/tour/"><img src="/tour/image/Mainlogo.png"id="mainLogo"/></a></li>
						<li class="nav-item"><a href="/tour/product/product_list">여행상품</a></li>
						<!-- <li class="nav-item"><a href="#">여행만들기</a></li> -->
						<li class="nav-item"><a href="/tour/product/product_recommendList">추천상품</a></li>
						<li class="nav-item"><a href="/tour/board/list?commuPage=review">커뮤니티</a></li>
						<c:if test="${memType=='직원'}">
							<li class="nav-item"><a href="/tour/product/management">상품관리</a></li>
						</c:if>
						<li class="nav-item"><div><input type="text" id="searchWord2" name="searchWord" placeholder='검색어를 입력해보세요!' style="border:none; border-radius: 15px 0 0 15px; font-size:30%; text-align: left; padding-left:20px;"><input type="button" class="searchBtn" style="background-image:url('<%=request.getContextPath()%>/image/magno.png'); color:transparent; background-size: 20px 20px;background-position:center;  vertical-align: -4px; background-color:white; border:none; background-repeat:no-repeat; border-radius:0 15px 15px 0;vertical-align: -16px;"></div></li>
					</ul><!--  돋보기 높이 설정 : vertical-align: 2px;  -->
				</div>
				
			</div>
		</header> 
	<section>
		<!-- 이미지배너 --> 
		<div id="imgBanner">
			<img src="/tour/image/mainimg1.jpg" id="bannerImg"/>
			<div>				<!-- 이동만 보려고 임시로 클릭이벤트로 해놓음. -->
			<input type="text" id="searchWord1" name="searchWord" placeholder="가고 싶은 여행지를 검색해보세요!" style="border:none; position:relative; z-index:200;  border-radius: 15px 0 0 15px; font-size:150%; font-style:italic;"/><input type="button" class="searchBtn" style="background-image:url('<%=request.getContextPath()%>/image/magno.png'); position:relative; z-index:200; color:transparent; background-size: 40px 40px; background-position:center; background-color:white; border:none; background-repeat:no-repeat; border-radius:0 15px 15px 0; vertical-align: bottom;">
			</div>
		</div>
		<div class="overlay"></div>
		
		<div id = "imgslide"><!-- 이벤트 이미지 슬라이드 -->
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img class="d-block w-100" src="/tour/image/event_01.jpg" alt="First slide">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="/tour/image/event_01.jpg" alt="Second slide">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="/tour/image/event_01.jpg" alt="Third slide">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<div id='top-h1'>
		<h1 style="font-family: fantasy; font-size: 50px;"><span style='color:red;font-family: fantasy;'>HOT</span> Place</h1><br><h5>인기 여행지로 즐거운 여행을 즐겨보세요.</h5>
		</div>
	
		<div style="margin-bottom:50px;">
			<div class='row' id='rowdiv'>
				<div id='hot1' style='background-image:url(/tour/image/jeju.jpg); background-size:100%;  height:250px; background-repeat: no-repeat; '>
					<h1 style="color:white"><a href="#">경주(Gyeongju)</a></h1>
				</div>
				
				<div id='hot2' style='background-image:url(/tour/image/gyeongju.jpg); background-size:100%;  height:250px; background-repeat: no-repeat; '>
					<h1 style="color:white"><a href="#">제주(Jeju)</a></h1>
				</div>
				
				<div id='hot3' style='background-image:url(/tour/image/seoul.jpg); background-size:100%;  height:250px; background-repeat: no-repeat; '>
					<h1 style="color:white"><a href="#">서울(Seoul)</a></h1>
				</div>
			</div> 
		</div> 
			<hr class="hrStyle"/>
			
			
			 <div style="margin-top:50px">
				<h1 style="font-family: fantasy; font-size: 50px;"> <span style='color:red; font-family: fantasy;'>HOT</span> Recommend</h1><br>
			 	<h5> 추천여행지로 원하시는 여행을 즐겨보세요. </h5>
			 	<div id='cjimg' style='margin-top:50px;'>
			 		<c:forEach var="p_list" items="${list}">
				 		<div>
					 		<a href="product/product_view?goodCode=${p_list.goodCode}">
					 			<img src="/tour/image/main_img_banner_1.jpg"/>
					 		</a>
					 		${p_list.goodName}<br/>
					 		${p_list.price} 원
				 		</div>
			 		</c:forEach>
			 	</div>
			 </div>

	</section>
</body>
</html>