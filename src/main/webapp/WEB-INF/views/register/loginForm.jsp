<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/tour/resources/css/loginForm.css" type="text/css" />
<%
	pageName = "구트투어";
	pageSideName = "로그인";
	pageImage = "mainimg4.jpg";
%>
<script>
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");

	function chk(){
		var id = document.getElementById("userId").value;
		if(id==""){//아이디를 입력 안했을 경우
			alert("아이디를 입력하세요.");
			return false;
		}
		if(id.length<7){//글자수 확인
			alert("아이디는 확인해주세요.");
			return false;
		}
		//대소문자, 숫자만 허용한다.
		var cnt=0;
		for(idx=0; idx<id.length;idx++){
			ch = id.charAt(idx);
			if(!(ch>='A' && ch<='Z' || ch>='a' && ch<='z' || ch>='0' && ch<='9'))
				cnt++;
		}
		if(cnt>0){
			alert("아이디를 확인해주세요.");
			return false;
		}
		//비밀번호 검사  영어, 숫자, 특수문자 ($,%,#,!)
		var pwd = document.getElementById("userPwd").value;
		
		
		//각 문자의 종류에 대한 갯수를 구한다.
		var eng = 0;// 영어
		var num = 0;// 숫자
		var spe = 0;// 특수
		for(idx=0; idx<pwd.length; idx++){
			ch = pwd.charAt(idx);
			if(ch>='A' && ch<='Z' || ch>='a' && ch<='z')
				eng++;
			if(ch>='0' && ch<='9')
				num++;
			if(ch == '$' || ch == '%' || ch == '#' || ch== '!'){
				spe++;
			}
		}
		/////////////
		if(pwd.length<8){//글자수 확인
			alert("비밀번호를 확인해주세요.");
			return false;
		}
	}

</script>
	<section>
		<div>
			<form method="post" onsubmit="return chk()" id="form-signin" class="was-validated" action="login">
				<div class="text-center">
					<img src="/tour/image/key.png">
					<h1 class="h3 mb-3 font-weight-bold">로그인</h1>
				</div>
				<div class="form-label-group">
					<input type="text" id="userId" name="userId" class="form-control" maxlength="15" placeholder="아이디를 입력해주세요." required autofocus>				
				</div>
				<div class="form-label-group">
					<input type="password" id="userPwd" name="userPwd" class="form-control" maxlength="15" placeholder="비밀번호를 입력해주세요." required autofocus>				
				</div>
				<input class="btn btn-lg btn-secondary btn-block" type="submit" id="log" value="로그인" />
					<a id="idinquiry" href="registerForm">회원가입</a>
					<a id="pwinquiry" href="#" onclick="popup();">아이디/비밀번호 찾기</a>
			</form>
		</div>
	</section>
