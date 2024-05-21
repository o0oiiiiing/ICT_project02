<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>DETAIL | Jeju_travel</title>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 적용 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="resources/pdh-css/detail.css" />
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css" />
<link rel="stylesheet" href="resources/pdh-css/paging.css" />
<link rel="stylesheet" href="resources/pdh-css/starRating.css" />
<link rel="stylesheet" href="resources/common-css/reset.css" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- summernote -->
<script src="/resources/common-js/summernote-ko-KR.min.js"></script>
<script src="/resources/common-js/summernote-lite.js"></script>
<link rel="stylesheet" href="/resources/common-css/summernote-lite.css">

<!-- 챗봇 css -->
<style type="text/css">
#chatbot_image {
	width: 50px;
	height: 50px;
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 99;
	line-height: 60px;
	cursor: pointer;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
	border-radius: 50%;
}

.chatbot_modal {
	position: fixed;
	bottom: 20px;
	right: 80px;
	z-index: 2;
	background-color: white;
	display: none;
	border-radius: 10px;
}
</style>
<script>
    // 페이지 로드 시 history.scrollRestoration을 'manual'로 설정
    history.scrollRestoration = 'manual';
    document.addEventListener('DOMContentLoaded', function() {
        let cPage = "${cPage}"
        if (cPage != "") {
        	window.scrollTo(0, sessionStorage.getItem('scrollPosition'));
		}

        // 페이지 언로드 시 현재 스크롤 위치 저장
        window.addEventListener('beforeunload', function() {
            sessionStorage.setItem('scrollPosition', window.scrollY);
        });
    });
</script>
<script type="text/javascript">
	// 링크 복사하기 버튼
	function copyLink() {
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("링크가 복사되었습니다.")
	}
	
	// 일정 추가하기 버튼
	function addSchedule() {
		location.href = "addSchedule?contentsid=${placeDetail.contentsid}";
	}
	
	// 아이콘 눌렀을 때 텍스트박스 글 지우기
	function clearInput() {
		var searchField = document.getElementsByClassName("search-field")

		for (var i = 0; i < searchField.length; i++) {
			searchField[i].value = "";
		}
	}
	// 챗봇
	$(document).ready(function() {
	    $(".chatbot_image").click(function() {
	        $(".chatbot_modal").toggle();  
	    });
	    
	});
	
	// q&a영역, review영역 버튼 클릭할 때 보이게 하기
	document.addEventListener('DOMContentLoaded', function() {
	    var writeButton = document.querySelector('.write_button');
	    var reviewButton = document.querySelector('.write_r_button');
	    var qaWriteDiv = document.getElementById('qa_write');
	    var reviewWriteDiv = document.getElementById('review_write');
	    var overlay = document.querySelector(".overlay")

	    writeButton.addEventListener('click', function() {
	        // 요소의 display를 토글
	        if ("${userVO}" == "") {
				alert("로그인 후 이용 가능합니다.")
				location.href="login_go.do"
				return 
			} else {
		        if (qaWriteDiv.style.display === 'block') {
		        	qaWriteDiv.style.display = 'none';
		        	overlay.style.display = 'none';
		        } else {
		        	qaWriteDiv.style.display = 'block';
		        	overlay.style.display = 'block';
		        }
			}
	        overlay.addEventListener('click', function() {
	        	if (qaWriteDiv.style.display === 'block') {
		        	qaWriteDiv.style.display = 'none';
		        	overlay.style.display = 'none';
		        }
	        })
	    });
	    
	    reviewButton.addEventListener('click', function() {
	        // 요소의 display를 토글
	        if ("${userVO}" == "") {
				alert("로그인 후 이용 가능합니다.")
				location.href="login_go.do"
				return 
			} else {
		        if (reviewWriteDiv.style.display === 'block') {
		        	reviewWriteDiv.style.display = 'none';
		        	overlay.style.display = 'none';
		        } else {
		        	reviewWriteDiv.style.display = 'block';
		        	overlay.style.display = 'block';
		        }
			}
	        overlay.addEventListener('click', function() {
	        	if (reviewWriteDiv.style.display === 'block') {
	        		reviewWriteDiv.style.display = 'none';
		        	overlay.style.display = 'none';
		        }
	        })
	    });
	});
