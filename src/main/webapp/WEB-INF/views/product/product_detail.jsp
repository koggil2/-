<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	pageName = "상품";
	pageSideName = "상품 상세페이지";
	pageImage = "mainimg4.jpg";
%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/tour/resources/css/product_detail.css" type="text/css"/>
<script src="https://kit.fontawesome.com/6a894ec103.js" crossorigin="anonymous"></script>



<c:set var="day" value="${2}"/>
<script>

$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
$("#imgBannerText>h1").text("<%=pageName%>");
$("#imgBannerText>h2").text("<%=pageSideName%>");

	/* 아이디 없을 때 하트 */
	function heart(){
		alert("로그인이 필요합니다.");
		$("#heart1").prop('checked', false);
	}

	$(function(){	
		/* 하트 */
		$("#heart1").change(function(){
			console.log($(this).prop("checked"))
			if($(this).prop("checked")){
				var state=1;
				var url = "heartIn"
				var params = $(this).val()+state;
				$.ajax({
					url: url,
					data : params,
					type : "GET",
					success : function(result){ 
						if(result>0){
							alert("관심 등록됐습니다.");
						}
					},
					erorr : function(e){
						alert(e.responseText);
					}
				})
			}else {
				state=0;
				var url = "heartOut"
				var params = $(this).val()+state;
				$.ajax({
					url: url,
					data : params,
					type : "GET",
					success : function(result){ 
						if(result>0){
							alert("관심 등록이 취소됐습니다.");
						}
					},
					erorr : function(e){
						alert(e.responseText);
					}
				});
			}
		});
		
		/* 여행바구니 */
		$("#cart").click(function(){
			if($(this).val()>0){
				if(confirm("이미 등록된 상품입니다. 등록취소하시겠습니까?")){
					var params = "goodCode=${vo.goodCode}&sc_num=${sc.sc_num}&userId=${logid}"
					$.ajax({
						url : "basketOut",
						data : params,
						type : "GET",
						cache: false,
						success : function(result){ 
							if(result>0){
								alert("여행바구니 등록이 취소됐습니다.");
								$("#cart").attr("vlaue","0");
							}
						},
						erorr : function(e){
							alert(e.responseText);
						}
						
					});
				}
			}else if($(this).val()==0){
				var state = 1;
				var params = "goodCode=${vo.goodCode}&sc_num=${sc.sc_num}&userId=${logid}&jang="+state;	
				$.ajax({
						url : "basketIn",
						data : params,
						type : "GET",
						cache: false,
						success : function(result){ 
							if(result>0){
								alert("여행바구니에 등록됐습니다.");
								$("#cart").attr("vlaue","1");
							}
						},
						erorr : function(e){
							alert(e.responseText);
						}
						
					});
			}
		});
		
		
		var clickYN = true;
			$("#gg").click(function(){
				if(clickYN){
					clickYN = false;
					$(".OkClose").css("display","none");
					$(".btnClose").css("visibility","hidden");
				}else{
					clickYN = true;
					$(".OkClose").css("display","block");
					$(".btnClose").css("visibility","visible");
				}
				
				for(i=1; i<=${day}; i++){
					$("#"+i+"DayPan tr td .tableBar").height($("#"+i+"DayPan").height()-65);
				}
			});
	});
</script>


<!-- 댓글등록..  -->

<!-- 댓글등록 끝..  -->

   




