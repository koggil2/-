<%-- <%@page import="org.json.simple.JSONArray"%> --%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style>
*{font-family:'Noto Sans KR',sans-serif;}
</style>
<style>
#a1{width : 100px;}
#main{margin : 0px auto; width : 1100px ;height : 600px;}
#a1{margin : 0px auto; width : 100%; height:50px; line-height:50px; font-size:20px;}
#main2>div{float : left; height : 600px;}
#imgslide, #select{border:1px solid #ddd; margin:20px 0; padding:20px}
#imgslide{border-radius:5px 0px 0px 5px;width:400px; }
#select{margin:20px;border-radius:0px 5px 5px 0px;width:650px; }

#prospec{height : 500px; margin : 0px auto; width : 1200px;}
#tabmenu>div{border:1px solid #ddd; width : 33.33%; float : left;}
#list1,#list2,#list3{height : 500px;}
#tabmenu>div:nth-child(1){background : #00a7f0; color:white}
#list2,#list3{display : none;}
hr{margin:10px 5px;}

#reply{width:1100px;}
#list3{padding-top:30px;text-align:left;}
#img1{margin-top: 30px;}
#img1>img{width:350px; height:200px;}
#imgslide ul, #imgslide li{clear:left;}

.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal_top input{border:none;background:#fff;}
.cal{
    text-align: center; 
}
.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
.calendar td{
    vertical-align: top;
    border:1px solid #ddd;
    width: 100px;
}

#eve {width:1100px; height:100px;margin:150px 0px 50px 0px;}
#product_list{width:1100px;}
#tblist{font-family:"맑은 고딕";font-size:13px;}
input[id^=cart]+label{width: 20px;height: 20px; background: url(../image/cart_off.png);}
input[id^=cart]:checked+label{background: url(../image/cart_on.png);}
</style>
<script>

	function setCal(){
 		var List="";
		for(i=1; i<=12; i++){
			List += "<div>"+i+"월</div>";
		}
		document.getElementById("allMonth").innerHTML = List;
		
		/*List="";
		for(i=1; i<=12; i++){
			List += "<div id='"+ i +"' style='clear:left;width:750px;height:430px;border:1px solid blue;'>"+i+"월</div>";
		}
		$("#month").append($(List));*/
	}
	
	function imageMove(){
		$("#allMonth div").first().appendTo("#allMonth");
		//$("#allMonth div:first").animate({marginLeft:"100px"}, 1000, 'easeOutBounce');
	}
	function imageMove2(){
		$("#allMonth div").last().prependTo("#allMonth");
	}
	
	$(function(){
		/* 아이디 없을 때 장바구니 */
		function cart(){
			alert("로그인이 필요합니다.");
			$("tbody input[type='checkbox']").prop('checked', false);
		}
			
		/* 장바구니 */
		$("tbody input[type='checkbox']").change(function(){
			console.log($(this).prop("checked"))
			if($(this).prop("checked")){
				var state=1;
				var url = "basketIn"
				var params = $(this).val()+state;
				$.ajax({
					url: url,
					data : params,
					type : "GET",
					url : url,
					data : params,
					success : function(result){ 
						if(result>0){
							alert("여행바구니에 등록됐습니다.");
						}
					},
					erorr : function(e){
						alert(e.responseText);
					}
				})
			}else {
				state=0;
				var url = "basketOut"
				var params = $(this).val()+state;
				$.ajax({
					url: url,
					data : params,
					type : "GET",
					url : url,
					data : params,
					success : function(result){ 
						if(result>0){
							alert("여행바구니에 등록이 취소됐습니다.");
						}
					},
					erorr : function(e){
						alert(e.responseText);
					}
				})
			}
			
		});
		var x = parseInt($("#count>div:nth-child(2)").html());
		
		$("#count>div").on("click",function(){
			if($("#count>div:nth-child(2)").html() >= 0 && $("#count>div:nth-child(2)").html() <=99 && $(this).index() == 2){
				var cnt = x+=1
				$("#count>div:nth-child(2)").text(cnt);
				$("#price>span").text(parseInt($("#price>span").html())+92000)
			}else if($("#count>div:nth-child(2)").html() <= 100 &&$("#count>div:nth-child(2)").html() > 0 && $(this).index() == 0){
				var cnt = x-=1
				$("#count>div:nth-child(2)").text(cnt);
				$("#price>span").text(parseInt($("#price>span").html())-92000)
				
			}
		});
		
		$("#tabmenu>div").on("click",function(){
			if($(this).index() == 0){
				$(this).css("background","#00a7f0").css("color","#fff");
				$("#tabmenu>div").not($(this)).css("background","white").css("color","#000");
				$("#list1").css("display","block")
				$("#list2").css("display","none")
				$("#list3").css("display","none")
			}
			if($(this).index() == 1){
				$(this).css("background","#00a7f0").css("color","#fff");
				$("#tabmenu>div").not($(this)).css("background","white").css("color","#000");
				$("#list1").css("display","none")
				$("#list2").css("display","block")
				$("#list3").css("display","none")
			}
			if($(this).index() == 2){
				$(this).css("background","#00a7f0").css("color","#fff");
				$("#tabmenu>div").not($(this)).css("background","white").css("color","#000");
				$("#list1").css("display","none")
				$("#list2").css("display","none")
				$("#list3").css("display","block")
			}
		});
		
		$("#up").click(function(){imageMove2();});
		$("#down").click(function(){imageMove();});
		
	});	
	
	/* 달력  */	    
   var today = null;
   var year = null;
   var month = null;
   var firstDay = null;
   var lastDay = null;
   var $tdDay = null;
   var $tdSche = null;
   var jsonData = null;
   $(document).ready(function() {
       drawCalendar();
       initDate();
       drawDays();
       drawSche();
       $("#movePrevMonth").on("click", function(){movePrevMonth();});
       $("#moveNextMonth").on("click", function(){moveNextMonth();});
   });
   
   //Calendar 그리기
   function drawCalendar(){
       var setTableHTML = "";
       setTableHTML+='<table class="calendar">';
       setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
       for(var i=0;i<6;i++){
           setTableHTML+='<tr height="80">';
           for(var j=0;j<7;j++){
               setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
               setTableHTML+='    <div class="cal-day"></div>';
               setTableHTML+='    <div class="cal-schedule"></div>';
               setTableHTML+='</td>';
           }
           setTableHTML+='</tr>';
       }
       setTableHTML+='</table>';
       $("#cal_tab").html(setTableHTML);
   }
   
   //날짜 초기화
   function initDate(){
       $tdDay = $("td div.cal-day")
       $tdSche = $("td div.cal-schedule")
       dayCount = 0;
       today = new Date();
       year = today.getFullYear();
       month = today.getMonth()+1;
       if(month < 10){month = "0"+month;}
       firstDay = new Date(year,month-1,1);
       lastDay = new Date(year,month,0);
   }
   
   //calendar 날짜표시
   function drawDays(){
       $("#cal_top_year").text(year);
       $("#cal_top_month").text(month);
       for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
           $tdDay.eq(i).text(++dayCount);
       }
       for(var i=0;i<42;i+=7){
           $tdDay.eq(i).css("color","red");
       }
       for(var i=6;i<42;i+=7){
           $tdDay.eq(i).css("color","blue");
       }
   }
   
   //calendar 월 이동
   function movePrevMonth(){
       month--;
       if(month<=0){
           month=12;
           year--;
       }
       if(month<10){
           month=String("0"+month);
       }
       getNewInfo();
       }
   
   function moveNextMonth(){
       month++;
       if(month>12){
           month=1;
           year++;
       }
       if(month<10){
           month=String("0"+month);
       }
       getNewInfo();
   }
   
   //정보갱신
   function getNewInfo(){
       for(var i=0;i<42;i++){
           $tdDay.eq(i).text("");
           $tdSche.eq(i).text("");
       }
       dayCount=0;
       firstDay = new Date(year,month-1,1);
       lastDay = new Date(year,month,0);
       drawDays();
       drawSche();
   }
   
   //2019-08-27 추가본
   
   //데이터 등록
   function setData(){
       jsonData = 
       {
           "2019":{
               "07":{
                   "17":"제헌절"
               }
               ,"08":{
                   "7":"칠석"
                   ,"15":"광복절"
                   ,"23":"처서"
               }
               ,"09":{
                   "13":"추석"
                   ,"23":"추분"
               }
               ,"11":{
               	"21" : "450,000~"
               }
           }
       }
   }
   
   //스케줄 그리기
   function drawSche(){
       setData();
       var dateMatch = null;
       for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
           var txt = "";
           txt =jsonData[year];
           if(txt){
               txt = jsonData[year][month];
               if(txt){
                   txt =  jsonData[year][month][i];
                   if(txt) {
                   	txt = "<a href='#product_list'>" + jsonData[year][month][i] + "</a>";
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).html(txt);
                   }
               }
           }
       }
   }
   
