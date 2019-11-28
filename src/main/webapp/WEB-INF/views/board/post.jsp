<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<style>
		*{font-family:'Noto Sans KR',sans-serif;}
		section{margin-bottom:50px}
		#reviewPan{width:100%;}
		#reviewPan h4{text-align:left; margin-left:30px; margin-top:20px}
		#posting table{width:80%;margin:0px auto;margin-bottom:20px;}
		#posting table:first-child{border-top:1px solid #ddd;}
		#posting table:first-child tr{height:40px;}
		#posting table:first-child tr:last-child {border-bottom:0px}
		#posting table:first-child tr td:nth-child(2n+1){width:100px; background:#00a7f0; color:white;border-bottom:1px solid #fff;}
		#posting table:first-child tr td:nth-child(2n){text-align:left; padding-left:20px;border-bottom:1px solid #ddd;}
		#posting table:first-child tr:last-child td{border-bottom:1px solid #ddd}
		#postContent {overflow:hidden;}
		#postContent *{text-align:left;}
		#button{width:80%; margin:0px auto; }
		#button input{float:right; margin-right:10px}
		#button input:last-child{float:left}
	</style>
	<script>
		function delChk(){
			if(confirm("삭제하시겠습니까?")){
				location.href="delOk?pageNum=${vo.pageNum}&num=${vo.num}&commuPage=${vo.commuPage}";
			};
		}
		
		function backPage(){
			location.href="list?commuPage=${vo.commuPage}";
		}
	</script>

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
			<div id="posting">
				<table>
					<tr>
						<td colspan="4">
							${vo.subject}
						</td>
					</tr>
					<tr>
						<td>번  호</td>
						<td>${vo.num}</td>
						<td>글쓴이</td>
						<td>${vo.userId}</td>
					</tr>
					<tr>
						<td>날  짜</td>
						<td>${vo.regDate}</td>
						<td>조회수</td>
						<td>${vo.hit}</td>
					</tr>
				</table>
				<table>
					<tr>
						<td colspan="4" id="postContent">${vo.content}</td> 
					</tr>
				</table>
			</div>
			<hr/>
			<div id= "button">
				<c:if test="${logid == vo.userId}">
					<input type="button" class="btn btn-secondary" value="삭제" onclick="delChk()"></input>
					<input type="button" class="btn btn-secondary" value="수정" onclick="location.href='edit?num=${vo.num}'"></input>
				</c:if>
				<input type="button" class="btn btn-secondary" value="목록보기" onclick="backPage()"></input>
			</div>
		</div>
	</div>
</section>