<div class="container">
	<div id="detail-content"> 	
			<div class="page_location">
				<a href="/tour/">홈></a><a href="#">${vo.travelType}</a>
			</div>
			<div class="sec_div">
				<div class="gall_big">
					<div class="w3-content w3-section" style="max-width:500px">
					  <img class="mySlides w3-animate-fading" src="/tour/image/mainimg1.jpg" style="width:100%">
					  <img class="mySlides w3-animate-fading" src="/tour/image/mainimg2.jpg" style="width:100%">
					  <img class="mySlides w3-animate-fading" src="/tour/image/mainimg3.jpg" style="width:100%">
					  <img class="mySlides w3-animate-fading" src="/tour/image/mainimg4.jpg" style="width:100%">
					</div>
				</div>
				<div class="title_text" style="text-align: left">
					<div class="circle_heart">
						<c:if test="${logid != null}">
							<input type="checkbox" id="heart1" <c:if test="${heart!=0}">checked</c:if> style="display:none;" value="userId=${logid}&goodCode=${vo.goodCode}&sc_num=${sc.sc_num}&heart="/>
							<label for="heart1"><i class="fas fa-heart"></i></label>
						</c:if>
						<c:if test="${logid == null}">
							<input type="checkbox" id="heart1" style="display:none;" onchange="heart()"/>
							<label for="heart1"><i class="fas fa-heart"></i></label>
						</c:if>
					</div>
					<div class="title_name"><h1 style="text-align: left; padding-right: 40px; font-size:30px; font-weight: 600;">${vo.goodName}(${vo.travelTerm})</h1></div>
					<div class='code' style="text-align: left"> ( 상품코드: ${vo.goodCode} )</div>
					<div class="product_list">
						<ul class="product_menu">
							<li><span>출발일자</span>${sc.startDate }</li>
							<li><span>상품가격</span>${vo.price }원</li>
							<li><span>여행지역</span>${vo.destination }</li>
							<li><span>여행기간</span>${sc.startDate }일 ~ ${sc.backDate }일</li>
						</ul>
					</div>
					<div class="btn_menu">
						<button class="btn-1" >예약하기</button>
						<button class="btn-2" id="cart" value="${jang}">장바구니</button>
					</div>
				</div>
			</div>
		</div>

	<div class="tb_alldiv">
		<table class="table_01">
		    <tr>
		        <th class="tb1" scope="row">일정</th>
		        <td><span>${vo.travelTerm } </span> <span><button class="btn-3">다른 출발일 보기</button></span>
		        <br>
		        <ul>
		        	<li>${sc.startDate}일 00:00출발  - ${sc.startDate}일 00:00 도착</li>
		        	<li>${sc.backDate}일 00:00출발 - ${sc.backDate}일 00:00 도착</li>
		        </ul>
		        </td>
		    </tr>
		    <tr>
		        <th class="tb2" scope="row">방문도시</th>
		        <td>${vo.destination }</td>
		    </tr>
		    <tr>
		        <th class="tb3" scope="row">예약인원</th>
		        <td>현재 0명 (최소 출발 인원: ${vo.reserMin }명 / 정원:${vo.reserNum })</td>
		    </tr>
		</table>
	</div>
	
	<div class="tb_alldiv2">
		<h3 style="text-align:left; font-weight: 600;">상품 체크 포인트</h3> 
			<table class="table_02">
		    	<tr>
		       	 	<th scope="row"><span class="img_icon1"></span>보험</th>
		        	<td class="row1">
		        	<ul>
		        		<li>[여행자보험] ${vo.assure1 }</li>
		        		<li>[영업보증보험] ${vo.assure2 }</li>
		        		<li>[기획여행 보증보험]${vo.assure3 }</li>
		        	</ul>
			    </td>
			    </tr>
			    <tr>
			        <th scope="row"><span class="img_icon"></span>인솔자</th>
			        <td class="row2">[인솔자] 0명이 넘으면 인솔자가 배정될 예정입니다.</td>
			    </tr>
			    <tr>
			        <th scope="row"><span class="img_icon2"></span>투어마일리지</th>
			        <td class="row3">
						<ul>
							<li>여행자 성인1인 기준 2,570 마일 적립 예정<br>
							(모두멤버스회원 한정, 출발 전 여행자 개별 가입 필수, 출발일 + 10일 후 적립)</li>
							<li>예상 적립 마일리지 금액은 프로모션 적용 및 결제방법에 따라 변동될 수 있음</li>
							<li>투어마일리지 제휴카드 : 1,000원당 최대 30마일 추가 적립 예정</li>
						</ul>
						
					</td>
		  		  </tr>
		</table>
	</div>
	
	<div class="rev_div"> 
	
		<h3 style="font-weight: 600;">※예약시 유의사항</h3>
		<P>
			- 해당 상품은 같은 일정의 상품들과 항공좌석을 공유하므로 타코드 선모객시 조기마감될 수 있습니다.<br>
			- 여권 상의 영문과 예약 시의 영문이 다를 경우 항공 좌석이 취소될 수 있으며 이에 따른 취소료 또는 추가 차액이 발생할 수 있으니 반드시 예약처에 재확인 하시기 바랍니다.<br>
			- 기내서비스는 최소 출발 3일전 신청해주세요.<br>
			- 상품가격은 성인 2인 1실 사용 시 1인 기준입니다.<br>
			- 아동 No Bed 요금은 성인2인과 같은 방을 사용하며, 엑스트라베드가 제공되지 않는 요금입니다.<br>
			<br>
			
			▶ 중국의 식수는 별로 좋지 못하므로 가급적 차나 생수, 음료수 등으로 대체하도록 합니다.<br>
			▶ 중국의 국제전화는 한국에 비해 70% 이상 비싸므로, 수신자 부담서비스를 이용하시는게 좋습니다.<br>
			▶ 중국민항 패키지의 경우 특성상 항공티켓 발권은 통상 출발 3일전입니다. 발권 후 취소하시면 항공료 부분의 환불이 불가하오니 이점 유의하시기 바랍니다.<br>
			<br>
			※ 중국단체비자 유의사항<br>
			☞ 단체비자 특성상 비자에 기재되어 있는 성명 순서대로 중국 입/출국 수속 및 티케팅을 하셔야 하므로,수속시간이 다소 지연될수 있사오니 양해바랍니다.<br>
			그러므로,단체비자를 발급받으신 고객님께서는 인천공항 미팅시간을 꼭 지켜주시기 바랍니다.<br>
			☞ 골프상품은 인솔자가 동반하지 않으므로 공항 입출국시에 고객님께서 단체비자를 보관하셔야 합니다.<br>
			☞ 현지에서 여권,단체비자 분실 시에 중국 입국/출국의 문제가 발생 하며, 분실시 발생되는 모든 비용은 개인비용으로 부담되오니 분실하지 않도록 각별한 주의를 부탁드립니다.
		</P>
	</div>
	
	<!-- 탭누르면 탭메뉴 시작  -->
	
	<div class="mt-3">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs nav-tabs1">
		    <li class="nav-item">
		      <a class="nav-link active" href="#home">일정표</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#menu1">여행약관</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#menu2">참고사항</a>
		    </li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div id="home" class="tab-pane active"><br>
		      <div id="revDetailTable" style="position:relative">
		      ${vo.goodData }
