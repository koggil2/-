<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/tour/resources/css/jquery-ui.min.css" type="text/css"/>
<script src="/tour/resources/js/jquery-ui.min.js"></script>
<script src="/tour/resources/js/jquery.bxslider.js"></script>
<link rel="stylesheet" href="/tour/resources/css/jquery.bxslider.css" type="text/css"/>
<title>상품 상세 페이지</title>
<style>
 	.container{margin-top: 80px; max-width: initial; padding:0; }
	.page_location {text-align: right; margin:10px 0;}
	.gall_big{width:500px; float:left;}
	.title_text{float: left; width: 580px; position: relative; height: 350px; padding-top:6px; padding-left:40px;}
	.sec_div{width:100%; height: 352px; border: 1px solid lightgray;}
	.product_menu>li{width:860px; height: 37px; font-size: 17px; text-align: left; }
	.code{font-size: 12px; width:300px; height: 26px; margin:10px 0; padding-left:30px;}
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
	#datePan>li{float:none; text-align:left; list-style-type:none; margin-bottom:10px;}
	#datePan>li:last-child{margin-bottom:0;}
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
	section button:focus { outline:none;}
	.btStyle {margin-left: 20px; width:15px; height:15px; font-size:15px; border: 0; background:none;}
	.btStylePlus {margin-left: 20px; width:25px; height:25px; font-size:25px; border: 0; background:none;}
	
	.spanWiMr{width:200px; text-align:left;}
	
	#imgBx{height:340px;}
	#imgBx li{width:500px; height:340px; overflow:hidden;}
	#imgBx img{width:500px;}
