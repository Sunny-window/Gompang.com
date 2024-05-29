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
    }
    #cart-list-item{
        display:flex;
        align-items: center;
        justify-content: space-between;
        text-align:center;
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
            <h2 class="text-center"> 장바구니 </h2>
            <div id="cart-list">
                <div id="cart-list-item">
                    <span class="cart-selector"> <input id="allchk" type="checkbox" /> <label for="allchk" > 전체 선택 </label> </span>
                    <span class="cart-img"> 상품이미지</span>
                    <span class="cart-span"> 상품명</span>
                    <span class="cart-span"> 개당 가격 </span>
                    <span class="cart-amount"> 수량</span>
                    <span class="cart-span"> 총 가격 </span>
                </div>
                <c:forEach var="p" items="${cartList}" varStatus="stat">
                    <div id="cart-list-item">
                        <span class="cart-selector"><input id="chk${stat.count}" type="checkbox" /> <label for="chk${stat.count}" > 선택 </label> </span>
                        <span class="cart-img">  <a class="product-link" href="/members/Detail?pcode=${p.pcode}"> <img src="/images/${p.img}"></a></span>
                        <span class="cart-span"> ${p.pname}</span>
                        <span class="cart-span"> <fmt:formatNumber value="${p.price}" pattern="#,###"/>원</span>
                        <span class="cart-amount"> ${p.amount}</span>
                        <span class="cart-span"> <fmt:formatNumber value="${p.amount*p.price}" pattern="#,###"/>원</span>
                    </div>
                </c:forEach>
            </div>
            <div class="cart-btns">
                <div class="cart-btn"> 선택 주문하기 </div>
                <div class="cart-btn"> 전체 주문하기 </div>
                <div class="cart-btn"> 선택 삭제하기 </div>
                <div class="cart-btn"> 장바구니 비우기 </div>
            <div>
        </div>
</section>

<script>
    function toggleSelectAll() {
        const allChk = document.getElementById('allchk');
        const checkboxes = document.querySelectorAll('#cart-list input[type="checkbox"]:not(#allchk)');
        let allChecked = true;
        
        checkboxes.forEach(checkbox => {
            if (!checkbox.checked) {
                allChecked = false;
            }
        });

        checkboxes.forEach(checkbox => {
            checkbox.checked = !allChecked;
        });

        allChk.checked = !allChecked;
    }

    function updateSelectAll() {
        const allChk = document.getElementById('allchk');
        const checkboxes = document.querySelectorAll('#cart-list input[type="checkbox"]:not(#allchk)');
        let allChecked = true;
        
        checkboxes.forEach(checkbox => {
            if (!checkbox.checked) {
                allChecked = false;
            }
        });

        allChk.checked = allChecked;
    }

    window.onload = function() {
        document.getElementById('allchk').addEventListener('click', toggleSelectAll);

        const checkboxes = document.querySelectorAll('#cart-list input[type="checkbox"]:not(#allchk)');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('click', updateSelectAll);
        });
    }

        function toggleSelectAll() {
        const allChk = document.getElementById('allchk');
        const checkboxes = document.querySelectorAll('#cart-list input[type="checkbox"]:not(#allchk)');
        let allChecked = true;
        
        checkboxes.forEach(checkbox => {
            if (!checkbox.checked) {
                allChecked = false;
            }
        });

        checkboxes.forEach(checkbox => {
            checkbox.checked = !allChecked;
        });

        allChk.checked = !allChecked;
    }

    function updateSelectAll() {
        const allChk = document.getElementById('allchk');
        const checkboxes = document.querySelectorAll('#cart-list input[type="checkbox"]:not(#allchk)');
        let allChecked = true;
        
        checkboxes.forEach(checkbox => {
            if (!checkbox.checked) {
                allChecked = false;
            }
        });

        allChk.checked = allChecked;
    }

    function handleSelectOrder() {
        alert('선택 주문 버튼이 클릭되었습니다.');
    }

    function handleAllOrder() {
        alert('전체 주문 버튼이 클릭되었습니다.');
    }

    function handleSelectDelete() {
        alert('선택 삭제 버튼이 클릭되었습니다.');
    }

    function handleAllDelete() {
        alert('장바구니를 비웁니다.');
        location.href = '/members/CartOverturn';
    }

    window.onload = function() {
        document.getElementById('allchk').addEventListener('click', toggleSelectAll);

        const checkboxes = document.querySelectorAll('#cart-list input[type="checkbox"]:not(#allchk)');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('click', updateSelectAll);
        });

        document.querySelector('.cart-btn:nth-child(1)').addEventListener('click', handleSelectOrder);
        document.querySelector('.cart-btn:nth-child(2)').addEventListener('click', handleAllOrder);
        document.querySelector('.cart-btn:nth-child(3)').addEventListener('click', handleSelectDelete);
        document.querySelector('.cart-btn:nth-child(4)').addEventListener('click', handleAllDelete);
    }
</script>

</body>
</html>