<%-- 			<c:forEach var="dayFor" begin="1" end="${day}">
					<table id="${dayFor}DayPan" class="dayTable">
						<tr>
							<td colspan="1" class="dayVal">&nbsp;&nbsp;${dayFor}일차</td>
							<td><div>2019년 11월 26일 화요일</div></td>
						</tr>
						<tr><td colspan="2" style="padding:0px; border:0px; height:0px;"><div class="tableBar"></div></td></tr>
						<tr>
							<td colspan="2">
								<div class="OkClose">
									<div class="circleIco"></div><!-- 동그라미 아이콘 -->
									<div class="tableLeftMargin" style="float:left">
										<input type="text" placeholder="일정제목" style="width:600px; margin-bottom:20px"/><br/>
										<textarea cols="100" rows="5" placeholder="일정내용" style="resize:none"></textarea><button class="btStylePlus btnClose" onclick="revDetailInsert()">+</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</c:forEach> --%>
				</div>
				<button id="gg">클릭~</button>
		    </div>
		    <div id="menu1" class="tab-pane fade"><br>
		      <h3>여행약관</h3>
		   	 	<div class="menu1_div">
				<p>● 계약금규정<br></p>
				· 계약금은 국외여행 표준약관에 의거 하여 예약일 기준 3일 이내에 상품가격의 10%를 결제하셔야 합니다.<br>
				· 계약금 입금이 지연될 경우 예약이 취소될수 있습니다.<br>
				· 계약금은 항공, 호텔, 현지 사정에 따라 금액이 변동 될수 있으며, 상황에 따라 결제시한이 당겨질수도 있습니다.<br>
				· 계약금 결제 이후 취소료 규정 적용 기간에 취소 시 취소 수수료가 계약금 금액 보다 클 시 추가 취소 수수료를 부담하셔야합니다.<br>
				· 취소료 규정 적용 기간에 예약 시 계약금은 취소료 규정 배상 금액 만큼으로 변경 됩니다.<br>
				ex) 여행 개시 8일전 예약 시 : 취소료 부과 금액인 총 상품가격의 20% 를 계약금으로 결제<br>
				<br>
				<p>● 여행 취소료 규정<br></p>
				▶ 인터넷상에서 예약/결제 취소 및 변경은 불가능 하오니, 예약/결제 취소나 여행자정보 변경을 원하시면 반드시 예약담당자에게 연락하여 주시기 바랍니다.<br>
				<br>
				<p>※ 이 상품은 교통수단(기차, 버스, 선박 등) 또는 숙박에 대한 비용을 전액 선납해 놓은 상품으로서, 여행자의 취소 및 변경 요청 시 공정거래위원회 고시 소비자분쟁해결 기준과 별도로 '국내여행 특별약관' 규정에 의거하여 취소료가 적용됩니다.<br></p>
				- 여행개시 4일 전까지 취소 통보 시 100% 환불<br>
				- 여행개시 3일 전까지 취소 통보 시 80% 환불<br>
				- 여행개시 2일 전까지 취소 통보 시 50% 환불<br>
				- 여행개시 1일 전까지 취소 통보 시 20% 환불<br>
				- 여행 당일 취소 및 불참 시 100% 취소료 부과 환불 없음<br>
				<br>
				※ 근무시간 이외에는 여행의 취소, 변경 처리가 불가합니다.<br>
				- 근무시간 : 주중 09:00~18:00 (토, 일요일 및 법정공휴일 휴무)<br>
				- 토요일, 일요일 및 공휴일 취소, 변경 신청이 접수되지 않으며 취소일수에서 제외됩니다.<br>
				- 근무시간 이외 인솔자 개인 휴대폰 상이나, 휴무일 당직자를 통해서는 절대 취소(변경) 처리가 되지 않습니다.<br>
				- 부득이한 사정으로 여행 중도 포기 시 비용 환불은 없습니다.<br>
				<br>
				<p>※ 단체 취소수수료 특별규정<br></p>
				10인 이상의 단체예약 or 단독행사의 경우 신청금을 납입하셔야 예약이 완료되며, 아래의 특별규정이 적용됩니다.<br>
				- 예약 완료(신청금 진행)~여행개시 7일전까지 예약인원의 50% 이상 변경 및 취소 통보 시 → 계약금 환불 불가<br>
				- 여행개시 6일~3일전까지 변경 및 취소 통보 시 → 상품가의 20% 수수료 부과<br>
				- 여행개시 2일전까지 변경 및 취소 통보 시 → 상품가의 50% 수수료 부과<br>
				- 여행개시 1일전까지 변경 및 취소 통보 시 → 상품가의 80% 수수료 부과<br>
				- 여행 당일 취소 통보, 불참 시 → 상품가의 100% 수수료 부과 환불 없음<br>
				<br>
				<p>● 최저출발인원 미 충족 시 계약해제<br></p>
				· 당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게 통지하여야 합니다.<br>
				· 당사는 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급 받은 계약금 환급 외에 다음 각 목의 금액을 여행자에게 배상하여야 합니다.<br>
				- 여행개시 7일전까지 여행계약 해제 통지시 : 계약금 환급<br>
				- 여행출발 1일전까지 통지시 : 여행요금의 30%<br>
				- 여행출발 당일 통지시 : 여행요금의 50%<br>
				</div>
		    </div>
		    <div id="menu2" class="tab-pane fade"><br>
		      <h3>예약 시 주의사항</h3>
		      <div class="menu2_div">
				<b>● 상품 이용 관련</b><br>
				- 반드시 신청전/출발전에 상품 일정표 및 목적지의 여행 정보를 확인하시기 바랍니다.<br>
				- 본 상품은 단체여행을 목적으로 하는 패키지 상품으로 여행자는 여행업자의 여행질서 유지에 적극 협조하여 주셔야 하며 정해진 일정에서 벗어나는 개별일정의 진행은 불가합니다.<br>
				<br>
				<b>● 건강 정보</b><br>
				- 여행 전, 해외여행 질병정보센터 홈페이지 www.cdc.go.kr 에서 여행 목적지에서 유행 중이거나 주의해야 할 질병정보를 확인하시기 바랍니다.<br>
				<br>
				<b>● 해외 안전 여행 정보</b><br>
				- 외교통상부 해외안전여행 홈페이지 www.0404.go.kr 에서 국가나 지역별 위험수준, 안전대책, 행동지침에 대한 정보를 제공합니다.<br>
				<br>
				<b>● 법정대리인(부모) 동행 없는 미성년자의 여행계약 주의사항</b><br>
				- 20세 미만의 보호자를 동반하지 않은 여행객은 친권자의 동의서가 필요합니다.<br>
				- 만 19세 미만의 미성년자끼리의 여행계약 또는 법정대리인(부모)이 아닌 성인과 동행하는 미성년자의 여행계약은 민법 제5조에 의거하여 법정대리인인 부모 또는 친권자와 체결함을 원칙으로 해야 하고, 당사는 법정대리인의 동의 없는 여행계약의 체결을 거부할 수 있습니다.<br>
				<br>
				<b>● 유류 할증료</b><br>
				☞ 국제유가와 항공사 영업환경을 고려한 국토교봉투의 국제선 항공요금과 유류할증료<br>
				확대방안에따라 추가인상된 유류할증료 금액을 상품가에 반영할수 있습니다.<br>
				☞ 달러/엔/유로화등의 환율이 급격하게 변동될 경우는 국외여행표준약관<br>
				제12조 1항에 의거하여 추가금액이 발생하거나 상품가 인상이 있을 수 있습니다.<br>
				<br>
				<b>국외여행 표준약관 제12조(여행요금의 변경) 에 의거</b><br>
				① 국외여행을 실시함에 있어서 이용운송, 숙박기관에 지급하여야 할 요금이 계약체결시보다 5%이상 증감하거나 여행요금에 적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 당사 또는 여행자는 그 증감된 금액 범위 내에서 여행요금의 증감을 상대방에게 청구할 수 있습니다.<br>
				② 당사는 제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행출발일 15일전에 여행자에게 통지하여야 합니다.<br>
		      </div>
		      
		      <h3>결제안내</h3>
		      <div class="menu2_div2">
				<b>● 결제방법</b><br>
				신용카드, 상품권, 상품권+신용카드, 무통장입금(가상계좌), 구트투어 결제계좌' 총 5가지 결제수단으로 결제하실 수 있습니다.<br>
				<br>
				① 신용카드 : 신용카드로 여행상품을 결제하고 차후에 신용카드사를 통해 카드대금이 청구되며, 국민, 비씨, 우리 카드 결제는 선택한 카드사별 ISP결제로 진행이 되며, 그외 카드사는 선택한 카드사별 안심클릭 결제로 진행이 됩니다. 30만원이상 결제 시 공인인증서 사용을 의무화 합니다.<br>
				② 상품권 : ㈜구트투어네트워크에서 발행한 구트투어 여행상품권으로 온라인, 오프라인에서 구트투어 및 전국 구트투어 대리점에서 사용 하실수 있습니다.<br>
				③ 신용카드+상품권 : 신용카드와 구트투어 여행상품권으로 복합결제를 하실수 있습니다.<br>
				④ 무통장입금(가상계좌) : 무통장 입금 신청 시 예약상품 기준으로 예약자에게 발급되는 가상계좌이며, 총 여행경비가 완불될 때까지 발급받은 계좌로 일정기간내에 여러차레 입금이 가능합니다.<br>
				⑤ 구트투어 결제계좌 : 구트투어네트워크 전용계좌로, 별도의 결제창 없이 바로 구트투어 결제계좌로 입금이 가능합니다.<br>
				<br>
				<table class="table table-bordered" style="margin-bottom: 0;">
					<thead>
						<tr>
							<th>은행명</th>
							<th>계좌번호</th>
							<th>은행명</th>
							<th>계좌번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>신한은행</td>
							<td>312-01-195126</td>
							<td>신한은행</td>
							<td>262-05-015956</td>
						</tr>
						<tr>
							<td>국민은행</td>
							<td>832-01-0268-385</td>
							<td>외환은행</td>
							<td>010-22-01322-6</td>
						</tr>
						<tr>
							<td>기업은행</td>
							<td>087-023700-04-012	</td>
							<td>우리은행</td>
							<td>102-04-110851
							</td>
						</tr>
						<tr>
							<td>농협</td>
							<td>056-01-104843</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<p style="text-align: right">예금주 : (주)구트투어네트워크</p><br>
				<br>
				
				<b>● 결제 시 유의사항</b><br>
				- 반드시 예약담당자에게 상담후 결제를 진행하여 주시기 바랍니다.<br>
				- 인터넷상에서 결제취소 및 변경이 불가능하오니, 결제취소나 변경을 원하시면 반드시 예약담당자에게 연락하여 주시기 바랍니다.<br>
				- 여행대금의 모든 결제 수단은 구트투어 법인 계좌 및 구트투어 결제시스템을 이용하셔야 하며, 그 외의 결제방법을 이용하실 경우 법적 보호를 받으실 수 없습니다.<br>
				- 타사 상품권 결제 후 환불 요청시 환불 절차상 다소 시간이 걸릴 수 있사오니, 이점 양해해 주시기 바랍니다.<br>
		      </div>
		  </div>
	</div>
	
	<!-- 탭누르면 나오는 div menu1, menu2, menu3 끝 -->
