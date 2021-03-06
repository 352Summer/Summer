<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FAQ</title>
	
	<style>
	/*FAQ작성버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		
	
		.block-27 ul, .block-27 ul li {
	  		padding: 0;
	  		margin: 0;
	  		list-style: none;
  		}

		.block-27 ul li {
		  display: inline-block;
		  margin-bottom: 4px;
		}
  		.block-27 ul li a, .block-27 ul li span {
		    text-align: center;
		    display: inline-block;
		    width: 40px;
		    height: 40px;
		    line-height: 40px;
		    border-radius: 50%;
		    border: 1px solid #ccc;
		}
  		.block-27 ul li.active a, .block-27 ul li.active span {
		    background: #616161;
		    color: #fff;
		    border: 1px solid transparent;
		}
		
		#qList, #rList, #fList {
			width : 200px;
			height : 40px;
			background : snow;
			border : 2px solid #88c8bc;
			border-radius : 5px;
			font-size : 18px;
		}
		
		#fList {
			background : #88c8bc;
			color : white;
		}
		
		#qList:hover , #rList:hover, #fList:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
		
		#qList li:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
			cursor : pointer;
		}
		
		#qStatus li:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
			cursor : pointer;
		}
		
		#insertBtn {
			background : white;
			color : #88c8bc;
			width : 30%;
			height : 30px;
			border : 1px solid black;
			border-radius : 5px;
			margin-right : 10px;
		}
		
		#insertBtn:hover {
			background : #88c8bc;
			color : white;
			transition : 0.4s;
		}
    
    
	</style>
	
</head>

<body>
	<c:import url="../common/header.jsp"/>
	<div id="container" style="background:white; border: 2px solid black; padding:5%" >
	
		<div class="row">
			<div class="container" style="text-align:center;">
				<button type="button" id="qList">문의사항관리</button>
				<button type="button" id="rList">신고관리</button>
				<button type="button" id="fList">FAQ관리</button>
			</div>
		</div>
		<br /><br />
	
		<div id="container" style="background:white; border: 2px solid black; padding:5%">
			<div class="col" style="text-align:center;"><h3>FAQ 관리 게시판</h3></div>
			<input type="button" value="FAQ작성" id="btn-add" class="btn btn-outline-success" onclick="fn_gofaqForm();"/>
			<section id="faq-container" class="container">
				<p>총 ${totalContents}건의 등록한 FAQ 게시물이 있습니다.</p>
				<table id="tbl-faq" class="table table-striped table-hover">
					<tr>
						<th>FAQ 번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list}" var="f"> 
					<tr id="${f.FNO}">
						<td>${f.FNO}</td>
						<td>${f.FTITLE}</td>
						<c:set var="fDate" value="${ F.FDATE }"/>
						<td>${ fn:substring(fDate, 0, 10) }</td>
					</tr>
					</c:forEach>
				</table>
					<!-- 페이징 처리 사직-->
					<div class="row">
						<div class="span12">
							<div class="block-27" style="text-align:center;">
								<c:out value="${pageBar}" escapeXml="false"/>
			            	</div>
						</div>
					</div>
					<!-- 페이징 처리 끝-->
			</section> 
		</div>
	</div>
	<br /><br />
	<div class="footer">
	  <div class="footer-inner">
	    <div class="container">
	      <div class="row">
	        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
	        <!-- /span12 --> 
	      </div>
	      <!-- /row --> 
	    </div>
	    <!-- /container --> 
	  </div>
	  <!-- /footer-inner --> 
	</div>
	<script>

	// FAQ
	$(function(){
		$("tr[id]").on("click",function(){
			var FNO = $(this).attr("id");
			console.log("FNO="+FNO);
			location.href = "${pageContext.request.contextPath}/admin/customerService/faqView.do?no="+FNO;
		});
	});

	function fn_gofaqForm(){
		location.href = "${pageContext.request.contextPath}/admin/customerService/faqForm.do";
	}

	
	$('#qList').on('click', function() {
		location.href="${pageContext.request.contextPath}/admin/customerService/customerService.do";
	});
	$('#rList').on('click', function() {
		location.href="${pageContext.request.contextPath}/admin/customerService/selectReportList.do";
	});
	$('#fList').on('click', function() {
		location.href="${pageContext.request.contextPath}/admin/customerService/faqList.do";
	});

	
	</script>
	
</body>
</html>