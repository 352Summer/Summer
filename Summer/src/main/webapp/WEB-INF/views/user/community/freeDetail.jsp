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

		<div class="colorlib-product" style="margin-top:-80px; clear: both;">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col" >
					<div style="border : 1px solid lightgrey; padding : 10px; margin-bottom : 10px;">
						<table>
							<tr>
								<td><h2>${board.bTitle}남자분들 이거 생일선물로 받으면 별로 인가요?</h2></td>
							</tr>
							<tr>
								<td>${board.bWriter}guest01 ${board.bMembership}일반회원</td>
							</tr>
							<tr>
								<td>${board.bDate}2020.12.02 01:30</td>
							</tr>
						</table>
						
						<hr />
						
						${board.bContents}내용
						
						<div class="col partner-col text-center">
							<img src="${pageContext.request.contextPath}/resources/user/images/brand-5.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
						</div>
						신고
						댓글 11
						<hr style="margin-bottom : 0;"/>
						<div style="padding : 10px;">
							<h6 style="">댓글</h6>
							<div style="padding : 10px; border-top : 1px solid lightgrey">
								작성자 2020.12.02 00:57 <br />
								댓글내용
							</div>
							<div style="padding : 10px; border-top : 1px solid lightgrey">
								작성자 2020.12.02 00:57 <br />
								댓글내용
							</div>
							<div style="padding : 10px 10px 0 10px; border : 1px solid lightgrey; clear:both;">
								<textarea rows="3" style="width : 100%; border : 1px solid lightgrey;"></textarea>
								<button type="button" class="btn btn-primary" style="background : #88c8bc; border : #88c8bc; float : right;">등록</button>
								<br /> <br /><br />
							</div>
						</div>
					</div>
					<button type="button" class="btn btn-primary thema" onclick="fn_update();">수정</button>
					<button type="button" class="btn btn-primary thema" onclick="fn_delete();">삭제</button>
					<button type="button" class="btn btn-primary thema" style="float : right;"
							onclick="location.href='${pageContext.request.contextPath}/community/selectFreeList.do?';">목록</button>
					</div>
				</div>
				
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>

		function fn_update() {
			if(confirm('수정하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/selectFreeList.do?';
			}
		}
		
		function fn_delete() {
			if(confirm('삭제하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/selectFreeList.do?';
			}
		}
	</script>
	
	</body>
</html>

