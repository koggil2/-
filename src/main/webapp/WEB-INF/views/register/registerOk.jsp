<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	if(confirm("회원가입이 완료되었습니다.\n로그인 하시겠습니까?")){
		location.href="/tour/register/loginForm";	
	}else{
		location.href="/tour/";
	}
</script>