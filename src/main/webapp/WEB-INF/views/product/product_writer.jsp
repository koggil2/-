<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/tour/resources/css/jquery-ui.min.css" type="text/css"/>
<script src="/tour/resources/js/jquery-ui.min.js"></script>
<title>상품 상세 페이지</title>
<style>
 	.container{margin-top: 80px; max-width: initial; padding:0; }
	.page_location {text-align: right; margin:10px 0;}
	.gall_big{width:500px; float:left;}
	.title_text{float: left; width: 580px; position: relative; height: 350px; padding-top:6px; padding-left:40px;}
	.sec_div{width:100%; height: 352px; border: 1px solid lightgray;}
	.product_menu>li{width:860px; height: 37px; font-size: 17px; text-align: left; }
	.code{font-size: 12px; width:280px; height: 26px; margin:10px 0; padding-left:30px;}
	.spanMr {margin-right: 60px;}
	.title_name{height:40px;}
	.title_name input{width:550px; line-height:30px;}
	.product_list{width:760px; height:150px;}
	
	.table_01 {width:1100px;}
	
	.tb_alldiv {width: 1000px; margin:40px 0;}
	.table_01 {border-top: 2px solid black; border-bottom: 2px solid black;}
	.table_01 tr {width:1000px; border-bottom: 1px solid lightgray;}
	.table_01 tr th{width:200px; background: #efefef; font-size:20px;}
	.table_01 tr td{width:700px; padding:10px 0 10px 20px; float: left; text-align: left; font-size: 18px;}
	.table_01 tr:last-child td{line-height:50px; }
	.table_01 tr td span {float: left; font-size: 18px;}
	
	.table_01 ul{margin:20px; font-size: 18px;}
	.table_01 ul li{list-style-type: circle;}
	
	#home{background-color: aliceblue}
	
	.row1 ul li{float:none;}
	.row1 ul li input{margin-left:20px}
	
	.dateListLi{float:none; line-height:30px;}
	#datePan>li{float:none; list-style-type:none;}
	.rev_div p, .rev_div h3{text-align: left;}
	.rev_div{background: #efefef; padding: 40px 40px;}
	.rev_div h3{font-weight: 500;}
	.rev_div p{color: gray;}
	
	.nav {width:100%;}
	.nav li{width:33.33%; height: 40px;}
	
	.rev_div{margin:40px 0;}
	.review_div {margin: 40px 0;}
	.review_div>h3{text-align: left;}

	@keyframes ddd {
	    0% { transform: scale(1) rotate(0) }
	    90% { transform: scale(3) rotate(1080deg)}
	    100% { transform: scale(1) rotate(1080deg) }
	}
		
	<!-- -->
	ul,li{margin:0px;}
	#revDetailTable{width:100%}
	#revDetailTable *{text-align:left; margin-top:0px;}
	#revDetailTable table{background-color:#fff; margin-bottom:40px;}
	
	.circleIco{width:20px; height:20px; border-radius:20px; background-color:#aaa; border:5px solid #ddd; position:relative; left:-6px; top:25px; z-index:2}
	.tableLeftMargin{margin-left:30px; margin-bottom:10px;}
	.tableBar{position:absolute; width:2px; height:247px; background-color:#ddd; z-index:1; left:24px;}
	.m-tTen{margin-top:20px;}
	#revDetailTable .dayVal{background:#aaa; width:200px; color:white; font-size:1.1em; font-weight:bold; z-index:2; text-align:center;}
	
	#revDetailTable table tr:first-child td{border-bottom:0px; font-size:20px;}
	#revDetailTable table tr:first-child td:last-child{font-size:18px;}
	#revDetailTable table tr{line-height:30px}
	.dayTable td{width:100px; padding:20px; border:1px solid #ccc;}
	.dayTable td:last-child{width:1200px; padding:0px 20px;}
	#revDetailTable button:focus { outline:none;}
	.btStyle {margin-left: 20px; width:15px; height:15px; font-size:15px; border: 0; background:none;}
	.btStylePlus {margin-left: 20px; width:25px; height:25px; font-size:25px; border: 0; background:none;}
	
	.spanWiMr{width:200px; text-align:left;}
	.w3-content {max-width:490px; max-height:340px; margin:7px;}
	.w3-content div {width:240px; height:165px; float:left; margin-right:6px; margin-bottom:6px; border:1px solid #ddd;}
	.w3-content div:nth-child(2n) {margin-right:0px;}
	.w3-content div:nth-child(3),.w3-content div:nth-child(4){margin-bottom:0px;}

</style>
<script>
	$(function(){
		//
		$.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                       
                ,nextText: '다음 달' // next 아이콘의 툴팁.
                ,prevText: '이전 달' // prev 아이콘의 툴팁.
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "0M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
		//날짜선택
		$("#startDate").datepicker();
		
		//도착일 자동선택
		$("#startDate").change(function(){
			var day = $("#periodSel option").index($("#periodSel option:selected"));
			if(day>0){
				
				var dayPlus = (day-1)*86400000;
				var today = new Date();
				var backDate = Date.parse($("#startDate").val())+dayPlus;
				
				today.setTime(backDate);
				
				var backYear = today.getFullYear();
				var backMonth = today.getMonth()+1;
				var backDate = today.getDate();
				
				var setDate = backYear+"-"+backMonth+"-"+backDate;
	
				$("#backDate").val(setDate);
			
			}else{
				alert("여행기간을 선택해주세요.");
				$("#startDate").val("");
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
			var day = $("#periodSel option").index($("#periodSel option:selected"));
			
			for(i=1; i<=day; i++){
				$("#"+i+"DayPan tr td .tableBar").height($("#"+i+"DayPan").height()-70);
			}
		});
	});
	function insertDate(){
		if($("#startDate").val()!=""&&$("#backDate").val()!=""){
			var dateTxt = "<li class='dateListLi'>"+$("#startDate").val()+" ~ "+$("#backDate").val()+"</li>"
			$("#dateList").append(dateTxt);
			$("#startDate").val("");
			$("#backDate").val("");
		}
	}
	function revDetailInsert()	{
		//이벤트가 발생한 버튼
		var targetButton = $(event.target);
		//이벤트가 발생한 작성 Div
		var targetDiv = targetButton.parent().parent();
		//이벤트가 발생한 테이블
		var targetTable = targetDiv.parent().parent().parent();
		var inputData = targetButton.siblings("input").val();
		console.log(inputData);
		
		if(inputData!=null && inputData!=""){
			var txt =  "<div><div class='circleIco'></div><div class='tableLeftMargin'>";
			txt+= "<strong>"+inputData+"</strong><button class='btStyle btnClose' onclick='revDetailDelete()'>x</button>";
			var revContent = targetButton.siblings("textarea").val().replace(/\n/g,"<br/>");
			txt+= "<div class='m-tTen'>"+revContent+"</div>";
			txt+= "</div>"
			
			targetButton.siblings().val("");
			
			$(txt).insertBefore(targetDiv);
			
			targetTable.children().children().children(".tableBar").height(targetTable.height()-70);
		}
	}
	
	function revDetailDelete() {
		//이벤트가 발생한 버튼
		var targetButton = $(event.target);
		//이벤트가 발생한 작성 Div
		var targetDiv = targetButton.parent().parent();
		//이벤트가 발생한 테이블
		var targetTable = targetDiv.parent().parent().parent();
		
		var targetDiv = event.target.parentElement.parentElement.remove();
		targetTable.children().children().children(".tableBar").height(targetTable.height()-70);
	}
	
	var oldDay = 0;
	var oldTxt = "";
	function periodChange() {
		var periodID = document.getElementById("periodSel");
		var day = periodID.options[periodID.selectedIndex].value;
		if(oldDay==0){
			var txt= "";
			for(i=1; i<=day; i++){
				txt += "<table id='"+i+"DayPan' class='dayTable'><tr><td colspan='1' class='dayVal'>"+i+"일차</td><td><div></div></td></tr>";
				txt += "<tr><td colspan='2' style='padding:0px; border:0px; height:0px;'><div class='tableBar'></div></td></tr>";
				txt += "<tr><td colspan='2'><div class='OkClose'><div class='circleIco'></div><div class='tableLeftMargin' style='float:left'>";
				txt += "<input type='text' placeholder='일정제목' style='width:600px; margin-bottom:20px'/><br/><textarea cols='100' rows='5' placeholder='일정내용' style='resize:none'></textarea>";
				txt += "<button class='btStylePlus btnClose' onclick='revDetailInsert()'>+</button></div></div></td></tr></table>";
			}
			$("#revDetailTable").html(txt);
		}else if(oldDay>day){
			oldTxt = "";
			for(i=1; i<=day; i++){
			oldTxt += "<table id='"+i+"DayPan' class='dayTable'>"+$("#revDetailTable table:nth-child("+i+")").html()+"</table>";
			}
			$("#revDetailTable").html(oldTxt);
		}else if(oldDay<day){
			var txt = "";
			for(i=++oldDay; i<=day; i++){
				txt += "<table id='"+i+"DayPan' class='dayTable'><tr><td colspan='1' class='dayVal'>"+i+"일차</td><td><div></div></td></tr>";
				txt += "<tr><td colspan='2' style='padding:0px; border:0px; height:0px;'><div class='tableBar'></div></td></tr>";
				txt += "<tr><td colspan='2'><div class='OkClose'><div class='circleIco'></div><div class='tableLeftMargin' style='float:left'>";
				txt += "<input type='text' placeholder='일정제목' style='width:600px; margin-bottom:20px'/><br/><textarea cols='100' rows='5' placeholder='일정내용' style='resize:none'></textarea>";
				txt += "<button class='btStylePlus btnClose' onclick='revDetailInsert()'>+</button></div></div></td></tr></table>";
			}
			
			$("#revDetailTable").append(txt);
		}
		oldDay = day;
	}
</script>
<section>
	<div class="container">
		<div id="detail-content"> 	
			<div class="page_location">
				<a href="<%=request.getContextPath()%>/index.jsp">홈></a><a href="#">1박2일</a>
			</div>
			<div class="sec_div">
				<div class="gall_big">
					<div class="w3-content">
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
				<div class="title_text">
					<div class="title_name"><input type="text" placeholder="상품명"/></div>
					<div class='code'> ( 상품코드 : <input type="text" placeholder="상품코드"/> )</div>
					<div class="product_list">
						<ul class="product_menu">
							<li><span class="spanMr">상품가격</span><input type="text" placeholder="가격"/>원</li>
							<li><span class="spanMr">출발지역</span>
								<select>
									<option value="0">=출발지역=</option>
									<option value="1">서울</option>
									<option value="2">인천</option>
									<option value="3">부산</option>
								</select>
							</li>
							<li><span class="spanMr">여행지역</span><input type="text" placeholder="지역"/></li>
							<li><span class="spanMr">여행분류</span><input type="text" placeholder="분류"/></li> 
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="tb_alldiv">
		<table class="table_01">
		    <tr>
		        <th scope="row">예약인원</th>
		        <td>최소 출발 인원 <input type="text" placeholder="최소" style="width:50px"/>명 / 정원 <input type="text" placeholder="정원" style="width:50px"/>명</td>
		    </tr>
		    <tr>
		        <th scope="row">여행일자</th>
		        <td>
		        	<ul id="datePan">
		        		<li><span class="spanMr">여행기간</span>
		        			<select id="periodSel" name="period" onchange="periodChange()">
		        				<option value="0">=여행기간=</option><option value="1">당일치기</option>
		        				<option value="2">1박2일</option>
		        				<option value="3">2박3일</option>
		        			</select>
		        		</li>
			        	<li><span class="spanMr">출발일자</span><input type="text" id="startDate"/></li>
						<li><span class="spanMr">도착일자</span><input type="text" id="backDate" disabled/><button onclick="insertDate()">추가</button></li>
		        	</ul>
		        	<ul id="dateList">
					</ul>
		        </td>
		    </tr>
		    <tr>
		        <th scope="row">보험</th>
		        <td class="row1">
		        	<ul>
		        		<li><span class="spanWiMr">[여행자보험]</span><input type="radio" name="assure1">가입 <input type="radio" name="assure1" checked>미가입</li>
		        		<li><span class="spanWiMr">[영업보증보험]</span><input type="radio" name="assure2">가입 <input type="radio" name="assure2" checked>미가입</li>
		        		<li><span class="spanWiMr">[기획여행 보증보험]</span><input type="radio" name="assure3">가입 <input type="radio" name="assure3" checked>미가입</li>
		        	</ul>
			    </td>
		    </tr>
		</table>
	</div>
	<div id="revDetailTable" style="position:relative">
	</div>
	<button id="gg">클릭~</button>
    </div>	
</section>