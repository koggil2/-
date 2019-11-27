<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "회원탈퇴";
	pageSideName = "구트투어 회원탈퇴";
	pageImage = "main_img_banner_6.jpg";
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/css/uikit.min.css" />
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/uikit@3.2.2/dist/js/uikit-icons.min.js"></script>

<section style="height:300px;">
	<h2>회원 탈퇴</h2>
	<form method="post" action="deleteOk?">
		<table style="text-align: center;margin:0 auto;">
			<tr>
				<td>그동안 GooTTour를 이용해주셔서 감사합니다.</td>
					<h4>회원탈퇴를 하시면 GooTTour에서 제공하는 서비스를 더 이상 이용하실 수 없으며 회원님의 개인정보는 모두 삭제됩니다.</h4>
				</td><hr/>
				<td><input type="hidden" name="userId" value="${logid}"/></td>
			</tr>
		</table>
		<div class="uk-margin">
        	<input class="uk-input uk-form-width-medium" type="password" name="userPwd" placeholder="비밀번호 입력">
        </div>
        <div class="uk-margin">
    		<button class="uk-button uk-button-danger">회원탈퇴</button>
    	</div>
	</form>
</section>
