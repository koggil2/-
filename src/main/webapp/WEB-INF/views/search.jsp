<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
</script>
<style>
.card{width:300px; float:left; margin:25px;}
.listImgH{
	 height:180px;
	 overflow:hidden;
 }
.listImgH img{
	position: relative;
	top: -15px;
	max-width: 100%;
    height: auto;
    box-sizing: border-box;
}
</style>
<section>
	<div id="container">
		<h1 id="djqtek" style="margin-top:80px">검색결과가 없습니다.</h1>
	 	<c:if test="${list!=null}">
	 		<c:forEach var="p_list" items="${list}">
		 		<div class="card">
					<a href="product_view?goodCode=${p_list.goodCode}" class="listImgH">
						<img src="/tour/imgUpload/${p_list.fileName}">
					</a>
					<!-- 여행분류과 상품코드 필요함. product_view?goodcode=?&treveltype=? -->
					<div class="card-body">
						<h4 class="card-title">
							<a href="product/product_view?goodCode=${p_list.goodCode}">${p_list.goodName}</a>
						</h4>
						<h5>${p_list.price}</h5>
						<p class="card-text">${p_list.destination}, ${p_list.travelTerm}</p>
					</div>
				</div>
				<script>
					document.getElementById("djqtek").remove();
				</script>
	 		</c:forEach>
 		</c:if>
 	</div>
</section>