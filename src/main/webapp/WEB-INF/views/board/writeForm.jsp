<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	*{font-family:'Noto Sans KR',sans-serif;}
	section{margin-bottom:50px}
	#reviewPan{width:100%;}
	#reviewPan h4{text-align:left; margin-left:30px; margin-top:20px}
	#reviewWrite{width:80%; margin:0px auto; margin-bottom:20px; border-top: 1px solid #ddd; border-bottom:1px solid #ddd}
	#reviewWrite table tr{height:60px}
	#reviewWrite table tr td:first-child{width:100px; background:#00a7f0; color:white;; border-bottom:1px solid white}
	#reviewWrite table tr td:last-child{width:90%; padding:20px; border-bottom:1px solid #ddd; text-align:left;}
	#reviewWrite table tr:last-child td:first-child{border-bottom:0px}
	#reviewWrite table tr:last-child td:last-child{border-bottom:0px}
	#button{width:98%}
	#button input:nth-child(1){margin-top:20px; float:left}
	#button input:nth-child(2){margin-top:20px; float:right}
	
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
	<div id="reviewPan">
		<div id="reviewTab1">
		<h4>
			<c:if test="${commuPage == 'infoCenter'}">공지사항</c:if>
			<c:if test="${commuPage == 'faq'}">자주묻는 질문</c:if>
			<c:if test="${commuPage == 'reviewPage'}">여행후기</c:if>
			<c:if test="${commuPage == 'travelQ'}">여행문의</c:if>
		</h4>
		<hr class="hrStyle">
			<form id="reviewWrite" method="post" action="writeOk.do">
				<table>
					<tr>
						<td>작성자</td>
						<td><input type="hidden" id="userId" name="userId" value="${logid}"/>${logid}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" class="bora" id="subject" name="subject"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea id="content" name="content"></textarea></td>
					</tr>
				</table>
				<input type="hidden" id="commuPage" name="commuPage" value="${commuPage}">
				<div id="button">
					<input type="button" value="돌아가기" onclick="backPage()"></input>
					<input type="submit" value="글저장"></input>
				</div>
			</form>
		</div>
	</div>
</section>