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
    <style>
    	#sort-box {
    		border : 1px solid #E2E2E2;
    		list-style : none;
    		font-weight : bold;
    		padding : 10px 0px 10px 10px;
    	}
    	
    	#sort-box>li {
    		margin-left : 10px;
    		padding : 5px 10px 5px 10px;
    		border : 1px solid #E2E2E2;
    		display : inline-block;
    	}
    	
    	#sort-box>li:hover {
    		background : #E2E2E2;
    		border : 1px solid black;
    		cursor : pointer;
    		transition : 0.5s;
    	}
    	
    	#category>li:hover {
    		background : #E2E2E2;
    		font-weight : bold;
    		transition : 0.5s;
    	}
    	
    	#submitBtn {
    		width : 50px;
    		height : 43px;
    		border : 1px solid gray;
    	}
    	
    	#submitBtn:hover{
    		background : gray;
    		color : snow;
    		cursor : pointer;
    		transition : 0.4s;
    	}
    	
    	.desc>span {
    		font-size : 12px;
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
				<h1>Lookbook</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul id="sort-box">
						<li>조회수</li>
						<li>최신순</li>
						<li>좋아요</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="colorlib-product" style="margin-top:-80px;" >
			<div class="container">
				<div class="row row-pb-md" style="margin-bottom:-20px">
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="${pageContext.request.contextPath}/lookbook/selectLookbookDetail.do" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="${pageContext.request.contextPath}/lookbook/selectLookbookDetail.do">데일리룩</a></h2>
								<span>클래식한 슈트에만 어울릴법한 브리프케이스의 변신! 연말 모임룩, 파티룩, 데일리룩에도 잘 어울리는 패션 브리프케이스입니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook2.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">겨울 코듀로이 컬렉션</a></h2>
								<span>추운 겨울 시즌에 이너로 활용이 가능하며 봄 시즌에는 아우터로까지 활용 가능한 활용도 높은 디자인의 제품들과 라퍼지스토어 인기 제품의 디벨롭 버전이 다양하게 출시되어 다양한 고객의 니즈를 충족시킬 수 있도록 준비한 컬렉션입니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook3.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">산책, 평범한 일상</a></h2>
								<span>평범한 일상에 활동성을 가미한 데일리 룩으로, 레이어드가 용이하여 착용자의 부담감 최소화에 주안점을 둔 스타일링이다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook4.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">치킨</a></h2>
								<span>어릴 적 아버지가 사 오시던 치킨. 아버지의 끝없는 자식 사랑과 철없는 아들의 하루를 통해 풀어낸 영상 속에 4XR과 마니커의 협업으로 탄생한 아이템들을 카메오 역할의 강준호 실장을 통해 또 다른 시선으로 구성하였다.</span>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook5.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">가을/겨울 컬렉션</a></h2>
								<span>빠니깔레는 이탈리아 도시 피렌체의 정갈함과 지성, 카프리의 자유로움과 순수함 그리고 나폴리의 여유로움과 따뜻한 감성의 조화를 통한 자유롭고 편안한 남성 이미지 콘셉트를 추구하는 브랜드입니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook6.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">그레이</a></h2>
								<span>이번 시즌 디프리크는 업그레이드된 커팅 디테일, 완성도를 위한 테크닉까지 디자인과 기능성에 초점을 맞추면서도 여기에 과감한 패션 요소들을 더해 이를 자유롭게 표현했다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook7.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">레디 투 웨어</a></h2>
								<span>낮에 만난 디벨은 고급스러움과 단정함 그 자체였다. 그에게 물었다. '밤에 파티 잊지 않으셨죠?' 디벨은 대답했다. '레디. 투 웨어' 무슨 내용이었을까 한참 고민을 하던 중 파티장 입구에서 만난 디벨의 모습에 답을 알게 되었다. 단정함은 사라지고 섹시함이 살아났다. 같은 옷 하지만 다른 옷, 그는 디벨이다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook8.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">도전하거나 정체되거나</a></h2>
								<span>Covid-19로 인한 어둡고 침체된 분위기로 나아가지 못하는 정체된 현실 속에서도 미지의 낯선 곳을 향해 도전하는 러기드하우스의 도전 정신을 담아내고자 개척되지 않은 자연을 탐험, 또는 여행하며 앞으로 나아가기 위해 노력하는 브랜드만의 아이덴티티를 담아내었습니다.</span>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook9.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">하이 윈터</a></h2>
								<span>하이퍼 감성을 담은 다양한 그래픽의 스웨트셔츠부터 포근한 플리스와 니트까지! 스트릿 무드의 하이 윈터 컬렉션을 만나보세요.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook10.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">톤 온 더 베이직</a></h2>
								<span>겨울에 어울리는 모던한 컬러와 아트워크로 표현한 다양한 제품들로 구성하여 부쩍 추워지는 겨울 날씨에 알맞은 감성을 베이스모먼트만의 스타일로 멋스럽게 풀어내었습니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook11.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">베어브릭 X 프라이</a></h2>
								<span>베어브릭 X 프라이 컬렉션은 에일리언 디자인의 야광 콘셉트입니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook12.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">미니멀 속 디테일</a></h2>
								<span>쌀쌀한 날씨, 두꺼워지는 옷, 짙은 컬러감 묻어나는 계절 겨울. 이번 겐지 아이웨어 겨울 시즌은 미니멀 속 디테일을 담았습니다. 두터운 겨울에도 느낄 수 있는 볼드한 쉐입의 뿔테부터 육각형 렌즈 느낌의 깎이듯 한 타원형 렌즈 라인이 색다름을 나타냅니다.</span>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook13.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">미니멀 아메리칸 캐주얼</a></h2>
								<span>브랜드 '아날로그베이스'는 워크웨어 패션에 기반을 두고 있으며 모던한 무드를 더해 회사나 일상생활에서 부담스럽지 않게 데일리로 입을 수 있는 컨템퍼러리 브랜드입니다. 세미 워크웨어 의류들부터 개성 넘치는 프린팅 후디, 반팔 티셔츠 등 다양한 제품을 제안합니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook14.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">윈터 포레스트</a></h2>
								<span>겨울의 숲을 담은 자연의 색감과 내추럴한 디테일의 요소를 사용하여 모든 기억들이 하나하나 소중하듯 오래 간직하고 싶은 룩을 선보입니다. 나른한 오후, 눈이 내리는 숲속을 걷는 듯한 약간의 설렘과 평온함의 조화로운 무드를 느껴보세요.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook15.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">테크 누아르</a></h2>
								<span>세기말에서 20년이 훌쩍 지난 2020년에 서있는 지금, 문수권세컨 2020 Fall/Winter 컬렉션은 상상 속의 미래와 현재가 교차하는 시간의 접점에서 다시 설레는 시간 여행을 시작한다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-lg-3 mb-4 text-center">
						<div class="product-entry border">
							<a href="#" class="prod-img">
								<img src="${pageContext.request.contextPath}/resources/user/images/lookbook/LookBook16.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="#">낡은 것의 아름다움</a></h2>
								<span>세월이 지나 손때가 묻고 낡아질수록 아름다운 가치를 담아내고자 했습니다.</span>
							</div>
						</div>
					</div>
				</div>
				<div style="text-align : right;">
			        <button onclick="location.href='${pageContext.request.contextPath}/lookbook/LookbookInsert.do'" class="btn btn-primary thema">글쓰기</button>
			    </div>
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
			               <ul>
				              <li><a href="#"><i class="ion-ios-arrow-back"></i></a></li>
			                  <li class="active"><span>1</span></li>
			                  <li><a href="#">2</a></li>
			                  <li><a href="#">3</a></li>
			                  <li><a href="#">4</a></li>
			                  <li><a href="#">5</a></li>
			                  <li><a href="#"><i class="ion-ios-arrow-forward"></i></a></li>
			               </ul>
		            	</div>
		            	<br>
		            	<form action="#">
			            	<div class="btn-group">
			            		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			            			<span id="category-value">제목</span>
			            		</button>
			            		<ul id="category" class="dropdown-menu text-center" role="menu">
			            			<li>제목</li>
			            			<li>작성자</li>
			            		</ul>
			           		</div>
			            	<input type="text" style="width : 250px;"/>
			            	<button type="submit" id="submitBtn">검색</button>
		            	</form>
					</div>
				</div>
			</div>
		</div>

		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
	
	</body>
</html>

