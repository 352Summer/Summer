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
	
	</script>
</head>

<body>

	<div id="container">
		<section id="question-container" class="container">
			<p>총 ${totalContents}건의 게시물이 있습니다.</p>
			<table id="tbl-question" class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>답변유무</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list}" var="q"> 
				<tr id="${q.qNo}">
					<td>${q.qTitle}</td>
					<td>${q.aStatus}</td>
					<td>${q.userId}</td>
					<td>${q.qDate}</td
				</tr>
				</c:forEach>
			</table>
		</section> 
	</div>
	<br />
	<br />
	<br />
	<div id="container">
		<section id="report-container" class="container">
			<table id="tbl-report" class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>참조 게시글 번호</th>
					<th>참조 댓글 번호</th>
					<th>처리유무</th>
					<th>신고자</th>
					<th>신고일</th>
				</tr>
				<c:forEach items="${list}" var="r"> 
				<tr id="${r.rNo}">
					<td>${r.bNo}</td>
					<td>${r.bcNo}</td>
					<td>${r.rStatus}</td>
					<td>${r.userId}</td>
					<td>${r.rDate}</td
				</tr>
				</c:forEach>
			</table>
		</section> 
	</div>
	
</body>
</html>