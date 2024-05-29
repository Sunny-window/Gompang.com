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
#regProduct-form{
    width:312px;
    margin: 20px auto;
}
#regProduct-form li{
    width: 300px;
}
#regProduct-form li input,textarea {
    width: 100%;
    height: 30px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: bold;
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
        <h1 class="text-center"> 상품 등록 </h1>
        <div id="regProduct-form">
            <form action="/admin/regProduct" method="post" enctype="multipart/form-data">
                <li>상품 이름 : <input type="text" name="pname" /></li><br>
                <li>가격 : <input type="number" name="price" /></li><br>
                <li>수량 : <input type="number" name="stock"/></li> <br>
                <li>이미지 : <input type="file" name="file" /></li><br>
                <li><label for="descript"> 설명 : </label> 
                <textarea id="descript" name="descript" > </textarea> </li><br>
                <li><input type="submit" value="상품 등록" /></li>
            </form>
        </div>
    </div>
</section> 
<footer>

</footer>

</body>
</html>