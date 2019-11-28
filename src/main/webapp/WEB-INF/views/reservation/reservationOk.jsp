<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0}">
	<script>
		if(confirm("예약완료\n결체창으로 넘어가시겠습니까?")){
			location.href="/tour/reservation/payment?userId=${rev_vo.userId}&goodCode=${rev_vo.goodCode}&sc_num=${rev_vo.sc_num}";
		}else{
			history.back();
		}
		
	</script>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("예약실패..");
		history.back();
	</script>
</c:if>