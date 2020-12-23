<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyStore</title>
</head>
<style>
	.product-wrap{
	width : 100%;
	}
	.product-title{
		color : black;
		font-weight: bold;
	}
	.product-contents{
	}
	#tbl-product{
		width : 100%;
		text-align : center;
		border: 1px solid grey;
	}
	
	#product-top{
		background : #88c8bc;
		border-bottom : 2px solid grey;
		height : 50px;
	}
	#product-top th{
		border: 1px solid grey;
	}
	#product-bottom, #product-bottom td{
		border : 1px solid grey;
	}
	.product-1{width : 40%;}
	.product-2{width : 12%;}
	.product-3{width : 12%;}
	.product-4{width : 12%;}
	.product-5{width : 12%;}
	.product-6{width : 12%;}
	.productInfo-img{
		width : 130px;
		height : 130px;
		margin-left : auto;
		margin-right : auto;
		
	}
	.productInfo-contents{
		width : 310px;
		height : 130px;
		margin-right : 20px;
		
	
	}
	.product-img{
		margin-top : 15px;
		margin-left : 5px;
		width : 100%;
		height : 100%;
	}

	.productInfo-wrap div{
		display : inline-block;
	}
	#productInfo-wrap{
		width : 460px;
		height : 160px;
		margin-left : auto;
		margin-right : auto;
		
	}
	.t {
		margin-top : 10px;
		width : 300px;
		height : 130px;	
		
	}
	.t tr, .t th{
		font-size : 20px;
		padding : 5px;
	}
	.br{
	padding-top : 30px;
	}
	.recipient-wrap{
		
		margin-left : -15px;
		width : 100%;
	}
	.about-wrap{
		border : 1px solid black;
		margin-left : 15px;
		width : 100%;
	}
	.recipientInfo{
		font-weight : bold;
		color : black;
	}
	.recipient-title{
		font-weight : bold;
		text-align : center;
		background : #88c8bc;
		border : 1px solid grey;
	}
	.recipient-conttents{
		border : 1px solid grey;
	}
	.phone{
		width : 80px;
	}
	.center{
	text-align : center;
	}
</style>
<body>
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread">
							<span><a href="${pageContext.request.contextPath}">Home</a></span> 
							/ <span><a href="${pageContext.request.contextPath}/store/selectStoreMain.do">Store</a></span> 
							/ <span>TOP</span>
							/ <span>Buy</span>
						</p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
				<!-- 페이지 정보 -->
				<div class="container">
					<div class="row">
						<!-- 상품 정보 -->
						<div class="product-wrap">
							<div class="product-title">ProductInfo</div>
								<div class="product-contents">
									<table id="tbl-product">
										<tr id="product-top">
											<th class="product-1">상품 정보</th>
											<th class="product-2">사이즈</th>
											<th class="product-3">수량</th>
											<th class="product-4">적립 포인트</th>
											<th class="product-5">배송비</th>
											<th class="product-6">주문 금액</th>
										</tr>
										<tr id="product-bottom">
											<td>
												<div class = "row" id="productInfo-wrap">
													<div class="productInfo-img">
														<img src="${pageContext.request.contextPath}/resources/user/images/item-1.jpg" class="product-img" alt="product-img">
													</div>
													<div class="productInfo-contents">
														<table class="t">
															<tr>
																<th>상품명</th>
																<th>겨울용 여성 털부츠</th>
															</tr>
															<tr>
																<th>색상</th>
																<th>갈색</th>
															</tr>
																							
														</table>
													</div>
												</div>
											</td>
											<td>S</td>
											<td>1개</td>
											<td>1090</td>
											<td>무료</td>
											<td>109,000원</td>
										</tr>
										<c:forEach items="${list}" var="b"> 
										<tr id="product-bottom">
											<td>${b.boardNo}</td>
											<td>${b.boardTitle}</td>
											<td>${b.boardWriter}</td>
											<td>${b.boardReadCount }</td>
											<td>${b.boardReadCount }</td>
										</tr>
										</c:forEach>
										
									</table>
								</div>
						</div>
					</div>
				</div>
		<div class="br">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-sm-6 mb-3">
						<!-- 수령자 정보 -->
						<div class="recipient-wrap">
							<div class="recipientInfo">
								RecipientInfo
							</div>
							<div class="recipient-title">
								수령자 정보
							</div>
							<div class="recipient-conttents">
								 <!--테이블 시작 -->
						         <table width="600px" class="recipient-table">
						         <tr>
							         <th>배송지 선택</th>
							         <td class="s">
							            <input type="radio" name="destination" checked> 회원 배송지
							            <input type="radio" name="newdestination" value="4"> 신규 배송지 
							         </td>
							      </tr>
						         <tr>
						           <th>수령인</th>
						           <td><input type="text" name="username" placeholder="수령인을 입력해주세요"></td>
						         </tr>
						         <tr>
							         <th>연락처</th>
							         <td><input type="text" name="phone1" placeholder="010" class="phone"> - 
							            <input type="text" name="phone2" class="phone"> -
							            <input type="text" name="phone3" class="phone">
							         </td>
							     </tr>
							     <tr>
						            <th>주소</th>
						            <td>
						               <input type="text" name="zip_h_1"> 
						               <button onclick="location.href='#'" class="btn btn-primary thema" id="shopping-basket">주소찾기</button><br>
						               <input type="text" name="addr_h1"><br>
						               <input type="text" name="addr_h1">
						            </td>
						         </tr>
						  		</table>
						   <!--테이블 끝-->
						   </div>
						</div>
					</div>
					<div class="col-sm-6">
						<!-- 수령자 정보 -->
						<div class="recipient-wrap">
							<div class="recipientInfo">
								BuyerInfo
							</div>
							<div class="recipient-title">
								구매자 정보
							</div>
							<div class="recipient-conttents">
							<!--테이블 시작 -->
						         <table width="600px" class="recipient-table">		
						         <tr>
						           <th>회원명</th>
						           <td><input type="text" name="username" value="홍길동"></td>
						         </tr>
						         <tr>
							         <th>연락처</th>
							         <td><input type="text" name="phone1" placeholder="010" class="phone"> - 
							            <input type="text" name="phone2" class="phone"> -
							            <input type="text" name="phone3" class="phone">
							         </td>
							     </tr>
							     <tr>
						            <th>이메일 주소</th>
						            <td>
						               <input type="text" name="email1"> @
            						   <input type="text" name="email2">
						            </td>
						         </tr>
						  		</table>
						   <!--테이블 끝-->
						   </div>
						</div>
					</div>
				</div>
				<div class="center">
					<button onclick="location.href='#'" class="btn btn-primary thema" id="shopping-basket">결제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="location.href='#'" class="btn btn-primary thema" id="shopping-basket">취소하기</button>
				</div>
			</div>
		</div>
			</div>
		</div>
         <c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	

    
</body>
</html>