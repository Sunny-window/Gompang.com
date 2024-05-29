<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
.detail-form{
    margin-top:36px;
    margin-left:36px;
    display:flex;
}
.detail-info{
    display:flex;
    flex-direction: column;
    margin-left: 30px;
}
.detail-info >*{
    margin:16px 0 0 0;
    min-width:400px; 
}
#detail-img{
    width:450px;
    max-height:450px;
}
#detail-name{
    font-size:32px;
    font-weight:bold;
}
#detail-price{
    font-size:20px;
}
pre#detail-descript{
    font-size:16px;
    width:100%;
    min-height:120px;
}
#text-right{
    text-align:right;
    font-size:16px;
}
.text-red{
    color:red;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <%@ include file="../sub/nav.jsp" %>
    <div class="main-container">
        <h1 class="text-center"> 상품 디테일 </h1>
        <div class="detail-form">
            <img id="detail-img" src="/images/${p.img}" alt="${p.pname}">
            <div class="detail-info">
                <span id="detail-name">${p.pname}</span>
                <span id="detail-price"><fmt:formatNumber value="${p.price}" pattern="#,###"/>원</span>
                <pre id="detail-descript">${p.descript}</pre>
                <c:choose>
                    <c:when test="${p.stock < 11 && p.stock > 0 }">
                        <span class="text-red" id="text-right" >[품절임박] 재고 ${p.stock} 남음!</span>
                    </c:when>
                    <c:when test="${p.stock == 0 }">
                        <span class="text-red" id="text-right" >[품절] 입고 예정</span>
                    </c:when>
                    <c:when test="${p.stock >= 11}">
                        <span id="text-right" > [ 재고 : 여유] </span>
                    </c:when>
                </c:choose>
                <br>
                <li>
                    수량 : <input type="number" id="amount"name="amount" value="">
                    <div class="div-btn" id="submit-basket">
                        장바구니에 담기
                    </div>
                    <div class="div-btn" id="submit-offer">
                        주문하기
                    </div>
                </li>
            </div>
        </div>
    </div>
</section> 
<script>
document.getElementById("submit-basket").addEventListener('click', ()=>{
    const amount = document.getElementById("amount").value;
    
    if(amount <= 0){
        alert('수량을 확인해주세요');
        return;
    }
    if(amount > Number('${p.stock}')){
        alert('재고가 부족합니다. 재고 : ' + '${p.stock}');
        return;
    }
    location.href='/members/inputBasket?pcode=${p.pcode}&amount='+amount;

    console.log('pcode : '+'${p.pcode}');
    console.log('수량 : '+ amount);
})
document.getElementById("submit-offer").addEventListener('click', ()=>{
    const pcode = document.getElementById("pcode").value;
    console.log(pcode);
})
</script>

</body>
</html>