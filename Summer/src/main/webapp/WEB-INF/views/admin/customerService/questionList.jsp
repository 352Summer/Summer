<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터</title>
	<c:import url="../common/header.jsp"/>
	<style>
		
	</style>
	<script>

	$(function(){
		$("tr[id]").on("click",function(){
			var QNO = $(this).attr("id");
			console.log("QNO="+QNO);
			location.href = "${pageContext.request.contextPath}/admin/customerService/questionView.do?no="+QNO;
		});
	});
	</script>
</head>

<body>

	<div id="container" style="background:white; border: 2px solid black; padding:5%" >
		<section id="question-container" class="container">
			<p>총 ${totalContents}건의 게시물이 있습니다.</p>
			<table id="tbl-question" class="table table-striped table-hover">
				<tr>
					<th>문의번호</th>
					<th>제목</th>
					<th>답변유무</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list}" var="q"> 
				<tr id="${q.QNO}">
					<td>${q.QNO}</td>
					<td>${q.QTITLE}</td>
					<td>${q.ASTATUS}</td>
					<td>${q.USERID}</td>
					<td>${q.QDATE}</td>
				</tr>
				</c:forEach>
			</table>
				<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
		</section> 
	</div>
	<br />
	<br />
	<br />
	<div id="container" style="background:white; border: 2px solid black; padding:5%">
		<section id="report-container" class="container">
			<p>총 ${totalContent}건의 게시물이 있습니다.</p>
			<table id="tbl-report" class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>참조 게시글 번호</th>
					<th>참조 댓글 번호</th>
					<th>처리유무</th>
					<th>신고자</th>
					<th>신고일</th>
				</tr>
				<c:forEach items="${list2}" var="r"> 
				<tr id="${r.RNO}">
					<td>${r.RNO}</td>
					<td>${r.BNO}</td>
					<td>${r.BCNO}</td>
					<td>${r.RSTATUS}</td>
					<td>${r.USERID}</td>
					<td>${r.RDATE}</td
				</tr>
				</c:forEach>
			</table>
				<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar1}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
		</section> 
	</div>
	
</body>
</html>