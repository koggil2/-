<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "구트투어";
	pageSideName = "여행바구니";
	pageImage = "main_img_banner_8.jpg";
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/css/uikit.min.css" />
<link rel="stylesheet" href="/tour/resources/css/cart.css" type="text/css"/>

<script src="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit-icons.min.js"></script>

<script>
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");
	
	var check = false;

	function changeVal(el) {
		var qt = parseFloat(el.parent().children(".qt").html());
		var price = parseFloat(el.parent().children(".price").html());
		var eq = Math.round(price * qt * 100) / 100;
			
		el.parent().children(".full-price").html( eq + "원" );
		changeTotal();            
	}

	function changeTotal() {
		var price = 0;
		$(".full-price").each(function(index){
			price += parseFloat($(".full-price").eq(index).html());
		});
		price = Math.round(price * 100) / 100;
		var fullPrice = Math.round((price) *100) / 100;
			if(price == 0) {
			fullPrice = 0;
			}  
		$(".subtotal span").html(price);
		$(".total span").html(fullPrice);
	}

	$(document).ready(function(){
		//삭제 클릭시 장바구니에서 삭제 및 화면에서 삭제
		$(".remove").click(function(){
			var params = "goodCode=${pvo.goodCode}&sc_num=${svo.sc_num}&userId=${b_list.get(0).getUserId()}"
			$.ajax({
				url : "/tour/product/basketOut",
				data : params,
				type : "GET",
				cache: false,
				success : function(result){ 
					if(result>0){
						alert("여행바구니 등록이 취소됐습니다.");
					}
				},
				erorr : function(e){
					alert(e.responseText);
				}
				
			});
			var el = $(this);
			el.parent().parent().addClass("removed");
			window.setTimeout(function(){
				el.parent().parent().slideUp('fast', function() {
					el.parent().parent().remove(); 
					if($(".product").length == 0) {
					if(check) {
					  $("#cart").html("<h1>The shop does not function, yet!</h1><p>If you liked my shopping cart, please take a second and heart this Pen on <a href='https://codepen.io/ziga-miklic/pen/xhpob'>CodePen</a>. Thank you!</p>");
					} else {
					  $("#cart").html("<h1>상품이 없습니다. 상품을 추가해주세요!</h1>");
					}
					}
					changeTotal(); 
				});
			}, 200);
		});
	  
		$(".qt-plus").click(function(){
			$(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);
			$(this).parent().children(".full-price").addClass("added");
			var el = $(this);
			window.setTimeout(function(){el.parent().children(".full-price").removeClass("added"); changeVal(el);}, 150);
		});
		
		$(".qt-minus").click(function(){
			child = $(this).parent().children(".qt");
			if(parseInt(child.html()) > 1) {
				child.html(parseInt(child.html()) - 1);
			}
			   
			$(this).parent().children(".full-price").addClass("minused");
			var el = $(this);
			window.setTimeout(function(){el.parent().children(".full-price").removeClass("minused"); changeVal(el);}, 150);
		});
		
		window.setTimeout(function(){$(".is-open").removeClass("is-open")}, 1200);
		});
	
</script>

<section style="text-align:left">
	<%@ include file="../inc/sidebar.jspf" %>
<div>
 <header id="site-header">
    <div class="container" style="font-size:35px;"> 	 
		<li class="uk-margin-small-right" uk-icon="icon:cart; ratio: 3" id="cartTitle"></li><h1 style="text-align:left;font-weight:bold;">여행 장바구니</h1>
    </div>
    <script>
    	function revBtn(goodCode, sc_num, price){
    		var id="#goodNum"+sc_num;
    		var goodNum = $(id).text();
    		location.href="reservation?userId=${logid}&goodCode="+goodCode+"&sc_num="+sc_num+"&price="+price+"&goodNum="+goodNum;
    	}
    </script>
</header>
    <div class="container">
        <section id="cart"> 
        <c:if test="${cnt==0}">
        	결과가 없습니다.
        </c:if>
        <c:forEach var="b" items="${b_list}">
	        <article class="product">
	               <header>
	                   <a class="remove"><img src="../image/jejuMain.jpg" alt=""><h3 style="text-align:center;">상품삭제</h3></a>
	               </header>
	               <div class="content" style="height:195px;">
	                   <a href="" style="color:black;"><h1>${b.goodCode},${b.sc_num}</h1>
					${pvo.goodName},${pvo.startArea},${pvo.destination}, ${pvo.travelTerm}</a>
	                   <div title="You have selected this product to be shipped in the color yellow." style="top:0;text-align: center;line-height:40px;" class="color yellow">출발</div>
	                   <div style="top: 43px" class="type small">${svo.startDate}</div>
	                   <div title="You have selected this product to be shipped in the color yellow." style="top:102px;text-align: center;line-height:35px;" class="color yellow" >도착</div>
	                   <div style="top: 136px" class="type small">${svo.backDate}</div>
	               </div>
	               <footer class="content" style="width:948px;">
	               	<span class="qt-people">인원 : </span>
	                   <span class="qt-minus">-</span>
	                   <span class="qt" id="goodNum${b.sc_num}">0</span>
	                   <span class="qt-plus">+</span>
	                   <input type="button" class="btn" onclick="revBtn('${b.goodCode}',${b.sc_num},${pvo.price})" style="font-weight:bold; float:right;height:44px;line-height:0.6;margin-left:10px" value="예약하기"/>
	                   <h2 class="full-price" style="border-radius:10px;line-height:2;">원</h2>
	                  	<h2 class="price">${pvo.price} 원</h2>
	                   <span style="float:right;height:50px;float:right;line-height:45px;">가격(1인당) : </span>
	               </footer>
	           </article>
            </c:forEach>            
        </section>       
    </div>
</div>
</section>