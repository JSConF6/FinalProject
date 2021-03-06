<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주말 장터 메인</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jjs/productDetailView.js"></script>

<style>
h5 {
	padding-top: 10px;
	font-weight:medium;
}

.container .nav {
	margin-top: 80px;
	font-size: 20px;
}

div.goods {
	margin:auto;
	margin-bottom:40px;
	width:80%
}

 div.goods div.goodsImg { float:left; width:350px; }
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:450px; font-size:20px;}
 div.goods div.goodsInfo p { margin:0 0 10px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-left:10%; margin-right:15px; padding-top:10px;}
 
 div.goods div.goodsInfo p.cartStock input { font-size:20px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; padding-bottom:40px;}


</style>
</head>
<body>
	<jsp:include page="../../main/header.jsp" />
	<jsp:include page="shop_nav.jsp" />
		<div class="section1 mt-3" style="width:80%; margin:auto;" >
			<span>제품 상세 > ${p.product_name}</span> 
		</div>
		<br><br>
		
			
		<input type="hidden" class="code" value="${p.product_code}" />
		<input type="hidden" class="id" value="${id}" />
	
		<div class="goods">
			<div class="goodsImg">
				<img src="${pageContext.request.contextPath}/upload${p.product_img}">
			</div>
	
		<div class="container goodsInfo p-3 border">
			<div class="goodsInfo">
			
				<p class="gdsName">
					<span>상품명  </span>${p.product_name}</p>
	
				<p class="cateName">
					<span>카테고리  </span>${p.category_name}</p>
	
				<p class="gdsPrice">
					<span>가격 </span>
					<fmt:formatNumber pattern="###,###,###" value="${p.product_price}" />
					원
				</p>
	
				<p class="cartStock">
				 <span>구입 수량</span>
				 <button type="button" class="plus">+</button>
				 <input type="number" class="numBox" min="1" max="100" value="1" readonly="readonly"/>
				 <button type="button" class="minus">-</button>
				 
				 <script>
				  $(".plus").click(function(){
				   var num = $(".numBox").val();
				   var plusNum = Number(num) + 1;
				   
				   if(plusNum >= 100) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(plusNum);          
				   }
				  });
				  
				  $(".minus").click(function(){
				   var num = $(".numBox").val();
				   var minusNum = Number(num) - 1;
				   
				   if(minusNum <= 0) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(minusNum);          
				   }
				  });
				 </script>
				 
				</p>
				
				<br>
				<p class="addToCart" style="padding-right:70%">
					<button type="button" class="btn btn-warning" id="cartbtn">카트에 담기</button>
				</p>
			</div>
		</div>
		
		<div class="gdsDes">상품설명 : ${p.product_detail}</div>
		</div>
	</script>	
	<jsp:include page="shopModal.jsp" />
	<jsp:include page="../../main/footer.jsp" />
</body>
</html>
