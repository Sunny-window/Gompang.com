<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
section{
    width:1000px;
    margin:0 auto;
    padding: 0 50px;
    height:calc(100vh - 90px);
}
#login-item >*{
    display:flex;
    width:30%;
}
#login-btns >*{
    margin: 0 auto;
}
#login-btns{
    width: 30%;
    display: flex;
    flex-direction:row;
}
</style>
</head>
<body>
<header>
    <%@ include file="sub/header.jsp" %>
</header>
<section>
    <h2> LoginForm </h2>
    <form action="/login" method="post">
        <div id="login-form">
            <div id="login-item">
                <label for="id">아이디(이름)</label>
                <input type="text" id="id" name="membername">
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
</section> 
<footer>

</footer>

</body>
</html>