<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
</script>
<style>
.card{width:300px; float:left; margin:25px;}
</style>
<section>
	<div id="container">
	 	<c:if test="${list!=null}">
	 		<c:forEach var="p_list" items="${list}">
		 		<div class="card">
						<a href="product_view?goodCode=${p_list.goodCode}">
							<img class="card-img-top" src="http://placehold.it/700x400" alt="">
						</a>
						<!-- 여행분류과 상품코드 필요함. product_view?goodcode=?&treveltype=? -->
						<div class="card-body">
							<h4 class="card-title">
								<a href="product_view?goodCode=${p_list.goodCode}">${p_list.goodName }</a>
							</h4>
							<h5>${p_list.price}</h5>
							<p class="card-text">${p_list.destination}, ${p_list.travelTerm}</p>
						</div>
					</div>
	 		</c:forEach>
 		</c:if>
 	</div>
</section>