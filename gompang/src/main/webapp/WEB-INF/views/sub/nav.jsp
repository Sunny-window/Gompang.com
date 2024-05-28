<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav>
    <ul>
        <li><a href="/">
            <div class="just-flex" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon"  src="/images/rocket.png"> 
                <span>상품</span>
            </div>
        </a></li>
        <li><a href="/cart">
            <div class="just-flex" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon" src="/images/shopping_cart.png"> 
                <span>장바구니</span>
            </div>
        </a></li>
        <li><a href="/">
            <div class="just-flex" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon"  src="/images/order.png"> 
                <span>주문내역</span>
            </div>
        </a></li>
        <li><a href="/mypage">
            <div class="just-flex" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                <img id="icon"  src="/images/mypage.png"> 
                <span>My 곰팡</span>
            </div>
        </a></li>
        <c:if test="${role eq 'admin'}" >
            <li><a href="/admin">
                <div class="just-flex" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)" >
                    <img id="icon"  src="/images/manager.png"> 
                    <span>관리자 메뉴</span>
                </div>
            </a></li>
        </c:if>
    </ul>
</nav> 