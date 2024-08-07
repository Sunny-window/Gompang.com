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
        display: grid;
        background-color: white;
        gap: 10px;
    }
    .grid-item {
        margin: 5px auto 15px auto;
        padding: 10px 0 0 0;
        width: 200px;
        height: 280px;
        transition: box-shadow 0.4s ease;
    }
    .grid-item img {
        display: block;
        width: 150px;
        height: 150px;
        transition: transform 0.4s ease;
        overflow:hidden;
    }
    .grid-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    }
    .grid-item:hover #product-name {
        color: #d44;
        text-decoration: underline;
    }
    .grid-3-columns {
        grid-template-columns: repeat(3, 1fr);
    }
    .grid-4-columns {
        grid-template-columns: repeat(4, 1fr);
    }
    .grid-5-columns {
        grid-template-columns: repeat(5, 1fr);
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
</style>
</head>
<body>
    <%@ include file="sub/header.jsp"%>
    <section>
        <%@ include file="sub/nav.jsp"%>
        <div class="main-container">
            <h1 class="text-center"> 인기 상품 Top 4 </h1>
            <div class="grid-container">
                <c:forEach var="p" items="${hotList}" varStatus="stat"> 
                    <a class="product-link" href="/members/Detail?pcode=${p.pcode}">
                        <div class="grid-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)">
                            <ul>
                                <img id="pImg" src="/images/${p.img}" alt="${p.pname}">
                                <li id="product-name">${p.pname}</li>
                                <li><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</li>
                                <li id="grid-descript"><pre>${p.descript}</pre></li>
                            </ul>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <h1 class="text-center"> 상품 리스트 (최신순) </h1>
            <div class="grid-container">
                <c:forEach var="p" items="${pList}" varStatus="stat"> 
                    <a class="product-link" href="/members/Detail?pcode=${p.pcode}">
                        <div class="grid-item" onmouseover="zoomIn(this)" onmouseout="zoomOut(this)">
                            <ul>
                                <img id="pImg" src="/images/${p.img}" alt="${p.pname}">
                                <li id="product-name">${p.pname}</li>
                                <li><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</li>
                                <li id="grid-descript"><pre>${p.descript}</pre></li>
                            </ul>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </section>
</body>

<script>
    function adjustGridColumns() {
        const gridContainers = document.querySelectorAll('.grid-container');
        const mainContainer = document.querySelector('section');
        const gridWidth = mainContainer.offsetWidth;

        let numColumns;
        if (gridWidth >= 1200) {
            numColumns = 5;
        } else if (gridWidth >= 990) {
            numColumns = 4;
        } else {
            numColumns = 3;
        }

        // 클래스를 토글하여 그리드 열의 수를 조정
        if (numColumns === 3) {
            gridContainers[0].classList.remove('grid-4-columns', 'grid-5-columns');
            gridContainers[1].classList.remove('grid-4-columns', 'grid-5-columns');
            gridContainers[0].classList.add('grid-3-columns');
            gridContainers[1].classList.add('grid-3-columns');
            
        } else if (numColumns === 4) {
            gridContainers[0].classList.remove('grid-3-columns', 'grid-5-columns');
            gridContainers[1].classList.remove('grid-3-columns', 'grid-5-columns');
            gridContainers[0].classList.add('grid-4-columns');
            gridContainers[1].classList.add('grid-4-columns');
        } else {
            gridContainers[0].classList.remove('grid-3-columns', 'grid-4-columns');
            gridContainers[1].classList.remove('grid-3-columns', 'grid-4-columns');
            gridContainers[0].classList.add('grid-5-columns');
            gridContainers[1].classList.add('grid-5-columns');
        }
    }

    window.addEventListener('resize', adjustGridColumns);
    window.addEventListener('DOMContentLoaded', adjustGridColumns); // 페이지 로드시 열의 갯수를 조정
</script>
</html>
