<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("UTF-8");
// post 방식으로 parameter 받을 때 한글을 인코딩하기 위해 
int[] items = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
int[] prices = {18000,12500,15000,4300,5900,8700,9900,13800,22000,18900,9000,17900,728640,1260000,1579700};
pageContext.setAttribute("griditem",items);
pageContext.setAttribute("price",prices);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<!-- 폰트 첨부 -->
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/session.css">
<style>
    .grid-container {
        display: grid;
        background-color: white;
        gap: 10px;
    }
    .grid-item {
        padding: 20px;
        width: 240px;
        height: 280px;
        transition: box-shadow 0.3s ease;
    }
    .grid-item img {
        display: block;
        margin: 0 auto;
        width: 150px;
        height: 150px;
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
    nav {
            width: 130px;
            background-color: whitesmoke;
            height: calc(80vh);
            border:1px solid #d44548;
            margin-top: 70px;
        }
        nav li {
            margin-bottom: 10px;
        }
        nav a {
            color: #d44548;
            text-decoration: none;
            margin-bottom:10px;
        }
        section {
            display:flex;
        }
        .main-container{
            flex-grow: 1;
            width: calc(100% - 130px);
        }
</style>
</head>
<body>
    <%@ include file="sub/header.jsp"%>
    <section>
        <nav>
            <ul>
                <li><a href="#">상품 리스트</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">주문내역</a></li>
            </ul>
        </nav>  
        <div class="main-container">
            <h1 class="text-center"> 상품 리스트 </h1>
            <div class="grid-container">
                <c:forEach var="i" begin="0" end="14"> 
                    <a class="product-link" href="/indexDetail.jsp?pid=${pageScope.griditem[i]}">
                        <div class="grid-item">
                            <ul>
                                <li><img id="pImg" src="/images/m${pageScope.griditem[i]}.jpg" alt="${pageScope.griditem[i]}"></li>
                                <li id="product-name">제품명</li>
                                <li><fmt:formatNumber value="${price[i]}" pattern="#,###"/>원</li>
                                <li>제품 설명 or 기타정보</li>
                                <li align="center">★★★★☆</li>
                            </ul>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </section>
<script>
    function adjustGridColumns() {
        const gridContainer = document.querySelector('.grid-container');
        const mainContainer = document.querySelector('.main-container');
        const gridWidth = mainContainer.offsetWidth;
        const itemWidth = 240; // 그리드 아이템의 너비

        let numColumns;
        if (gridWidth >= 1520) {
            numColumns = 5;
        } else if (gridWidth >= 1180) {
            numColumns = 4;
        } else {
            numColumns = 3;
        }

        // 클래스를 토글하여 그리드 열의 수를 조정
        if (numColumns === 3) {
            gridContainer.classList.remove('grid-4-columns', 'grid-5-columns');
            gridContainer.classList.add('grid-3-columns');
        } else if (numColumns === 4) {
            gridContainer.classList.remove('grid-3-columns', 'grid-5-columns');
            gridContainer.classList.add('grid-4-columns');
        } else {
            gridContainer.classList.remove('grid-3-columns', 'grid-4-columns');
            gridContainer.classList.add('grid-5-columns');
        }
    }

    window.addEventListener('resize', adjustGridColumns);
    window.addEventListener('DOMContentLoaded', adjustGridColumns); // 페이지 로드시 열의 갯수를 조정
</script>
</body>
</html>