</style>
<script>
	var mySlider;
	var codeChkOk = true;
	$(function(){
		//코드 중복체크
		$('#codeChk').click(function(){
			var goodCode = $("#goodCode").val();
			if(codeChkOk){
				$.ajax({
					type : "GET",
					url : "codeCheck",
					data : "goodCode="+goodCode,
					success : function(result){
						if(result!=""){
							if(confirm("입력하신 코드는 "+goodCode+"는 사용가능합니다.\n이 코드를 사용하시겠습니까?\n(수정이 불가능합니다.)")){
								$("#goodCode").attr("value",goodCode);
								$("#goodCodeCopy").val(goodCode);
								/* document.getElementById("goodCode").setAttribute("readonly"); */
								codeChkOk = false;
							}else{
								$("#goodCode").val("");
							}
						}else{
							alert("코드를 입력해주세요.");
							$("#goodCode").val("");	
						}	
					},
					error : function(e){
						alert(e.responseText);
					}
				});
			}
		});
		//bxslider
		mySlider = $("#imgBx").bxSlider({
						mode:'horizontal',
						sliderWidth:500,
						sliderHeight:340,
						auto:true
					});
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
		$("#startD").datepicker();
		
		//도착일 자동선택
		$("#startD").change(function(){
			var day = $("#travelTerm option").index($("#travelTerm option:selected"));
			if(day>0){
				
				var dayPlus = (day-1)*86400000;
				var today = new Date();
				var backD = Date.parse($("#startD").val())+dayPlus;
				
				today.setTime(backD);
				
				var backYear = today.getFullYear();
				var backMonth = today.getMonth()+1;
				if(backMonth<10)backMonth = "0" + backMonth ;
				var backD = today.getDate();
				if(backD<10)backD = "0" + backD ;
				
				
				var setDate = backYear+"-"+backMonth+"-"+backD;
	
				$("#backD").val(setDate);
			
			}else{
				alert("여행기간을 선택해주세요.");
				$("#startD").val("");
			}
		});
		// 여행기간 변경 시 초기화
		$("#travelTerm").change(function(){
			if($("#dateList li").length>0){
				$("#dateList").html("");
			}
		});
		
		
		// 작성 완료.
		$("#writerOk").click(function(){
			
			//상품명
			if($("#goodName").val()==""){
				alert("상품명을 입력하십시오.");
				return false;
			}
			//상품코드
			if($("#goodCode").val()==""){
				alert("상품코드를 입력하십시오.");
				return false;
			}
			//상품코드 확인
			if(codeChkOk){
				alert("상품코드 중복확인을 하십시오.");
				return false;
			}
			//이미지 등록
			if($("#imgBx li").length<=0){
				alert("이미지를 등록하십시오.");
				return false;
			}
			//상품가격
			if($("#price").val()==""){
				alert("상품가격을 입력하십시오.");
				return false;
			}
			//출발지역
			if($("#startArea").val()==0){
				alert("출발지역을 선택하십시오.");
				return false;
			}
			//여행지역
			if($("#destination").val()==""){
				alert("여행지역을 입력하십시오.");
				return false;
			}
			//여행분류
			if($("#travelType").val()==0){
				alert("여행분류를 선택하십시오.");
				return false;
			}
			//일정등록
			if($("#dateList li").length<=0){
				alert("여행일정을 등록하십시오.");
				return false;
			}
			
			
			$(".OkClose").css("display","none");
			$(".btnClose").css("visibility","hidden");
			
			var day = $("#travelTerm option").index($("#travelTerm option:selected"));
			
			for(i=1; i<=day; i++){
				$("#"+i+"DayPan tr td .tableBar").height($("#"+i+"DayPan").height()-70);
			}
			
			$("#goodData").val($("#revDetailTable").html());
			
			//입력한 일정 정리
			var sd = "";
			var bd = "";
			
			for(i=1; i<=$("#dateList li").length; i++){
				var oneDate = $("#dateList li:nth-child("+i+")").html();
				var od = (oneDate.substring(0,23)).split(" ~ ");
				sd += "Startv"+od[0]; //첫번째토큰은 스타트데이트
				bd += "Backy"+od[1]; //두번째토큰은 백데이트
			}
			
			$("#startDate").val(sd);
			$("#backDate").val(bd);
			
			
			var url = "product_write";
			var params = $("#productFrm").serialize();//폼의 데이터를 직렬화한다.
			$.ajax({
				type:"POST",
				data:params,
				url:url,
				success:function(result){
					if(result>0){
						alert("작성되었습니다.");
						location.href="management";
					}else{
						alert("작성실패하였습니다.");
					}
				},error:function(e){
					alert("작성실패"+e.responseText);
				}
			});
		});
	});
	function insertDate(){
		if($("#startD").val()!=""&&$("#backD").val()!=""){
			var dateTxt = "<li class='dateListLi'>"+$("#startD").val()+" ~ "+$("#backD").val()+"<button class='btStyle btnClose' onclick='deleteDate()'>x</button></li>"
			$("#dateList").append(dateTxt);
			$("#startD").val("");
			$("#backD").val("");
		}
	}
	function deleteDate(){
		var targetDiv = event.target.parentElement.remove();
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
	function travelTermChange() {
		var periodID = document.getElementById("travelTerm");
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
	//이미지 첨부 이벤트
	function imgUpload(){	
		var formData = new FormData(document.getElementById("imgUploadForm"));
		var url = "imgUpload";
		$.ajax({
			type:"POST",
			url:url,
			data:formData,
			processData:false,
			contentType:false,
			success:function(result){//fileAddr
				var txt = "<li><a><img src='/tour/imgUpload/"+result+"'/></a></li>";
				$("#imgBx").append(txt);
				mySlider.reloadSlider();
				
			},error:function(e){
				alert(e.responseText);
			}
		});
	}
	//코드가 있을때만 파일 선택 가능.
	function fileSel(){
		if(!codeChkOk){
			document.all.fileName.click();
		}else{
			alert("상품코드를 입력하고 중복확인을 하십시오.");
			return false;
		}
	}
</script>
<section>
	<div class="container">
		<form id="productFrm" method="post" onsubmit="return false">
			<div id="detail-content"> 	
				<div class="page_location">
					<a href="<%=request.getContextPath()%>/index.jsp">홈></a><a href="#">1박2일</a>
				</div>
				<div class="sec_div">
					<div class="gall_big">
						<div class="w3-content">
							<ul id="imgBx">
							</ul>
						</div>
					</div>
					<div class="title_text">
						<div class="title_name"><input type="text" name="goodName" id="goodName" placeholder="상품명"/></div>
						<div class='code'> ( 상품코드 : <input type="text" name="goodCode" id="goodCode" placeholder="상품코드"/>
													<input type="button" id="codeChk" value="확인" /> )</div>
						<div class="product_list">
							<ul class="product_menu">
								<li><span class="spanMr">상품가격</span><input type="text" name="price" id="price" placeholder="가격"/>원</li>
								<li><span class="spanMr">출발지역</span><select name="startArea" id="startArea">
										<option value="0">=출발지역=</option>
										<option value="seoul">서울</option>
										<option value="incheon">인천</option>
										<option value="busan">부산</option>
									</select>
								</li>
								<li><span class="spanMr">여행지역</span><input type="text" name="destination" id="destination" placeholder="지역"/></li>
								<li><span class="spanMr">여행분류</span><select name="travelType" id="travelType">
										<option value="0">=여행분류=</option>
										<option value="family">가족여행</option>
										<option value="school">수학여행</option>
										<option value="study">현장학습</option>
									</select></li>
								<li><span class="spanMr">사진첨부</span><button class="button" onclick="fileSel()">파일 선택</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="tb_alldiv">
				<table class="table_01">
				    <tr>
				        <th scope="row">예약인원</th>
				        <td>최소 출발 인원 <input type="text" placeholder="최소" name="reserMin" style="width:50px"/>명 / 정원 <input type="text" placeholder="정원" name="reserNum" style="width:50px"/>명</td>
				    </tr>
				    <tr>
				        <th scope="row">여행일자</th>
				        <td>
				        	<ul id="datePan">
				        		<li><span class="spanMr">여행기간</span>
				        			<select id="travelTerm" name="travelTerm" onchange="travelTermChange()">
				        				<option value="0">=여행기간=</option>
				        				<option value="1">당일치기</option>
				        				<option value="2">1박2일</option>
				        				<option value="3">2박3일</option>
				        			</select>
				        		</li>
					        	<li><span class="spanMr">출발일자</span><input type="text" id="startD" readonly/></li>
								<li><span class="spanMr">도착일자</span><input type="text" id="backD" disabled/><button onclick="insertDate()">추가</button></li>
				        	</ul>
				        	<ul id="dateList"></ul>
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
			<input type="hidden" name="startDate" id="startDate"/>
			<input type="hidden" name="backDate" id="backDate"/>
			<input type="hidden" name="goodData" id="goodData"/>
			<div id="revDetailTable" style="position:relative"></div>
			<button id="writerOk" class="btn btn-secondary">작성</button>
		</form>
		<form id="imgUploadForm" method="POST" enctype="multipart/form-data" onchange="imgUpload()">
			<input type="text" name="goodCodeCopy" id="goodCodeCopy" style="display:none"/>
			<input type="file" name="fileName" id="fileName" style="display:none"/>
		</form>
    </div>	
</section>