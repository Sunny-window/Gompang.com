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
            min-width: 300px;
            height: 120px;
        }
        #header{
            display:flex;
            min-width:800px;
            justify-content: space-between;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            border-bottom:1px solid lightgrey;
        }
        #header a{
            font-weight:bolder;
            text-decoration: none;
            color: black;
            margin: 0 25px;
            display: flex;
            justify-content: center;
        }
        #header-logo{
            display:flex;
            align-items: center;
        }
        #header-log-info{
            min-width:260px;
            display:flex;
            justify-content: right;
            align-items: flex-end;
        }
        #header-log-info a{
            font-weight:bold;
            font-size:16px;
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
            background-color: aliceblue;
            height: calc(80vh);
            margin-top: 36px;
            box-shadow: -4px 6px 8px rgba(0, 0, 0, 0.4);
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
            width: calc(100vh - 131px);
            padding: 0 20px;
            box-sizing: border-box;
        }
        ul{
            margin: 10px auto;
            padding: 20px;
        }
        li{
            list-style: none;
        }
        section {
            display:flex;
            min-width:800px;
            max-width:1400px;
            padding-bottom:168px;
            margin:64px auto;
        
        }   
        .zoomed {
            transform: scale(1.2); 
        }
        .nav-li-item{
            margin:12px 0px;
        }
        span#header-title{
            display: flex; 
            align-items: center;
            font-weight: bold;
            font-size: 36px;
        }
    </style>
</head>

<div id="header">
    <a id="header-logo" href="/"><img id="logo-img" src="/images/logo.png"></a>
    <span id="header-title" > 곰 팡 ver 2.0</span>
    <div id="header-log-info">
        <c:if test="${ sessionScope.logged ne null}">
            <c:if test="${role eq 'admin'}">
                <a href="/admin/"> ${sessionScope.logged} 님 </a>
            </c:if>
            <c:if test="${role ne 'admin'}">
                <a href="/members/"> ${sessionScope.logged} 님 </a>
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
