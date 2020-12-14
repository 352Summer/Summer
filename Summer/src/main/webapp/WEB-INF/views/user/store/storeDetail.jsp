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
			
			height : 75px;
			font-size : 30px;
			padding-rigth : -20px;
			
		}
		.title{
		display: inline-block;
		}
		#title{
		
		width : 325px;
		}
		#like-box {
    		font-weight : bold;
    		padding : 0px 0px 0px 0px;
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
					</div>
					<div class="col-sm-6">
						<div class="about-wrap">
							<div class="title-wrap">
								<div class="title" id="title">겨울용 여성 털부츠</div>
								<div class="title" id="like-box">
									<div><i class="icon-heart" aria-hidden="true"></i>좋아요</div>
								</div>
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

