<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="store" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer-STORE-TOP</title>
	<meta charset="utf-8">
	</head>
	<style>
		#bordercategory{
			border: none;
			height : 100px;
			text-align: center;
			font-size : 30px;		
		}
		#borderorder{
			text-align : left;
			font-size : 20px;
		}
		#nowpage{
			text-decoration: underline;
		}
		#nowpage a{
			color : #88c8bc;
		}
		.category{
			width : 300px;
			display: inline-block;	
		}
		.category a{
			color : black;
		}
		.borderdiv{
			border-top : 1px solid grey;
			border-bottom : 1px solid grey;
			padding-bottom : 15px;
		}
		.orderdiv{
			border-top : 1px solid grey;
			border-bottom : 1px solid grey;
		}
		.order{
			width : 100px;
			padding-left : 30px;
			display: inline-block;
		}
		.order a{
			color : black;
		}
		#noworder a{
			color : #88c8bc;
		}
		
	</style>
	<body>	
	<div id="page">
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
						</p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="border" id="bordercategory">
							<div class="borderdiv">
								<div class=category id = nowpage><a href="${pageContext.request.contextPath}/store/selectStoreTop.do">TOP</a></div>
								<div class=category><a href="${pageContext.request.contextPath}/store/selectStorePants.do">PANTS</a></div>
								<div class=category><a href="${pageContext.request.contextPath}/store/selectStoreOuter.do">OUTER</a></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
						<h2>BEST ITEMS</h2>
					</div>
				</div>
				<div class="row row-pb-md">
					<c:forEach items="${list}" var="p" begin="0" end="3"> 
					<div class="col-md-3 col-lg-3 mb-4 text-center p123" id="${ p.BNO }">
						<div class="product-entry border">
						<a href="${pageContext.request.contextPath}/store/storeDetail.do" class="prod-img">
							<img src="${pageContext.request.contextPath}/resources/user/images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
						</a>
						<div class="desc">
							<h2><a href="${pageContext.request.contextPath}/store/storeDetail.do">${p.PNAME}</a></h2>
							<span class="price">${p.PPRICE}</span>
						</div>
					</div>
				</div>
						</c:forEach>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<div class="border" id="borderorder">
						<div class="orderdiv">
							<div class=order id = noworder><a href="${pageContext.request.contextPath}/store/selectStoreTop.do">신상품</a></div>
							<div class=order><a href="${pageContext.request.contextPath}/store/selectStorePants.do">조회순</a></div>
							<div class=order><a href="${pageContext.request.contextPath}/store/selectStoreOuter.do">판매순</a></div>
						</div>
					</div>
				</div>
			</div>
			<br><br><br><br>
			<div class="row row-pb-md">
				<c:forEach items="${list}" var="b"> 
				<div class="col-md-3 col-lg-3 mb-4 text-center p123" id="${ b.BNO }">
					<div class="product-entry border" id="${b.BNO}">
						<img src="${pageContext.request.contextPath}/resources/user/images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
						<div class="desc">
							<h2>${b.PNAME}</h2>
							￦${b.PPRICE}원</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="block-27">
		               <ul>
			              <li><a href="#"><i class="ion-ios-arrow-back"></i></a></li>
		                  <li class="active"><span>1</span></li>
		                  <li><a href="#">2</a></li>
		                  <li><a href="#">3</a></li>
		                  <li><a href="#">4</a></li>
		                  <li><a href="#">5</a></li>
		                  <li><a href="#"><i class="ion-ios-arrow-forward"></i></a></li>
		               </ul>
	            	</div>
	            	<br>
	            	<form action="#">
		            	<div class="btn-group">
		            		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		            			<span id="category-value">상품명</span>
		            		</button>
		           		</div>
		            	<input type="text" style="width : 300px;"/>
		            	<button type="submit" id="submitBtn">검색</button>
	            	</form>
				</div>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
	
	<script>
		$(function(){
			$(".p123").on("click",function(){
				var storeNo = $(this).attr("id");
				console.log("storeNo="+storeNo);
				location.href = "${pageContext.request.contextPath}/store/storeDetail.do?no="+storeNo;
			});
		});
	</script>
	
	</body>
</html>

