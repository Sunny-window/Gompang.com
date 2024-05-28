<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
.detail-form{
    margin-top:36px;
    display:flex;
}
.detail-info{
    display:flex;
    flex-direction: column;
    margin-left: 30px;
}
.detail-info >*{
    margin:16px 0 0 0;
    min-width:400px; 
}
#detail-img{
    width:450px;
    height:450px;
}
#detail-name{
    font-size:32px;
    font-weight:bold;
}
#detail-price{
    font-size:20px;
}
pre{
    font-size:16px;
}
#text-right{
    text-align:right;
    font-size:16px;
}
.text-red{
    color:red;
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
        <h1 class="text-center"> 상품 디테일 </h1>
        <div class="detail-form">
            <img id="detail-img" src="/images/${p.img}" alt="${p.pname}">
            <div class="detail-info">
                <span id="detail-name">${p.pname}</span>
                <span id="detail-price"><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</span>
                <pre>${p.descript}</pre>
                <c:choose>
                    <c:when test="${p.stock < 11 && p.stock > 0 }">
                        <span class="text-red" id="text-right" >[품절임박] 재고 ${p.stock} 남음!</span>
                    </c:when>
                    <c:when test="${p.stock == 0 }">
                        <span class="text-red" id="text-right" >[품절] 입고 예정</span>
                    </c:when>
                    <c:when test="${p.stock >= 11}">
                        <span id="text-right" > [ 재고 : 여유] </span>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</section> 
<footer>

</footer>

</body>
</html>