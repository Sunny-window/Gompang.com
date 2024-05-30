<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>

</style>
</head>
<body>
<header>
    <%@ include file="sub/header.jsp" %>
</header>
<section>
<div>
    <h1> ${err_msg} ${status} ${error} </h1>
    <c:if test="${err_code eq 1}">
        <h2>3초 뒤 로그인 화면으로 이동합니다.</h2>
    </c:if>
    <a href="/"> 메인으로 돌아가기 </a>
    
</div>
</section>

<script>
function gotoLogin(){
    if('${err_code}' == '1' ){
        alert('로그인 페이지로 이동합니다.');
        location.href = '/loginForm';
    }
}

document.addEventListener('DOMContentLoaded', (event) => {
        setTimeout(gotoLogin, 3100); // x초 뒤 실행
        // setInterval(gotoLogin, 5000); // x초 마다 함수 실행
    });

</script>

</body>
</html>