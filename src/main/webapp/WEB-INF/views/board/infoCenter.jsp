<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	*{font-family:'Noto Sans KR',sans-serif;}
	#infoPan{width:100%; height:1000px}
	#infoPan h4{text-align:left; margin-left:30px; margin-top:20px}
	#infoPage{width:100%;}
	#infoTable{border:1px solid #bbb; width:90%;margin:0px auto;margin-bottom:20px; table-layout: fixed;}
	thead{border-bottom:3px double gray}
	#searchNwrite{width:90%; margin:0px auto;}
	#infoSearch{float:left; text-align:left; width:95%; }
	#infoSearch input{text-align:left}
	#write{text-align:right; }
	hr{border:0; height: 3px; background:#ccc linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));}
	
	#infoTable tr th:nth-child(1), #infoTable tr th:nth-child(5){width:8%;}
	#infoTable tr th:nth-child(2){width:50%;}
	#infoTable td{white-space:nowrap; text-overflow:ellipsis; overflow:hidden;} 
	
	#sidebar-wrapper{width:200px; position:absolute; left:168px; top:633px;}
	#sidebar-top{text-align: left;  height: 50px;  line-height: 40px; font-size: 30px;}
	#sidebar-content a{text-align: left;}
</style>

<section>
	<div id="sidebar-wrapper">
		<div id="sidebar-top" class="sidebar-heading">고객센터</div>
		<div id="sidebar-content" class="list-group list-group-flush">
			<a href="list?commuPage=infoCenter" class="list-group-item list-group-item-action">공지사항</a>
			<a href="list?commuPage=faq" class="list-group-item list-group-item-action">자주묻는질문</a>
		</div>
	</div>
	
	<div id="infoPan">
		<div id="infoTab1"><h4>공지사항</h4><hr/>
			<div id="infoTab">
				<table id="infoTable" class="table table-striped">
					<thead class="table table-secondary">
						<tr>
			  				<th>번호</th>
			  				<th>제목</th>
			  				<th>글쓴이</th>
			  				<th>날짜</th>
			  				<th>조회수</th>
		  				</tr>
					</thead>
					<tbody>
					<c:forEach var="v" items="${lst}">
						<tr>
		  					<td>${v.no}</td>
		  					<td><a href="post">${v.subject}</a></td>
		  					<td>${v.userId}</td>
		  					<td>${v.regDate}</td>
		  					<td>${v.hit}</td>
		  				</tr>
		  			</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<ul id="infoPage" class="pagination pagination-sm justify-content-center">
					<li class="page-item <c:if test="${vo.pageNum<=1}">disabled</c:if>">
						<a href="board/list.do?commuPage=${vo.commuPage}&pageNum=${vo.pageNum-1}" class="page-link">◀</a>
					</li>
					<c:forEach var="i" begin="${vo.startPage}" end="${vo.startPage+vo.onePageMax-1}">
						<c:if test="${i<=vo.totalPage}">
							<c:if test="${i==vo.pageNum}"><li class="page-item active"><a href="board/list.do?commuPage=${vo.commuPage}&pageNum=${i}" class="page-link">${i}</a></li></c:if>
							<c:if test="${i!=vo.pageNum}"><li class="page-link"><a href="board/list.do?commuPage=${vo.commuPage}&pageNum=${i}" >${i}</a></li></c:if>
						</c:if>
					</c:forEach>
					<li class="page-item <c:if test="${vo.pageNum==vo.totalPage}">disabled</c:if>">
					<a href="board/list.do?commuPage=${vo.commuPage}&pageNum=${vo.pageNum+1}" class="page-link">▶</a></li>
				</ul>
			</div>
		</div>
		<div id="searchNwrite">
			<form id="infoSearch">
				<select name ="searchKey">
					<option value="userId">작성자</option>
					<option value="subject">제목</option>
					<option value="content">글내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="hidden" name="commuPage" value="${vo.commuPage}"/>
				<input type="submit" value="검색" onclick="location.href='board/list.do?'"/>
			</form>
			<button id="write" onclick="location.href='write'">글쓰기</button>
		</div>
	</div>
</section>
