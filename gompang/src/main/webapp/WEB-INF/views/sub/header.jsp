<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- 폰트 첨부 -->
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <style>
        html {
            margin:0;
            min-height:99.99%;
        }
        body {
            font-family: "Gowun Dodum", sans-serif;
            box-sizing: border-box;
            margin:0;
        }
        #logo-img{
            width: 240px;
            height: 150px;
        }
        #header{
            display:flex;
            justify-content: right;
            border-bottom:1px solid #d44548;
            justify-content: space-between;
        }
        #header a{
            font-weight:bold;
            text-decoration: none;
            color: #d44548;
            margin: 0 25px;
        }
        #header-logo{
            display:flex;
            align-items: center;
        }
        #header >span{
            width:260px;
            font-size:32px;
            align-items: center;
            display: flex;
            justify-content: center;
            color: #d44548;
            font-weight:bold;
        }
        #header-log-info{
            width:260px;
            display:flex;
            align-items: center;
        }
        #header-log-info a{
            font-weight:bold;
            font-size:24px;
        }
        .text-center{
            text-align: center;
        }
        .just-flex{
            display:flex;
            flex-direction: column;
            align-items: center;
        }
        img#icon{
            width: 50px;
            height: 50px;
            cursor: pointer;
            margin-bottom: 6px;
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
            color: black;
            font-weight: bold;
            text-decoration: none;
            margin-bottom:10px;
        }
        .main-container{
            flex-grow: 1;
            width: calc(100% - 130px);
            padding:20px;
        }
        ul{
            margin: 0 auto;
            padding: 20px;
            list-style: none;
        }
        section {
            display:flex;
        }   
        .zoomed {
            transform: scale(1.2); 
        }
    </style>
</head>

<div id="header">
    <span id=""> 쿠* 대신 곰팡 </span>
    <a id="header-logo" href="/"><img id="logo-img" src="/images/logo.png"></a>
    <div id="header-log-info">
        <c:if test="${ sessionScope.logged ne null}">
            <c:if test="${role eq 'admin'}">
                <a href="/admin"> ${sessionScope.logged} 님 </a>
            </c:if>
            <c:if test="${role ne 'admin'}">
                <a href="/mypage"> ${sessionScope.logged} 님 </a>
            </c:if>
            <a href="/logout"> 로그아웃 </a>
        </c:if>
        <c:if test="${sessionScope.logged eq null}">
            <a href="/loginForm"> Login </a>
            <a href="/registForm"> 회원가입 </a>
        </c:if>
    </div>
</div>

<script>
    function zoomIn(element) {
        element.children[0].classList.add("zoomed"); // 이미지를 확대하기 위해 'zoomed' 클래스를 추가합니다.
    }

    function zoomOut(element) {
        element.children[0].classList.remove("zoomed"); // 이미지를 축소하기 위해 'zoomed' 클래스를 제거합니다.
    }
</script>
