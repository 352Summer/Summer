<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - MyPage</title>
	<meta charset="utf-8">
    <style>
    	#menu-box {
    		height : 200px;
    		display : flex;
    		align-items : center;
    	}
    	
    	#memberBox {
    		height : 100%;
    		display : flex;
    		align-items : center;
    		text-align : center;
    	}
    	
    	#memberBox a:hover {
    		color : #88c8bc;
    		transition : 0.5s;
    	}
    	
    	#box1>div {
    		display : flex;
    		align-items : center;
    		text-align : center;
    		font-size : 17px;
    		font-weight : bold;
    		color : gray;
    	}
    	
    	#box1>div:hover {
    		background : #88c8bc;
    		color : white;
    		transition : 0.5s;
    		cursor : pointer;
    	}
    	
    	#em {
    		height : 150px;
    		font-size : 20px;
    		padding-top : 60px;
    	}
    
    </style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col ">
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>MyPage</span></p>
					</div>
				</div>
				<h1>MyPage</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="container">
		
<!-- 마이페이지 상단 메뉴바 시작 -->
			<div class="row">
				<div class="col">
					<div class="col-md-12" id="menu-box">
						<div class="col-md-4 border" id="memberBox">
							<div>
								<p style="font-weight:bold; font-size:24px; margin-left:10px;">${ member.userName }님 환영합니다!</p>
								<span><a href="#">> 회원 정보 수정</a></span>
							</div>
						</div>
						<div class="col-8">
							<div class="row" id="box1" style="height:100px;">
								<div class="col-md-3 border" style="background:#88c8bc; color:white;">
									장바구니
								</div>
								<div class="col-md-3 border">
									구매내역
								</div>
								<div class="col-md-3 border">
									구매후기
								</div>
								<div class="col-md-3 border">
									배송조회
								</div>
							</div>
							<div class="row" id="box1" style="height:100px;">
								<div class="col-md-3 border">
									마이사이즈
								</div>
								<div class="col-md-3 border">
									좋아요목록
								</div>
								<div class="col-md-3 border">
									포인트내역
								</div>
								<div class="col-md-3 border">
									문의내역
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 마이페이지 상단 메뉴바 끝 -->
			<br><br><br><br>
<!-- 마이페이지 장바구니 시작 -->
			<h2 style="text-align:center;">장바구니</h2>
			<div class="row row-pb-lg">
				<div class="col-md-10 offset-md-1">
					<div class="process-wrap">
						<div class="process text-center active">
							<p><span>01</span></p>
							<h3>Shopping Cart</h3>
						</div>
						<div class="process text-center">
							<p><span>02</span></p>
							<h3>Checkout</h3>
						</div>
						<div class="process text-center">
							<p><span>03</span></p>
							<h3>Order Complete</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">
							<div class="one-forth text-center">
								<span>상품 정보</span>
							</div>
							<div class="one-eight text-center">
								<span>가격</span>
							</div>
							<div class="one-eight text-center">
								<span>수량</span>
							</div>
							<div class="one-eight text-center">
								<span>총 금액</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>삭제</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${ empty c }">
								<div class="product-cart d-flex">
									<div class="col text-center" id="em">
										장바구니가 비었습니다.
									</div>
								</div>
							</c:when>
							<c:when test="${ !empty c }">
								<c:forEach items="${ c }" var="c">
									<div class="product-cart d-flex">
										<div class="one-forth">
											<div class="product-img" style="background-image: url(${ c.FILEPATH }${ c.NEWFILENAME });">
											</div>
											<div class="display-tc">
												<h3>${ c.PNAME }</h3>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span class="price">${ c.PPRICE }</span>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span>${ c.AMOUNT }</span>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<span class="price">${ c.PPRICE * c.AMOUNT }</span>
											</div>
										</div>
										<div class="one-eight text-center">
											<div class="display-tc">
												<a href="#" class="closed"></a>
											</div>
										</div>
									</div>
								</c:forEach>
							
							</c:when>
						</c:choose>
						
					</div>
					<div class="col" style="text-align:center;">
						<button type="button" class="btn btn-primary thema">결제페이지로 이동</button>
					</div>
				</div>
<!-- 마이페이지 장바구니 끝 -->
			
		</div>

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	</body>
</html>

