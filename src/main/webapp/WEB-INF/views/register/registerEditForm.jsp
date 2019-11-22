<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "회원정보수정";
	pageSideName = "구트투어 회원정보수정";
	pageImage = "main_img_banner_6.jpg";
%>
<style>
* 	{
	font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/css/uikit.min.css" />
<link rel="stylesheet" href="/tour/resources/css/registerForm.css" type="text/css" />
<link rel="stylesheet" href="/tour/resources/css/main.css" type="text/css" />

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit-icons.min.js"></script>
<script type="text/javascript">
    	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
    	$("#imgBannerText>h1").text("<%=pageName%>");
    	$("#imgBannerText>h2").text("<%=pageSideName%>");

	$(function(){
		$("#regForm").submit(function(){
			if($("#userPwd").val()==''){
				alert("비밀번호를 입력해주세요!");
				return false;
			}
			//비밀번호 8~14까지 첫번째영문자 특수문자포함 \w:영대소문자, _ 문자
			//  ?= : 전방탐색, .:모든 문자와 일치합니다.,
			//  *  : 앞에 존재하는 문자가 0번 혹은 그 이상 반복되는 문자를 찾을 때 사용합니다.
			//  g  : 문자열내의 모든 패턴 찾기
			//  i  : 문자열의 대소문자를 구별하지 않는다.
			
			
			///////////////////////////
			if($("#zipcode").val()=="" || $("#addr").val()==""){
				alert("주소를 입력하세요!");
				return false;
			}
			if($("#detailAddr").val()==''){
				alert("상세주소를 입력하세요!");
				return false;
			}
			//이메일
			if($("#emailId").val()==''){
				alert("이메일을 입력해주세요!");
				return false;
			}
			reg = /\w{4,12}[@][a-z]{2,10}[.][a-z]{2,3}[.]?[a-z]{0,2}/
			var email = $("#emailId").val() +"@"+ $("#emailDomain").val();
			if(!reg.test(email)){
				alert("이메일을 잘못입력하였습니다!");
				return false;
			}
			//연락처
			if($("#t3").val()==''){
				alert("연락처를 입력해주세요!");
				return false;
			}
			reg = /(010|02|031|32)[-][0-9]{3,4}[-][0-9]{4}/;
			var tel = $("#t1").val()+"-"+$("#t2").val()+"-"+$("#t3").val();
			if(!reg.test(tel)){
				alert("연락처를 잘못입력하였습니다!");
				return false;
			}
			
		});

	});
</script>

	<section>
		<div class="H_40"></div>
		<div class='container' style="text-align: left; margin-bottom: 20px">
			<img src='/tour/image/mo.png' id="mo">
			<span class="tit" name="new" id="new">회원정보수정</span> <span class="tit_s">회원가입을
				하시면 더 많은 혜택을 받으실 수 있습니다.</span>
		</div>
		<div class="container">
			<div class="container mt-2" id="layerPOP2">
				<form method="post" name='m' id='regForm'
					action="/tour/register/registerEditOk">

					<table class="member">
						<tr>
							<!-- 수정x -->
							<td class="stit">아이디</td>
							<td class="frm" style="position: relative;" class="form-group">
							${vo.userId}
							<input type="hidden" name="userId" value="${vo.userId}">
								<%-- <input type="text" class="ipf form-control" value="${vo.userId}" readonly="readonly"> --%>
							</td>
						</tr>
						<tr>
							<td class="stit">비밀번호</td>
							<td class="frm"><input type="password"
								class="ipf form-control" style="position: relative;"
								name='userPwd' id='userPwd' maxlength="15"
								placeholder="* 8~14 자리 문자,숫자,특수문자"> <span id='check_pw22'></span><input
								type="hidden" name="counter2" id="counter2"></td>
						</tr>
						<tr>
							<!-- 수정x -->
							<td class="stit">성명(실명)</td>
							<td class="frm"><input type="text" class="ipf form-control"
								value="${vo.userName }" disabled></td>
							
						</tr>
						<tr>
							<!-- 수정x -->
							<td class="stit">생년월일</td>
							<td class="frm">
							<input type="text" class="ipf form-control"	id='birthYear' style="width: 100px;" value="${vo.birthYear }" disabled>
							<select	name="birthMonth" id="birthMonth" disabled>
									<c:forEach var="i" begin="1" end="12">
										<c:if test="${i<10}">
											<option value="0${i}" <c:if test="${vo.birthMonth==i}">selected</c:if>>${i}</option>
										</c:if>
										<c:if test="${i>10}">
											<option value="${i }" <c:if test="${vo.birthMonth==i }">selected</c:if>>${i }</option>
										</c:if>
									</c:forEach>
							</select>월 <select name="birthDate" id="birthDate" disabled>
									<c:forEach var="i" begin="1" end="31">
										<c:if test="${i<10}">
											<option value="0${i}" <c:if test="${vo.birthDate==i}">selected</c:if>>${i}</option>
										</c:if>
										<c:if test="${i>=10}">
											<option value="${i}" <c:if test="${vo.birthDate==i}">selected</c:if>>${i}</option>
										</c:if>
									</c:forEach>
							</select>일</td>
						</tr>

						<tr>
							<td class="stit" rowspan="3" style="text-align: center;">주소</td>

							<td class="frm">
								<div id="wrap"
									style="display: none; border: 1px solid; width: 500px; height: 300px; margin: -10px 0px 5px -10px; position: absolute">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
										id="btnFoldWrap"
										style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
										onclick="foldDaumPostcode()" alt="접기 버튼">
								</div> <input type="text" class="ipf" name='zipCode' id='zipCode'
								value="${vo.zipCode }"><input type="button"
								class="btn btn-secondary" onclick="sample3_execDaumPostcode()"
								value="검색" />
							</td>
						</tr>
						<tr>
							<td class="frm"><input type="text" class="ipf" name='addr'
								id='addr' value="${vo.addr }"></td>
						</tr>
						<tr>
							<td class="frm"><input type="text" class="ipf"
								name='detailAddr' id='detailAddr' value="${vo.detailAddr }"
								style="float: left;"></td>
						</tr>
						<tr>
							<td class="stit">이메일</td>
							<td class="frm"><input type="text" class="ipf"
								name='emailId' id='emailId' value="${vo.emailId }">
								<li style="margin-top: 5px;">@</li> <input type="text"
								class="ipf" id="emailDomain" name='emailDomain'
								value="${vo.emailDomain }"> 입력하신 메일주소로 견적서 및 계약서가
								발송됩니다.</td>
						</tr>
						<tr>
							<td class="stit">연락처</td>
							<td class="frm"><input type="text" class="ipf2" name='t1'
								id='t1' maxlength="3" value="${vo.t1 }">-<input type="text" class="ipf2"
								id="t2" name='t2' maxlength="4" value="${vo.t2 }">-<input type="text"
								class="ipf2" id="t3" name='t3' maxlength="4" value="${vo.t3 }">&nbsp;&nbsp;연락가능한
								휴대폰번호를 입력하세요</td>
						</tr>
						<tr>
							<td><input type="hidden" id="memType" name="memType"
								value="일반"></td>
						</tr>

						
					</table>
					<input type="submit" class="btn btn-lg btn-secondary" id="btn"
						value="수정하기" />
				</form>
			</div>
			<script src="/tour/resources/js/bootstrap-validate.js"></script>
			<script>
				bootstrapValidate('#userId', 'min:7:')
				bootstrapValidate('#userPwd', 'min:8:')
				bootstrapValidate('#chkPwd', 'min:8:')
			</script>
		</div>
		<script>
			// 우편번호 찾기 찾기 화면을 넣을 element
			var element_wrap = document.getElementById('wrap');

			function foldDaumPostcode() {
				// iframe을 넣은 element를 안보이게 한다.
				element_wrap.style.display = 'none';
			}

			function sample3_execDaumPostcode() {
				// 현재 scroll 위치를 저장해놓는다.
				var currentScroll = Math.max(document.body.scrollTop,
						document.documentElement.scrollTop);
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('zipCode').value = data.zonecode;
								document.getElementById("addr").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("detailAddr").focus();

								// iframe을 넣은 element를 안보이게 한다.
								// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								element_wrap.style.display = 'none';

								// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
								document.body.scrollTop = currentScroll;
							},
							// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
							onresize : function(size) {
								element_wrap.style.height = size.height + 'px';
							},
							width : '100%',
							height : '100%'
						}).embed(element_wrap);

				// iframe을 넣은 element를 보이게 한다.
				element_wrap.style.display = 'block';
			}
		</script>
	</section>
