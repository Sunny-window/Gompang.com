<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    #cart-list{
        display:flex;
        flex-direction:column;
        min-height:600px;
    }
    #cart-list-item{
        display:flex;
        align-items: center;
        justify-content: space-between;
        text-align:center;
        padding:12px 0;
        border-bottom:1px solid darkgrey;
    }
    .cart-img{
        width:260px;
    }
    .cart-img img{
        max-width: 260px;
    }
    .cart-span{
        width: calc((100% - 390px)/3);
    }
    .cart-amount{
        width: 40px;
    }
    .product-link {
        color: black;
        text-decoration: none;
    }
    .cart-btns{
        display:flex;
        align-items: center;
        justify-content: flex-end;
        padding-right: 24px;
        height: 64px;
        text-align:center
    }
    .cart-btn{
        color: black;
        font-weight: bold;
        text-decoration: none;
        padding: 4px;
        margin:0 24px;
        box-sizing:border-box;
        border:1px solid black;
    }
    .cart-selector{
        width: 88px;
    }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <%@ include file="../sub/nav.jsp"%>
        <div class="main-container">
            <h1 class="text-center"> 주문내역 </h1>
            <div id="cart-list">
                <div id="cart-list-item">
                    <span class="cart-img"> 상품이미지</span>
                    <span class="cart-span"> 상품명</span>
                    <span class="cart-span"> 개당 가격 </span>
                    <span class="cart-amount"> 수량</span>
                    <span class="cart-span"> 총 가격 </span>
                </div>
                <c:forEach var="o" items="${offerList}">
                    <div id="cart-list-item">
                        <span class="cart-img">  <a class="product-link" href="/members/Detail?pcode=${o.pcode}"> <img src="/images/${o.img}"></a></span>
                        <span class="cart-span"> ${o.pname}</span>
                        <span class="cart-span"> <fmt:formatNumber value="${o.price}" pattern="#,###"/>원</span>
                        <span class="cart-amount"> ${o.amount}</span>
                        <span class="cart-span"> <fmt:formatNumber value="${o.amount*o.price}" pattern="#,###"/>원</span>
                    </div>
                </c:forEach>
            </div>
        </div>
</section>


</body>
</html>