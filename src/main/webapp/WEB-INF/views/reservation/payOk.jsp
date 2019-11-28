<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0}">
	<script>
		if(confirm("결제완료")){
			location.href="/tour/";
		}else{
			history.back();
		}
		
	</script>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("결제실패..");
		history.back();
	</script>
</c:if>