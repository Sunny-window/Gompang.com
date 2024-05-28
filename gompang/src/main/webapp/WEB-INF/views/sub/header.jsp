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
        .header{
            height: 90px;
        }
        .header h1{
            text-align: center;
            font-size: 36px;
            background-color: #d44548;
            margin: 0;
            padding: 6px;
        }
        #a-header {
            text-decoration: none;
            color: white;
        }
        #header-info{
            display:flex;
            justify-content: right;
            border-bottom:1px solid #d44548;
        }
        #header-info a{
            font-size:1.10rem;
            font-weight:bold;
            text-decoration: none;
            color: #d44548;
            margin: 0 25px;
        }
        ul{
            list-style: none;
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
        }
        ul{
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>

<div class="header">
    <h1> <a id="a-header" href="/"> 쿠팡 대신 곰팡 </a> </h1>
    <div id="header-info">
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
