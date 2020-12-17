<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
	<head>
	<title>storeDetail</title>
   <meta charset="utf-8">
	</head>
	<style>
		.title-wrap{
			
			height : 60px;
			font-size : 30px;
			padding-rigth : -20px;
			border-bottom : 2px solid black;
			
		}
		.title{
		display: inline-block;
		}
		.size{
		display: inline-block;
		}
		#title{
		font-weight: bold;
		width : 325px;
		}
		#like-box {
    		font-weight : bold;
    		padding-left : 28px;
    		font-size : 20px;
    		width : 150px
    	}
    	
    	#like-box>div {
    		margin-left : 10px;
    		padding : 0px 10px 0px 10px;
    		border : 1px solid #E2E2E2;
    		display : inline-block;
    		margin : 10px;
    	}
    	
    	#like-box>div:hover {
    		background : #E2E2E2;
    		border : 1px solid black;
    		cursor : pointer;
    		transition : 0.5s;
    	}
    	.contents{
    		border-bottom : 1px solid grey;
    		color : grey;
    		height : 50px;
    		padding-top : 10px;
    	}
    	.information{
    		border-bottom : 1px solid grey;
    		height : 150px;
    		padding-top : 20px;
    	}
    	.information tr, .information th {
    		
    		padding-right : 60px;
    		padding-bottom : 10px;
  		}
  		.price table{
  			margin-top : 10px;
  			border-top: 3px solid grey;
    		
  		}
  		.price-tr-1{
  			background-color : #e9e9e9;
  		}
  		.price tr, .price th {
  			width : 484px;
    		border-bottom: 1px solid grey;
    		text-align : center;
  		}
  		.size-wrap{
    		border-bottom : 1px solid grey;
    		height : 180px;
    		padding-top : 10px;
    		font-weight : bold;
    		padding-left : 10px;
    	}
    	.totalprice-wrap{
			height : 65px;
			width : 484px;
			padding-top : 10px;
			padding-left : 10px;
			border-top : 2px solid grey;
			border-bottom : 3px solid grey;
			font-weight : bold;
		}
		.totalprice{
			display: inline-block;
		}
		#totalprice-title{
		
			width : 350px;
			font-size : 20px;
		}
		#totalprice-contents{
			
			font-size : 20px;
		}
		.size-information table{
			width : 400px;
			border-top: 1px solid grey;
    		text-align : center;
		}
		.size-information tr{
			border-bottom: 1px solid grey;
		}
    	
  
  
    	
	  .abtn{
	  height:40px;
	  line-height:40px;  
	  border-radius:3px;
	  border:1px solid grey;
	  background-color: transparent;
	  font-size:13px;    
	  
	}
	
	.abtn ul {
	  border:1px solid grey;  
	  border-bottom-left-radius: 3px;  
	  border-bottom-right-radius:3px;
	  border-top:0;
	  bottom:40px;  
	  padding-left:0px;
	 
	}
	
	.abtn,
	.abtn ul li {
	  width:200px;
	  margin : 0 auto;
	  text-align : center;
	}
	
	.abtn:focus {
	  border-top-left-radius: 0px;  
	  border-top-right-radius:0px;
	  margin-top:1px;
	  cursor:default;  
	}
	
	.abtn ul li:hover{
	   background-color:#e9e9e9;
	}
	
	.opt-sel {
	  position:absolute;  
	  outline: none;
	  cursor:pointer;
	}
	
	.opt-sel ul{
	  width:200px;
	  left:-1px; 
	  list-style:none;
	  margin:0;    
	}
	
	.sel-icon {
	  float:right;  
	  font-size:10px;
	}
	
	.sel-icon:after {    
	  content:'▼';
	}
	
	.opt-sel:focus .sel-icon:after{
	  content:'▲';
	}
	
	.opt-sel ul li{    
	  cursor:pointer;
	}
	
	.opt-sel:focus ul {
	  display:block;  
	}
	
	.opt-sel:not(:focus) ul {  
	  display:none;  
	}
	#size-title{
		position: absolute;
	 	top: 270px;
	 	font-size : 20px;
	}
	#size-contents{
	position : absolute;
	right : 245px;
	}
	
	
	
	#close {
	float:left;
	display:inline-block; 
	text-shadow: 0 1px 0 #fff; 
	
	} 
	#close:hover {
	border: 0; 
	cursor:pointer; 
	opacity: .75; 
	}
	.order-wrap{
		padding-top : 20px;
		text-align : center;
	}
	#shopping-basket{
		width : 484px;
		font-weight:bold;
	}
	#order{
		margin-top : 15px;
		width : 484px;
		font-weight:bold;
	}
	.tab-wrap{

	border-bottom : 2px solid grey;
	width :100%;
	
	}
	.tab-wrap div{
		
		height : 40px;
		display : inline-block;
		text-align : center;
		
		margin-top : 10px;
		margin-bottom : 10px;
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		font-weight: bold;
		font-size : 20px;
	}
	.tab-description{
		width : 33.3%;
	}
	.tab-description:hover{
		background : #88c8bc;
		color : white;
	}
	.tab-graph{
		width : 33.3%;
		margin-left : -4px;
		border: 1px solid black;
	}
	.tab-graph:hover{
		background : #88c8bc;
		color : White;
	}
	.tab-review{
		margin-left : -8px;
		width : 384px;
	}
	.tab-review:hover{
		background : #88c8bc;
		color : White;
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
						</p>
					</div>
				</div>
				<h1>Store</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		
		<div class="colorlib-about">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-sm-6 mb-3">
						<div class="video colorlib-video" style="background-image: url(images/about.jpg); height:540px;">
							<img src="${pageContext.request.contextPath}/resources/user/images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							<div class="overlay"></div>
						</div>
						<br>
						<div class=size-information>
							사이즈 정보
							<table>
								<tr class="price-tr-1">
									<th>cm</th>
									<th>총장</th>
									<th>어깨너비</th>
									<th>가슴단면</th>
									<th>소매길이</th>
								</tr>
								<tr>
									<th>MY</th>
									<th>-</th>
									<th>-</th>
									<th>-</th>
									<th>-</th>
								</tr>
								<tr>
									<th>S</th>
									<th>70</th>
									<th>47</th>
									<th>51.5</th>
									<th>57.5</th>
								</tr>
								<tr>
									<th>M</th>
									<th>71</th>
									<th>48.5</th>
									<th>54</th>
									<th>58.5</th>
								</tr>
								<tr>
									<th>L</th>
									<th>72.5</th>
									<th>50</th>
									<th>56.5</th>
									<th>59.5</th>
								</tr>							
							</table>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="about-wrap">
							<div class="title-wrap">
								<div class="title" id="title">겨울용 여성 털부츠</div>
								<div class="title" id="like-box">
									<div><i class="icon-heart" aria-hidden="true"></i>좋아요</div>
								</div>
							</div>
							<div class="contents">
								겨울에 따듯하게 신을수 있는 부츠
							</div>
							<div class="information">
								<table>
									<tr>
										<th>판매가</th>
										<th>109,000원</th>
									</tr>
									<tr>
										<th>색상 종류</th>
										<th>
											<i class="icon-heart" aria-hidden="true">
											<i class="icon-heart" aria-hidden="true">
											<i class="icon-heart" aria-hidden="true">
										</th>
									</tr>
									<tr>
										<th>좋아요</th>
										<th><i class="icon-heart" aria-hidden="true"></i>100</th>
									</tr>								
								</table>
							</div>
							<div class="size-wrap">
								<div class="size" id="size-title">사이즈</div>
									<div class="size" id="size-contents">
										<div class="opt-sel abtn" tabindex="1">
									 		사이즈를 선택해주세요 <div class="sel-icon">
									 	</div>
										<ul tabindex="1">
									    	<li><div class=dropbox">S</div></li>
									    	<li>M</li>
									    	<li>L</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="price">
								<table>
									<tr class="price-tr-1">
										<th>&nbsp;색상</th>
										<th>사이즈</th>
										<th>수량</th>
										<th>금액</th>
									</tr>
									<tr>
										<th><span id='close' onclick="#">X</span>blue</th>
										<th>S</th>
										<th>1</th>
										<th>109,000원</th>
									</tr>
									<tr>
										<th><span id='close' onclick="#">X</span>blue</th>
										<th>M</th>
										<th>1</th>
										<th>109,000원</th>
									</tr>
									<tr>
										<th><span id='close' onclick="#">X</span>blue</th>
										<th>L</th>
										<th>1</th>
										<th>109,000원
										</th>
									</tr>							
								</table>
							</div>
							<div class="totalprice-wrap">
								<div class="totalprice" id="totalprice-title">총 상품 금액</div>
								<div class="totalprice" id="totalprice-contents">327,000원</div>
							</div>
							<div class="order-wrap">
			       		 		<button onclick="location.href='#'" class="btn btn-primary thema" id="shopping-basket">장바구니</button>
			       		 		<button onclick="location.href='#'" class="btn btn-primary thema" id="order">주문하기</button>
			    			</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상세 설명 -->
		<div class="container">
				<div class="row">
					<div class="tab-wrap">
						<div class="tab-description">
							상세 설명
						</div>
						<div class="tab-graph">
							구매 현황
						</div>
						<div class="tab-review">
							리뷰
						</div>
					</div>
				</div>
				<div class="description-wrap">
					<div class="description-title">
					상품 상세 설명
					</div>
					<div class="description-contents">
					</div>
				</div>
				<div class="graph-wrap">
					<div class="graph-title">
					상품 상세 설명
					</div>
					<div class="graph-contents">
					</div>
				</div>
				<div class="review-wrap">
					<div class="review-title">
					상품 상세 설명
					</div>
					<div class="review-contents">
					</div>
				</div>
		</div>	
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>

