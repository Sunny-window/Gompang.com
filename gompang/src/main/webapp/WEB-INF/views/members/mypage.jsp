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
#menu-item >*{
    display:flex;
    width:30%;
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
    margin-top:20px;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
        <div id="menu-form">
            <div id="menu-item">
                <a href="">내 정보 관리</a>
            </div>
            <div id="menu-item">
                <a href="">비밀번호</a>
            </div>
            <br>
        </div>
</section> 
<footer>

</footer>

</body>
</html>