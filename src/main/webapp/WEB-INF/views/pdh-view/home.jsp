<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>HOME | Jeju_travel</title>
<!-- 구글 아이콘 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 적용 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="resources/pdh-css/home.css" />
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css" />
<link rel="stylesheet" href="resources/common-css/reset.css" />
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
<script type="text/javascript">
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

// 경화 날씨api
$(document).ready(function() {
    $.ajax({
        url: "weather.do",           // 서버주소
        method: "post",             // 전달방식
        dataType: "xml",            // 가져오는 결과 타입
        success: function(data) {
            let table = "<table>";
            table += "<tbody>";

            $(data).find("local").each(function() {
                let stn_id = $(this).attr("stn_id");
                let icon = $(this).attr("icon");

                // stn_id가 184인 경우에만 icon을 가져와서 표시
                if (stn_id === "184") {
                    table += "<tr>";
                    table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB" + icon + ".png'></td>";
                    table += "</tr>";
                }
            });
            table += "</tbody>";
            table += "</table>"
            $("#weather").append(table);
        },
        error: function() {
            alert("읽기 실패");
        }
    });
});
</script>

</head>

<body>
	<img class="main_image" src="resources/pdh-image/main01.jpg">
	<header class="header">
		<ul class="nav">
			<li>
				<h1 class="title">
					<a href="home" class="a_tag">제주여행</a>
				</h1>
			</li>
			<li class="nav_list"><a href="category_page.do?vi_value=관광지" class="a_tag">관광지</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=음식점" class="a_tag">음식점</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=숙박" class="a_tag">숙박</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=쇼핑" class="a_tag">쇼핑</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=축제/행사" class="a_tag">축제/행사</a></li>
			<li class="nav_list"><a href="myTripPlan" class="a_tag">나의 여행</a></li> 
			<li class="nav_list"><a href="admin_list.do" class="a_tag">관리자 게시판</a></li> 
		</ul>
		
		<!-- 경화 날씨api -->
		<span id="weather" style="background-color: white; height: 100%"></span>
		
		<ul class="nav-list__right">
			<li>
				<form method="post" action="search">
					<div class="search-bar">
						<span class="material-symbols-outlined icon">search</span> 
						<input class="search-field" type="text" name="keyword" value="" placeholder="검색어를 입력해주세요." />
						<span class="material-symbols-outlined delete-icon" onclick="clearInput()">close</span>
					</div>
				</form>
			</li>
			<li><a href="login_go.do">로그인</a></li>
			<li>|</li>
			<li><a href="join_go.do">회원가입</a></li>
		</ul>
		<c:choose>
			<c:when test="${loginChk == 'ok'}">
				<ul class="nav-list__right" style="width: 600px;">
					<li>
						<form method="post" action="search">
							<div class="search-bar">
								<span class="material-symbols-outlined icon">search</span> <input
									class="search-field" type="text" name="keyword" value=""
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
								<span class="material-symbols-outlined icon">search</span> <input
									class="search-field" type="text" name="keyword" value=""
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

	<div class="popular__container">
		<div class="place__container">
			<ul class="place__list">
				<li class="place__title"><p>현재 인기있는 장소</p></li>
				<c:choose>
					<c:when test="${empty popularList}">
						목록이 존재하지 않습니다.
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${popularList}">
							<li class="place"><a
								href="detail?contentsid=${k.contentsid}"> <img alt="장소"
									src="${k.vi_image}">
									<p style="font-weight: bold;">${k.vi_title}</p> <c:choose>
										<c:when test="${k.vi_category == 'c1'}">
											<p>관광지</p>
										</c:when>
										<c:when test="${k.vi_category == 'c2'}">
											<p>쇼핑</p>
										</c:when>
										<c:when test="${k.vi_category == 'c3'}">
											<p>숙소</p>
										</c:when>
										<c:when test="${k.vi_category == 'c4'}">
											<p>음식</p>
										</c:when>
										<c:otherwise>
											<p>축제/행사</p>
										</c:otherwise>
									</c:choose>
									<p>
										조회수 :
										<fmt:formatNumber value="${k.vi_hit}" pattern="#,##0" />
									</p>
							</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<img src="resources/common-image/chatbot.png" id="chatbot_image"
		class="chatbot_image">
	<div class="chatbot_modal">
		<%@include file="../common/chatbot.jsp"%>
	</div>
	<%@ include file="../common/footer.jsp"%>

	<div>
		<button id="scrollToTopButton">
			<span class="material-symbols-outlined">expand_less</span>
		</button>
	</div>
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
	</script>

</body>
</html>