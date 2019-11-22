<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0}">
	<script>
		alert("글이 삭제되었습니다.\n리스트페이지로 이동합니다.");
		location.href="list?commuPage=${vo.commuPage}";
	</script>
</c:if>
<c:if test="${cnt<=0}">
	<script>
		alert("글 삭제에 실패하였습니다.");
		history.back();
	</script>
</c:if>