</script>

<section>
	<%@ include file="../inc/sidebar.jspf"%>
	<div id = "main"> <!-- 윗칸 을 담고 있는 div -->
		<div id = "a1"><!-- 상품제목 -->${vo.goodName}</div>
		<hr/>
		<div id = "main2">
			<div id = "imgslide"><!-- 상품 img 슬라이드 div -->
				<div id="img1"><img src="../image/main_img_banner_1.jpg"/></div>
				<ul style="margin-top:20px;">
					<li><span style="font-weight:bold;margin-right:10px;color:red;width:150px;display:inline-block;text-align:right;">상품코드</span><span>${vo.goodCode}</span></li>
					<li><span style="font-weight:bold;margin-right:10px;color:red;width:150px;display:inline-block;text-align:right;">출발지</span><span>${vo.startArea}</span></li>
					<li><span style="font-weight:bold;margin-right:10px;color:red;width:150px;display:inline-block;text-align:right;">여행지</span><span>${vo.destination}</span></li>
					<li><span style="font-weight:bold;margin-right:10px;color:red;width:150px;display:inline-block;text-align:right;">기간</span><span>${vo.travelTerm}</span></li>
					<li><span style="font-weight:bold;margin-right:10px;color:red;width:150px;display:inline-block;text-align:right;">가격</span><span>${vo.price}</span></li>			
				</ul>
			</div>
			<!-- 달력 -->
			<div id = "select">
				<!-- <div id="month">
					<input type="button" id="up" name="up" value="◁"/>
					<div id="cal"><div id="allMonth"></div></div>
					<input type="button" id="down" name="down" value="▷"/>
				</div> -->
				<div style='clear:left;height:600px;'>
					<div class="cal_top">
				        <input type="button" value="&lt;" id="movePrevMonth"/>
				        <span id="cal_top_year"></span>
				        <span id="cal_top_month"></span>
				        <input type="button" value="&gt;" id="moveNextMonth"/>
				    </div>
				    <div id="cal_tab" class="cal">
				    </div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="eve">
		<a href="http://www.modetour.com/Package/Incentive.aspx" target="_blank"><img src="../image/eve.PNG" style="width:100%; height:100px;"/></a>
	</div>
	
	<div id="product_list">
		<div id="tableList">
			<table id="tblist" class="table table-bordered">
				<colgroup>
					<col style="width:150px;">
					<col style="width:100px;">
					<col style="width:450px;">
					<col style="width:100px;">
					<col style="width:100px;">
					<col style="width:100px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="col1">출/도착정보</th>
						<th scope="col" class="col2">여행기간</th>
						<th scope="col" class="col3">상품명</th>
						<th scope="col" class="col4">상품가격</th>
						<th scope="col" class="col5">예약상태</th>
						<th scope="col" class="col6">장바구니</th>
					</tr>
				</thead>
				<!-- 일정목록 -->
				<tbody>
				<c:forEach var="i" begin="1" end="${fn:length(list)}" step="1">
						<tr>
							<td><span style="color:blue;">${list[i-1].startDate}</span><br>${list[i-1].backDate}</td>
							<td>${vo.travelTerm}</td>
							<td><a href="product_detail?goodCode=${vo.goodCode}&sc_num=${list[i-1].sc_num}" data-idx="0" data-pnum="58740423" target="_blank">${vo.goodName}</a></td>
							<td>${vo.price}</td>
							<td>예약대기</td>
							<c:if test="${logid != null}">
								<td><input type="checkbox" <c:if test="${list2[i-1]!=0 }">checked</c:if> id="cart${list[i-1].sc_num}" value="userId=${logid}&goodCode=${vo.goodCode}&sc_num=${list[i-1].sc_num}&jang=" style="display:none;" />
									<label for="cart${list[i-1].sc_num}"></label>
								</td>
							</c:if>
							<c:if test="${logid == null}">
								<td><input type="checkbox" id="cart${list[i-1].sc_num}" style="display:none;" onchange="cart()"/>
									<label for="cart${list[i-1].sc_num}"></label>
								</td>
							</c:if>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>					
		<div style="font-size:12px;letter-spacing:-0.05em;height:83px;line-height:1.8;background:lightgray;padding:10px;">
			<p style="text-align:left;margin:0px;"><span style="color:red;">출발가능</span> : 최소 출발인원 이상 예약이 되어 있는 상품으로서 예약과 동시에 출발이 가능합니다. 단, 예약자의 일부가 취소되어 최소 출발인원에 미치지 못할경우 행사가 진행되지 못할 수 있습니다.</p> 
			<p style="text-align:left;margin:0px;"><span style="color:green;">예약가능</span> : 여유좌석 내에서 예약이 가능하지만, 단체의 예약인원이 최소출발인원에 미달하여 출발여부는 미정인 상태입니다. 최소 출발인원 이상 예약 될 경우 출발가능으로 변경됩니다. </p>
			<p style="text-align:left;margin:0px;"><span style="color:blue;">대기예약</span> : 여유좌석이 없거나 출발이 임박하여 예약가능 시간이 지나 담당자와의 확인이 필요한 상황입니다.</p>	
		</div>
	</div>
</section>