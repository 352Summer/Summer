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
						<p class="bread"><span><a href="${pageContext.request.contextPath}/community/selectCommunityMain.do">Community</a></span> / <span>Free</span></p>
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
						<table style="width:100%;">
							<tr>
								<td><h2>${board.BTITLE}</h2></td>
							</tr>
							<tr>
								<td>${board.WRITER} ${board.MEMBERSHIP}</td>
							</tr>
							<tr>
								<td>${board.BDATE2CHAR}</td><td style="text-align: center;">댓글 ${board.COMMENTCOUNT}</td><td style="text-align: center;">조회 ${board.VIEWS}</td>
							</tr>
						</table>
						
						<hr />
						
						${board.BCONTENTS}
						
						<c:forEach items="${attachmentList}" var="attachment">
						<div class="col partner-col text-center">
							<img src="${pageContext.request.contextPath}${attachment.FILEPATH}${attachment.NEWFILENAME}" class="img-fluid" alt="${attachment.OLDFILENAME}">
						</div>
						</c:forEach>
						
						<div style="clear:both">
						댓글 ${board.COMMENTCOUNT}
						<button type="button" style="float:right;">신고</button>
						</div>
						
						<hr style="margin-bottom : 0;"/>
						<div style="padding : 10px;">
							<h6 style="">댓글</h6>
							<c:forEach items="${commentList}" var="comment">
							<div id="${comment.BCNO}" style="padding : 10px; border-top : 1px solid lightgrey">
								${comment.WRITER} ${comment.DATE2CHAR} <br />
								${comment.CCONTENTS}
							</div>
							</c:forEach>
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
							onclick="location.href='${pageContext.request.contextPath}/community/selectFreeList.do';">목록</button>
					</div>
				</div>
				
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	<script>

		function fn_update() {
			if(confirm('수정하시겠습니까?')){
				location.href='${pageContext.request.contextPath}/community/updateFreeView.do?bNo='+${board.BNO};
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

