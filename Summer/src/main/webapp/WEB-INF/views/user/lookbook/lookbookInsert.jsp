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
    		width : 500px;
    	}
    	
    	#title>input {
    		border-radius : 5px;
    		width : 450px;
    	}
    	
    	#content {
    		margin-left : 10%;
    		padding : 20px;
    		background : #88c8bc;
    		border-radius : 5px;
    		width : 500px;
    		height : 300px;
    	}
    	
    	#content>div:first-child {
    		border : 1px solid black;
    		border-radius : 5px;
    		text-align : center;
    		background : white;
    	}
    	
    	#content>div:nth-child(2n) {
    		margin-top : 10px;
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
				<h1>Lookbook 등록</h1>
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
								<div id="title">
									<input type="text" placeholder="제목을 입력해주세요."/>
								</div>
								<br>
								<div id="content">
									<div>
										설명
									</div>
									<div>
										<textarea name="content" cols="68" rows="8" style="resize:none;" placeholder="설명을 입력해주세요."></textarea>
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
				<hr />
				<div class="row">
					<div class="col-md-12">
						<div id="box2">
							<button type="submit" class="btn btn-success">등록하기</button>
							<button type="reset" class="btn btn-danger">취소하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	</body>
</html>

