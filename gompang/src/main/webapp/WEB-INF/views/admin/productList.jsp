<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<style>
    .grid-container {
        display: flex;
        background-color: white;
        flex-direction: column;
        gap: 10px;
    }
    .grid-item {
        margin: 5px auto 15px auto;
        padding: 10px 0 0 0;
        transition: box-shadow 0.3s ease;
    }
    .grid-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    }
    .grid-item:hover #product-name {
        color: #d44;
        text-decoration: underline;
    }
    .product-link {
        color: black;
        text-decoration: none;
    }
    pre{
        font-size:0.8rem;
        margin:0;
        overflow:hidden;
        text-overflow: ellipsis;
        min-height:36px;
        max-height:40px;
    }
    .p-list-row{
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
</style>
</head>
<body>
    <%@ include file="../sub/header.jsp"%>
    <section>
        <%@ include file="../sub/nav.jsp"%>
        <div class="main-container">
            <h1 class="text-center"> 관리자 전용 상품 리스트 </h1>
            <div class="grid-container">
                <div class="grid-item-head">
                    <div class="p-list-row">
                        <li id="product-name"> 제품명 </li>
                        <li> 제품 가격 </li>
                        <li id="grid-descript"> 제품 재고량 </li>
                        <li> 삭제 </li>
                    </div>
                </div>
                <c:forEach var="p" items="${pList}" varStatus="stat"> 
                    <a class="product-link" href="/members/Detail?pcode=${p.pcode}">
                        <div class="grid-item">
                            <div class="p-list-row">
                                <li id="product-name">${p.pname}</li>
                                <li><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</li>
                                <li id="grid-descript"><input type="number" name="stock" value="${p.stock}" onChange="test()" onClick="stopPropagation()"/> </li>
                                <li id="grid-descript">${p.stock}</li>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </section>
</body>

<script>
function test(){
    console.log("change!!");
}
function stopPropagation(event) {
    event.stopPropagation();
}
</script>
</html>
