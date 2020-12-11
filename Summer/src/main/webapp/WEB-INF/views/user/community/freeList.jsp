<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="community" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - COMMUNITY</title> 
	<meta charset="utf-8">
   
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
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>Community</span></p>
					</div>
				</div>
				<h1>자유게시판</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>

		<div class="colorlib-product" style="margin-top:-80px;">
			<div class="container">
				<div class="row row-pb-md" style="margin-bottom: -50px;">
					<div class="col text-center">
						<!-- 게시판 -->
						<table id="tbl-board" class="table table-hover table-striped">
							<tr style="background : #88c8bc; border : #88c8bc;">
								<th style=" width : 70px;">번호</th>
								<th>제목</th>
								<th style="width : 100px;">작성자</th>
								<th style="width : 80px;">작성일</th>
								<th style="width : 70px;">파일</th>
								<th style="width : 90px;">조회수</th>
							</tr>
							<c:forEach items="${list}" var="b"> 
							<tr id="${b.boardNo}" style="border-bottom : 1px solid lightgrey">
								<td>${b.boardNo}</td>
								<td style="text-align: left;">${b.boardTitle}22222222</td>
								<td>${b.boardWriter}</td>
								<td>${b.boardDate}</td>
								<td align="center">
									<c:if test="${b.fileCount>0}">
										<i class="icon-large icon-file"></i>
									</c:if>
								</td>
								<td>${b.boardReadCount }</td>
							</tr>
							</c:forEach>
						</table>
						<button type="button" class="btn btn-primary" style="background : #88c8bc; border : #88c8bc; float : right;"
								onclick="location.href='${pageContext.request.contextPath}/community/insertFreeView.do?'">글쓰기</button>
					</div>
				</div>
				<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
			</div>
		</div>

		<div class="colorlib-partner">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
						<h2>Trusted Partners</h2>
					</div>
				</div>
				<div class="row">
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-1.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-2.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-3.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-4.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
					<div class="col partner-col text-center">
						<img src="${pageContext.request.contextPath}/resources/user/images/brand-5.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>
		$(function(){
			$("tr[id]").on("click",function(){
				var boardNo = $(this).attr("id");
				console.log("bordNo="+boardNo);
				location.href = "${pageContext.request.contextPath}/community/selectFreeDetail.do?no="+boardNo;
			});
		});
	</script>
	
	</body>
</html>