</script>
</head>
<body>
	<img class="main_image" src="${placeDetail.vi_image}">
	<header class="header">
		<ul class="nav">
			<li>
				<h1 class="title">
					<a href="home" class="a_tag">제주여행</a>
				</h1>
			</li>
			<li class="nav_list"><a href="category_page.do?vi_value=관광지&option=option1"
				class="a_tag">관광지</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=음식점&option=option1"
				class="a_tag">음식점</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=숙박&option=option1"
				class="a_tag">숙박</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=쇼핑&option=option1"
				class="a_tag">쇼핑</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=축제/행사&option=option1"
				class="a_tag">축제/행사</a></li>
			<li class="nav_list"><a href="myTripPlan" class="a_tag">나의
					여행</a></li>
		</ul>

		<c:choose>
			<c:when test="${loginChk == 'ok'}">
				<ul class="nav-list__right" style="width: 600px;">
					<li>
						<form method="post" action="search">
							<div class="search-bar">
								<span class="material-symbols-outlined search-icon">search</span>
								<input class="search-field" type="text" name="keyword" value=""
									placeholder="검색어를 입력해주세요." /> <span
									class="material-symbols-outlined delete-icon"
									onclick="clearInput()">close</span>
							</div>
						</form>
					</li>
					<li>${userVO.u_name}님 환영합니다.</li>
					<li>|</li>
					<li><a href="logout_go.do" class="a_tag">로그아웃</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav-list__right" style="width: 500px;">
					<li>
						<form method="post" action="search">
							<div class="search-bar">
								<span class="material-symbols-outlined search-icon">search</span>
								<input class="search-field" type="text" name="keyword" value=""
									placeholder="검색어를 입력해주세요." /> <span
									class="material-symbols-outlined delete-icon"
									onclick="clearInput()">close</span>
							</div>
						</form>
					</li>
					<li><a href="login_go.do" class="a_tag">로그인</a></li>
					<li>|</li>
					<li><a href="join_go.do" class="a_tag">회원가입</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</header>

	<p class="place_name">${placeDetail.vi_title}</p>

	<table class="icons">
		<tbody>
			<tr class="icons-section">
				<td class="border-right"><span
					class="material-symbols-outlined icon">favorite</span></td>
				<td class="border-right"><span
					class="material-symbols-outlined icon">calendar_today</span></td>
				<td class="border-right"><span
					class="material-symbols-outlined icon">edit</span></td>
				<td class="border-right"><span
					class="material-symbols-outlined icon">mouse</span></td>
				<td class="no-border-right"><span
					class="material-symbols-outlined icon">link</span></td>
			</tr>
			<tr class="icons-section">
				<td class="icons-detail border-right">좋아요</td>
				<td class="icons-detail border-right">일정 추가</td>
				<td class="icons-detail border-right">리뷰</td>
				<td class="icons-detail border-right">조회수</td>
				<td class="icons-detail no-border-right">링크 복사</td>
			</tr>
			<tr class="icons-section">
				<td class="icons-number border-right"><fmt:formatNumber
						value="${likeNum}" pattern="#,##0" /></td>
				<td class="border-right"><input class="icons-button"
					type="button" value="추가하기" onclick="addSchedule()"></td>
				<td class="icons-number border-right"><fmt:formatNumber
						value="${reviewNum}" pattern="#,##0" /></td>
				<td class="icons-number border-right"><fmt:formatNumber
						value="${placeDetail.vi_hit}" pattern="#,##0" /></td>
				<td class="no-border-right"><input class="icons-button"
					type="button" value="복사하기" onclick="copyLink()"></td>
			</tr>
		</tbody>
	</table>

	<div>
		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">상세정보</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
			<div>
				<div id="map"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=227e2b54f64068104ae49efbe75cc7fe"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

					mapOption = {
						center : new kakao.maps.LatLng(${placeDetail.vi_latitude}, ${placeDetail.vi_longitude}), // 지도의 중심좌표
						level : 4
					// 지도의 확대 레벨
					};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					// 마커 표시하기
					// 마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(${placeDetail.vi_latitude}, ${placeDetail.vi_longitude});

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : markerPosition
					});

					marker.setMap(map);
					
					// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					var iwContent = '<div style="padding:5px;">${placeDetail.vi_title}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : iwContent,
						removable : iwRemoveable
					});

					// 마커에 mouseover 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseover', function() {
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);
					});
					
					// mouse나가면 인포윈도우 없애기
					kakao.maps.event.addListener(marker, 'mouseout', function() {
						// 마커 위에 인포윈도우를 제거
						infowindow.close();
					});
				</script>
			</div>
		</div>

		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">Q&A</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
			<!-- 내용 -->
			<div class="qa_title__section">
				<p class="qa_title">
					Q&A <span style="color: #FFBB36;">(${qaNum})</span>
				</p>
				<input class="write_button" type="button" value="질문작성">
			</div>
			<table class="qa_table">
				<thead>
					<tr>
						<td style="width: 10%">공개 여부</td>
						<td style="width: 40%">제목</td>
						<td style="width: 20%">작성자</td>
						<td style="width: 20%">작성일</td>
						<td style="width: 10%">답변 여부</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty qaList}">
							<tr>
								<td colspan="5" style="text-align: center;">Q&A가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${qaList}">
								<tr>
									<c:choose>
										<c:when test="${k.disclosure == '0'}">
											<td style="text-align: center;">공개</td>
											<td style="text-align: center;">${k.bo_title}</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: center;">비공개</td>
											<td style="text-align: center; color: #9E9E9E;">비밀글입니다.</td>
										</c:otherwise>
									</c:choose>
									<td style="text-align: center;">${k.bo_writer}</td>
									<td style="text-align: center;">${k.bo_regdate.substring(0,10)}</td>
									<c:choose>
										<c:when test="${k.active == '0'}">
											<td style="text-align: center;">N</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: center; color: #FFBB36;">Y</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- 페이징 -->
			<ol class="paging">
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${qaPaging.beginBlock <= qaPaging.pagePerBlock}">
						<li class="disable">이전</li>
					</c:when>
					<c:otherwise>
						<li><a class="able"
							href="detail?cPage=${qaPaging.beginBlock - qaPaging.pagePerBlock}&contentsid=${placeDetail.contentsid}">이전</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 페이지번호들 -->
				<c:forEach begin="${qaPaging.beginBlock}" end="${qaPaging.endBlock}"
					step="1" var="k">
					<c:choose>
						<c:when test="${k == qaPaging.nowPage}">
							<li class="now">${k}</li>
						</c:when>
						<c:otherwise>
							<li><a class="other_page"
								href="detail?cPage=${k}&contentsid=${placeDetail.contentsid}">${k}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 이후 버튼 -->
				<c:choose>
					<c:when test="${qaPaging.endBlock >= qaPaging.totalPage}">
						<li class="disable">다음</li>
					</c:when>
					<c:otherwise>
						<li><a class="able"
							href="detail?cPage=${qaPaging.beginBlock + qaPaging.pagePerBlock}&contentsid=${placeDetail.contentsid}">이전</a></li>
					</c:otherwise>
				</c:choose>
			</ol>
		</div>

		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">리뷰</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
			<!-- 내용 -->
			<div class="review_title__section">
				<p class="qa_title">
					리뷰 <span style="color: #FFBB36;">(${reviewNum})</span>
				</p>
				<input class="write_r_button" type="button" value="리뷰작성">
			</div>
			<hr class="hr">
			<c:choose>
				<c:when test="${empty reviewList}">
					<p style="text-align: center; font-family: 'NanumSquare'; font-size: 18px;">리뷰가
						존재하지 않습니다.</p>
					<hr class="hr">
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${reviewList}">
						<div class="review-content">
							<div class="review-content__left">
								<img style="width: 150px; height: 150px;" alt="프로필사진" src="resources/upload/${k.u_profile_img}">
								<p>${k.u_name}</p>
								<p>${k.re_regdate.substring(0,10)}</p>
								<c:choose>
									<c:when test="${k.re_grade == 1}">
										<span style="color: #FFDF6B;" class="star">★</span><span style="color: #f0f0f0;" class="star">★★★★</span>
									</c:when>
									<c:when test="${k.re_grade == 2}">
										<span style="color: #FFDF6B;" class="star">★★</span><span style="color: #f0f0f0;" class="star">★★★</span>
									</c:when>
									<c:when test="${k.re_grade == 3}">
										<span style="color: #FFDF6B;" class="star">★★★</span><span style="color: #f0f0f0;" class="star">★★</span>
									</c:when>
									<c:when test="${k.re_grade == 4}">
										<span style="color: #FFDF6B;" class="star">★★★★</span><span style="color: #f0f0f0;" class="star">★</span>
									</c:when>
									<c:otherwise>
										<span style="color: #FFDF6B;">★★★★★</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="review-content__right">
								<p>${k.re_content}</p>
								<c:if test="${not empty k.imageList}">
									<c:forEach var="j" items="${k.imageList}">
										<img style="width: 150px; height: 150px;" alt="사진" src="resources/upload/${j.pic_file}">
									</c:forEach>
								</c:if>
							</div>
						</div>
						<!-- <p>신고하기</p> 이거 css로 위치 맞추기 -->
						<hr class="hr">
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!-- Q&A 작성하는 영역 -->
	<form id="qa_write" method="post" action="qaWrite">
		<div class="qa_write__container" style="height: 510px;">
			<p class="qa_wrtie__title">Q&A 작성</p>
			<div class="qa_write__content">
				<table style="margin: 0 auto;">
					<tbody>
						<tr>
							<td>제목</td>
							<td colspan="2"><input style="width: 420px;" type="text"
								name="bo_title" required></td>
						</tr>
						<tr>
							<td style="width: 149px; text-align: center;">
								<div style="display: inline-block; margin-right: 7px;">
									<input type="radio" name="disclosure" value="0"
										onclick="handleDisclosure()" checked="checked">공개 <input
										type="radio" name="disclosure" value="1"
										onclick="handleDisclosure()">비공개
								</div>
							</td>
							<td style="width: 449px;">비밀번호 : <input
								style="width: 200px;" type="password" name="bo_pwd"
								disabled="disabled" id="passwordInput" required="required"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<textarea id="summernote" name="bo_content" maxlength="1000"></textarea>
			</div>
			<div class="qa_write__buttons">
				<input type="hidden" value="${userVO.u_idx}" name="u_idx"> <input
					type="hidden" value="${userVO.u_name}" name="u_name"> <input
					class="qa_write__button" type="reset" value="취소">
				<button type="button" class="qa_write__button"
					onclick="qaWrite(this.form)">등록</button>
			</div>
		</div>
	</form>

	<!-- 리뷰 작성하는 영역 -->
	<form id="review_write" method="post" action="reviewWrite" enctype="multipart/form-data">
		<div class="qa_write__container" style="height: 510px;">
			<p class="qa_wrtie__title">리뷰 작성</p>
			<p style="font-family: 'NanumSquare'; text-align: center;">별점을 입력해주세요.</p>
			<div class="qa_write__content">
				<fieldset>
					<input type="radio" name="re_grade" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="re_grade" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="re_grade" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="re_grade" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="re_grade" value="1" id="rate5"><label for="rate5">★</label>
				</fieldset>
					<br>
					<input id="review_images" type="file" name="images" multiple style="display: block; margin-left: 21px;">
					<p id="fileCountMessage" style="color: red; margin: 5px 0 0 21px; font-size: 13px;"></p> 
					<br>
					<textarea name="re_content" id="review-content" style="width: 600px; height: 200px; display: block; margin: 0 auto;" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="qa_write__buttons">
				<input type="hidden" value="${userVO.u_idx}" name="u_idx"> <input
					class="review_write__button" type="reset" value="취소">
				<button type="button" class="review_write__button"
					onclick="reviewWrite(this.form)">등록</button>
			</div>
		</div>
	</form>

	<div class="overlay"></div>
	<script type="text/javascript">
		// summernote
		$('#summernote').summernote({
			height : 200, // 에디터 높이
			width: 600,
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 1000자까지 쓸 수 있습니다', //placeholder 설정
			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['color', ['color']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	</script>

	<div>
		<button id="scrollToTopButton">
			<span class="material-symbols-outlined">expand_less</span>
		</button>
	</div>
	<img src="resources/common-image/chatbot.png" id="chatbot_image"
		class="chatbot_image">
	<div class="chatbot_modal">
		<%@include file="../common/chatbot.jsp"%>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
	// 클릭시에 한 번에 위로 올라가는 버튼
	window.onscroll = function() { scrollFunction() };

	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("scrollToTopButton").style.display = "block";
		} else {
			document.getElementById("scrollToTopButton").style.display = "none";
		}
	}

	document.getElementById("scrollToTopButton").addEventListener("click", () => {
		window.scrollTo({
			top: 0,
			left: 0,
			behavior: 'smooth'
		});
	})
	
	// summernote 내용 초기화
	var resetButton = document.querySelector('#qa_write input[type="reset"]');
    var summernoteTextarea = document.querySelector('#summernote');
    var passwordInput = document.getElementById('passwordInput');

    resetButton.addEventListener('click', function() {
        // summernote textarea 초기화
       $('#summernote').summernote('code', ''); // Summernote를 초기화하는 부분
       passwordInput.disabled = true;
    });
    
    // Q&A 공개 비공개
    function handleDisclosure() {
	    var disclosureValue = document.querySelector('input[name="disclosure"]:checked').value;
	    var passwordInput = document.getElementById('passwordInput');
		console.log(disclosureValue)
		console.log(passwordInput)
	    if (disclosureValue === '1') {
	        // 비밀번호 입력란을 활성화하고, 비밀번호 입력을 강제합니다.
	        passwordInput.disabled = false;
	        passwordInput.required = true;
	    } else {
	        // 비밀번호 입력란을 비활성화하고, 필수 입력이 아니도록 설정합니다.
	        passwordInput.disabled = true;
	        passwordInput.required = false;
	        passwordInput.value = '';
	    }
	}
    
    // Q&A 내용 입력안할 시에 alert 뜨기
    function qawWrite(f) {
	    var editorContent = $('#summernote').summernote('code');
	    var titleInput = document.querySelector('input[name="bo_title"]');
	    console.log(editorContent)
	    if (!editorContent.trim() || editorContent === '<p><br></p>') {
	        alert('내용을 입력해주세요.');
	        return false;
	    } else if (titleInput.value.trim() === '') {
	    	alert('제목을 입력해주세요.');
	        return false;
		} else {
	    	f.action = "qaWrite?contentsid=${placeDetail.contentsid}";
			f.submit();
	    }
	}
    
    // review 내용 입력안할 시에 alert 뜨기
    function reviewWrite(f) {
    	var reviewContent = document.getElementById('review-content').value.trim();
    	var reGradeChecked = document.querySelector('input[name="re_grade"]:checked');
	    
	    if (!reGradeChecked) {
	    	alert("별점을 선택해주세요.");
            return false;
	    } else if (!reviewContent) {
	    	alert("리뷰 내용을 작성해주세요.");
	        return false;
		} else {
	    	f.action = "reviewWrite?contentsid=${placeDetail.contentsid}";
			f.submit();
	    }
	}
    
    // review 사진 5장으로 제한
    document.getElementById('review_images').addEventListener('change', function(event) {
        const input = event.target;
        const fileCountMessage = document.getElementById('fileCountMessage');

        if (input.files.length > 5) {
            fileCountMessage.textContent = '사진은 최대 5장까지만 첨부가 가능합니다.';
            input.value = ''; // Clear the input
        } else {
            fileCountMessage.textContent = ''; // Clear any previous messages
        }
    });
</script>
</body>

</html>