<!-- 	
		상품문의 
 	   <div style="width:100%; text-align: center; ">
	        <br>
	        
	        **로그인 한 회원에게만 댓글 작성폼이 보이게 처리
	        <textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
	        <br>
	        <div style="text-align: right;">
	        <button type="button" id="btnReply">상품 문의</button>
	        </div>   
    	</div> 
  -->
    <!-- **댓글 목록 출력할 위치 --> 
      <div class="container comment_div">
        <label for="content" style="text-align: left;font-size: 23px; font-weight: 600;">상품문의</label>
        <form name="commentInsertForm" method="post">
            <div class="input-group">
             	<input type="hidden" name="sc_num"	value="${sc.sc_num}"/>
               <input type="hidden" name="goodCode" value="${vo.goodCode}"/>
               <input type="hidden" name="userId" value="${logid}"/>
               <c:if test="${logid == null}">
                <input type="text" class="form-control" id="content" name="content" placeholder="로그인 후 입력이 가능합니다..">
               </c:if>
               <c:if test="${logid !=null }">
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               </c:if>
               <span class="input-group-btn">
               
               <c:if test="${logid != null}">
					<button id="comment_btn" class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
			   </c:if>
               </span>
              </div>
        </form>
    </div>
    <!-- 댓글 나오는 div시작..  -->
    <div class="container">
        <div class="commentList"></div>
    </div>
    
    <%@ include file="comment.jspf" %>
    <!-- 댓글 끝나는 div끝..  -->
	<!-- 상품문의 끝  -->
	</div>
</div>
	<script>
	$(document).ready(function(){
	  $(".nav-tabs a").click(function(){
	    $(this).tab('show');
	  });
	});
	</script>

	<script>
		var myIndex = 0;
		carousel();
		
		function carousel() {
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";  
		  }
		  myIndex++;
		  if (myIndex > x.length) {myIndex = 1}    
		  x[myIndex-1].style.display = "block";  
		  setTimeout(carousel, 9000);    
		}
	</script>
