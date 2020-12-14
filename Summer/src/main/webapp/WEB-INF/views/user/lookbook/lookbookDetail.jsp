<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="lookbook" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - LOOKBOOK</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <style>
    	.img-thumbnail {
    		width : 300px;
    		height : auto;
    		margin : 30px 30px 30px 50px;
    	}
    	
    	#title {
    		margin-left : 10%;
    		margin-top : 10%;
    		padding : 8px;
    		text-align : center;
    		border-radius : 5px;
    		background : #88c8bc;
    		font-weight : bold;
    		width : 500px;
    	}
    	
    	#content {
    		margin-left : 10%;
    		padding : 20px;
    		background : #88c8bc;
    		border-radius : 5px;
    		font-weight : bold;
    		width : 500px;
    		height : 250px;
    	}
    	
    	#content>div:first-child {
    		border : 1px solid black;
    		border-radius : 5px;
    		text-align : center;
    		background : white;
    	}
    	
    	#content>div:nth-child(2n) {
    		margin-top : 10px;
    		border : 1px solid black;
    		border-radius : 5px;
    		background : white;
    		height : 80%;
    	}
    	
    	.carousel,
    	.item,
    	#Image img {
    		text-align : center;
    		height : 600px;
    	}
    	
    	#Image img {
    		min-width : 70%;
    	}
    	
    	#box2 {
    		text-align : center;
    	}
    	
    	#box2>div {
    		display : inline-block;
    		width : 120px;
    		height : 150px;
    	}
    	
    	#goBack {
    		text-align : center;
    	}
    	
    	#goBack *{
    		border : 1px solid black;
    		border-radius : 5px;
    		padding : 5px 10px 5px 10px;
    		background : white;
    		font-weight : bold;
    		width : 100px;
    		height : auto;
    	}
    	
    	#goBack>button:hover {
    		background : #88c8bc;
    		color : white;
    		transition : 0.4s;
    	}
    	
    	#comment {
    		margin-top : 10px;
    		border-radius : 5px;
    		background : #E2E2E2;
    		width : 80px;
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
					<div class="col">
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>LookBook</span></p>
					</div>
				</div>
				<h1>Lookbook 상세조회</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="colorlib-product" style="margin-top:-80px;" >
			<div class="container">
				<div class="row row-pb-md" >
					<div class="col" >
						<div class="col-md-12">
							<div class="col-md-4">
							<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook1.jpg" class="img-thumbnail">							
							</div>
							<div class="col-md-8" style="display:inline-block;">
								<div id="title">데일리</div>
								<br>
								<div id="content">
									<div>
										설명
									</div>
									<div>
										클래식한 슈트에만 어울릴법한 브리프케이스의 변신! 연말 모임룩, 파티룩, 데일리룩에도 잘 어울리는 패션 브리프케이스입니다.
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<br /><br />
				<div class="row row-pb-md">
					<div class="col">
						<div class="col-md-12">
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators">
								    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
								    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  								</ol>
  								<div id="Image" class="carousel-inner" role="listbox">
  									<div class="item active">
  										<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook2.jpg" class="img-responsive center-block"/>
  										<div class="carousel-caption">
  											1번사진
  										</div>
  									</div>
  									<div class="item">
  										<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook3.jpg" class="img-responsive center-block"/>
  										<div class="carousel-caption">
  											2번사진
  										</div>
  									</div>
  									<div class="item">
  										<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook4.jpg" class="img-responsive center-block"/>
  										<div class="carousel-caption">
  											3번사진
  										</div>
  									</div>
  								</div>
  								<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
								    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
  								</a>
  								<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
								    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
  								</a>
							</div>
						</div>
					</div>
				</div>
				<br /><br />
				<div class="row">
					<div class="col" id="box2">
						<div class="border">
							<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/thumbsUp.png" width="50" height="50" style="margin-top:15px;"/><br><br>
							<span>좋아요</span><br>
							<span>13</span>
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="border">
							<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/warning.png" width="50" height="50" style="margin-top:15px;"/><br><br>
							<span>신고</span><br>
							<span>1</span>
						</div>
					</div>
				</div>
				<br /><br />
				<hr />
				<div class="row">
					<div class="col-md-12">
						<div id="goBack">
							<button>목록으로</button>
						</div>
					</div>
				</div>
				<hr /> <br>
				<div class="row">
					<div class="col-md-10 col-md-offset-1 border" style="padding:15px;">
						<span style="font-weight:bold;">댓글</span>
						<hr />
						<div style="padding:10px;">
							<span style="font-weight:bold;">홍길동</span> &nbsp;
							<span style="font-size:10px;">2020.12.12</span> <br>
							<span style="font-size:12px;">댓글입니다.</span>
						</div>
						<hr />
						<div style="padding:10px;">
							<span style="font-weight:bold;">청길동</span> &nbsp;
							<span style="font-size:10px;">2020.12.13</span> <br>
							<span style="font-size:12px;">댓글입니다요.</span>
						</div>
						<hr />
						<div class="border" style="padding:10px;">
							<span style="font-weight:bold;">댓글 작성</span>
							<div class="border" style="padding:10px;">
								댓글을 작성해주세요.
							</div>
							<div style="text-align : right;">
								<button id="comment">등록하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	</body>
</html>

