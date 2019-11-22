<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	*{font-family:'Noto Sans KR',sans-serif;}
	section{margin-bottom:50px}
	#editPan{width:100%;}
	#editPan h4{text-align:left; margin-left:30px; margin-top:20px}
	#edit{width:80%; margin:0px auto; margin-bottom:20px; border-top: 1px solid #ddd; border-bottom:1px solid #ddd}
	#edit table tr{height:60px}
	#edit table tr td:first-child{width:100px; background:#00a7f0; color:white;; border-bottom:1px solid white}
	#edit table tr td:last-child{width:90%; padding:20px; border-bottom:1px solid #ddd; text-align:left;}
	#edit table tr:last-child td:first-child{border-bottom:0px}
	#edit table tr:last-child td:last-child{border-bottom:0px}
	#button{width:98%;margin:0px auto; padding:0px 110px;}
	#button input{float:right; margin-right:10px;margin-top:10px;}
	
	#subject{width:400px; text-align:left; border:1px solid #ddd; border-radius:3px;}
</style>
<script>
$(function(){
	CKEDITOR.replace('content');
});

function backPage(){
	history.back();
}
</script>

<section>
	<%@ include file="../inc/boardSide.jspf" %>
	<div id="editPan">
		<div id="editTab1">
		<h4>
			<c:if test="${vo.commuPage == 'infoCenter'}">공지사항</c:if>
			<c:if test="${vo.commuPage == 'faq'}">자주묻는 질문</c:if>
			<c:if test="${vo.commuPage == 'edit'}">여행후기</c:if>
			<c:if test="${vo.commuPage == 'trevelQ'}">여행문의</c:if>
		</h4>
		<hr class="hrStyle">
			<form id="edit" method="post" action="editOk">
				<table>
					<tr>
						<td>작성자</td>
						<td><input type="hidden" id="userId" name="userId" value="${vo.userId}"/>${vo.userId}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" class="bora" id="subject" name="subject" value="${vo.subject}"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea id="content" name="content" >${vo.content}</textarea></td>
					</tr>
				</table>
				<input type="hidden" id="commuPage" name="commuPage" value="${vo.commuPage}">
				<input type="hidden" name="num" value="${vo.num}">
				<div id="button">
					<input type="button" value="돌아가기" class="btn btn-secondary" onclick="backPage()"></input>
					<input type="submit" value="수정" class="btn btn-secondary"></input>
				</div>
			</form>
		</div>
	</div>
</section>