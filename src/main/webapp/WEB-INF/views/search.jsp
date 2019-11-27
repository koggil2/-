<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
</script>
<style>
</style>
<section>
	<div>
	 	<c:if test="${list!=null}">
		 	<h5> 추천여행지로 원하시는 여행을 즐겨보세요. </h5>
		 	<div>
		 		<c:forEach var="p_list" items="${list}">
			 		<div>
				 		<a href="product/product_view?goodCode=${p_list.goodCode}">
				 			<img src="/tour/image/main_img_banner_1.jpg"/>
				 		</a>
				 		${p_list.goodName}<br/>
				 		${p_list.price} 원
			 		</div>
		 		</c:forEach>
		 	</div>
 		</c:if>
 	</div>
</section>