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
#regist-item >*{
    display:flex;
    width:30%;
}
#regist-btns >*{
    margin: 0 auto;
}
#regist-btns{
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
    <h2> 회원 등록 </h2>
    <form action="/regist" method="post">
        <div id="regist-form">
            <div id="regist-item">
                <label for="id">아이디(이름)</label>
                <input type="text" id="id" name="membername">
            </div>
            <div id="regist-item">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pwd">
            </div>
            <br>
            <div id="regist-btns">
                <input type="submit" value="등록"> 
                <input type="reset" value="취소"> 
            </div>
        </div>
    </form>
</section> 
<footer>

</footer>

</body>
</html>