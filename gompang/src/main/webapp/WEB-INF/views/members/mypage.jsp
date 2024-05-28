<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
#menu-item >*{
    display:inline-block;
    margin:10px;
}
#menu-btns >*{
    margin: 0 auto;
}
#menu-btns{
    width: 30%;
    display: flex;
    flex-direction:row;
}
#menu-form{
    margin:20px;
    padding:20px;
    font-size:1.5rem; 
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <%@ include file="../sub/nav.jsp" %>
    <div class="main-container">
        <h1 class="text-center"> My 곰팡 </h1>
        <div id="menu-form">
            <div id="menu-item">
                <a href="">내 정보 관리</a>
                <a href="">또 다른 메뉴</a>
            </div>
            <div id="menu-item">
                <a href="/cart">장바구니</a>
            </div>
            <br>
        </div>
    </div>
</section> 
<footer>

</footer>

</body>
</html>