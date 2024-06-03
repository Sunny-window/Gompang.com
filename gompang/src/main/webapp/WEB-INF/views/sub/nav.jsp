<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav>
    <ul>
        <li><a href="/">
            <div class="just-flex nav-li-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon"  src="/images/rocket.png"> 
                <span>상품</span>
            </div>
        </a></li>
        <li><a href="/members/cart">
            <div class="just-flex nav-li-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon" src="/images/shopping_cart.png"> 
                <span>장바구니</span>
            </div>
        </a></li>
        <li><a href="/members/offerList">
            <div class="just-flex nav-li-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon"  src="/images/order.png"> 
                <span>주문내역</span>
            </div>
        </a></li>
        <li><a href="/members/">
            <div class="just-flex nav-li-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon"  src="/images/mypage.png"> 
                <span>My 곰팡</span>
            </div>
        </a></li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="/admin/">
                <div class="just-flex nav-li-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                    <img id="icon" src="/images/manager.png">
                    <span>관리자 메뉴</span>
                </div>
            </a></li>
        </sec:authorize>
    </ul>
</nav> 