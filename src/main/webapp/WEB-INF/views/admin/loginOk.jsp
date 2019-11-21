<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${memType=='관리자' }">
	<script>
		alert("로그인에 성공했습니다.");
		location.href="/tour/admin/main";
	</script>
</c:if>
<c:if test="${memType!='관리자' }">
	<script>
		alert("관리자 권한이 없습니다!");
		location.href="/tour/admin";
	</script>
</c:if>