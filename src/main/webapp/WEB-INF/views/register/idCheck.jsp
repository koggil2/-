<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.red{color:red}
</style>
<script>
	$(function(){
		$("#idSet").click(function(){
			opener.document.getElementById("userId").value = $(".red").text();
			opener.document.getElementById("idChkResult").value = "Y";
			
			self.close(); //window.close(); opner.close();  창닫기
			
		})
	})
</script>
</head>
<body>
<div>
	

<!-- true 아이디가 있을때, false 아이디가 없을때 -->
<!-- 사용가능.. -->
<c:if test="${!result}">
			아이디<span class='red'>${userId}</span>는 사용 가능한 아이디 입니다.
			<%-- <input type="hidden" id="searchId" value="<%=userId %>"/> --%>
			<input type='button' value='아이디사용하기' id="idSet"/>
</c:if>	

<c:if test="${result}">	
		<!-- 사용불가능 -->
			아이디 ${userId}는 사용불가능한 아이디입니다.
</c:if>


	<hr>
	<form method="post"	action="/tour/register/idCheck">
		아이디입력: <input type="text" name="userId"/>
		<input type="submit" value="아이디중복검사 "/>
	</form>
	
	
</div>

</body>
</html>