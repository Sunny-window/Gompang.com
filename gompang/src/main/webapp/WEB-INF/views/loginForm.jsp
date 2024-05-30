<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
#login-item >*{
    display:flex;
    width:250px;
}
#login-btns >*{
    margin: 0 auto;
}
#login-btns{
    width: 250px;
    display: flex;
    flex-direction:row;
}
#login-form{
    display:flex;
    flex-direction: column;
    align-items: center;
    font-size:1.1rem;
}
</style>
</head>
<body>
<header>
    <%@ include file="sub/header.jsp" %>
</header>
<section>
    <%@ include file="sub/nav.jsp" %>
    <div class="main-container">
        <h2 class="text-center"> LoginForm </h2>
        <form action="/login" method="post">
            <div id="login-form">
                <div id="login-item">
                    <label for="id">아이디(이름)</label>
                    <input type="text" id="id" name="username">
                </div>
                <div id="login-item">
                    <label for="pw">비밀번호</label>
                    <input type="password" id="pw" name="pwd">
                </div>
                <br>
                <div id="login-btns">
                    <input type="submit" value="로그인"> 
                    <input type="reset" value="취소"> 
                </div>
            </div>
        </form>
    </div>
</section> 
<footer>

</footer>

</body>
</html>