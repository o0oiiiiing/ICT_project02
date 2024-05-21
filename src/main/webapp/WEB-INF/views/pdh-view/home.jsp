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
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- 폰트 적용 -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="resources/pdh-css/home.css" />
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css" />
<link rel="stylesheet" href="resources/common-css/reset.css" />
<link rel="stylesheet" href="resources/common-css/chatbot.css" />
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

// 날씨
$(document).ready(function() {
    $(".weather_image").click(function() {
        $(".weather_modal").toggle();  
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
			<li class="nav_list"><a href="category_page.do?vi_value=관광지&option=option1" class="a_tag">관광지</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=음식점&option=option1" class="a_tag">음식점</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=숙박&option=option1" class="a_tag">숙박</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=쇼핑&option=option1" class="a_tag">쇼핑</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=축제/행사&option=option1" class="a_tag">축제/행사</a></li>
			<c:if test="${admin_loginChk != 'ok'}">
				<li class="nav_list"><a href="myTripPlan" class="a_tag">나의 여행</a></li>
			</c:if>
			<c:if test="${admin_loginChk == 'ok'}">
				<li class="nav_list"><a href="admin_list.do" class="a_tag">관리자 게시판</a></li> 
			</c:if>
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
				<c:choose>
					<c:when test="${admin_loginChk == 'ok'}">
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
							<li>${adminVO.a_name}님 환영합니다.</li>
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
			</c:otherwise>
		</c:choose>
	</header>

	<!-- 팝업1 -->
<div id="pop_info_1" class="pop_wrap" name="popup1">
  <div class="pop_inner">
    <p class="dsc1">실시간 추천 관광지</p>
    <br>
  	<img src="${randomTour.vi_image}" style="width: 500px; height: 350px;">
    <a href="detail?contentsid=${randomTour.contentsid}" class="dsc"><${randomTour.vi_title}> 바로가기</a>
    <br><br>
    <input type="checkbox" name="today_close1" />오늘만 이 창을 열지 않음
    <button type="button" class="btn_close">X</button>
  </div>
</div>

<!-- 팝업2 -->
<div id="pop_info_2" class="pop_wrap" name="popup2">
  <div class="pop_inner">
    <p class="dsc1">실시간 추천 음식점</p>
    <br>
  	<img src="${randomRestaurant.vi_image}" style="width: 500px; height: 350px;">
    <a href="detail?contentsid=${randomRestaurant.contentsid}" class="dsc"><${randomRestaurant.vi_title}> 바로가기</a>
    <br><br>
    <input type="checkbox" name="today_close1" />오늘만 이 창을 열지 않음
    <button type="button" class="btn_close">X</button>
  </div>
</div>

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
									<p style="font-weight: bold;">${k.vi_title}</p>
										<c:choose>
											<c:when test="${k.vi_value == '관광지'}">
												<p>관광지</p>
											</c:when>
											<c:when test="${k.vi_value == '쇼핑'}">
												<p>쇼핑</p>
											</c:when>
											<c:when test="${k.vi_value == '숙박'}">
												<p>숙박</p>
											</c:when>
											<c:when test="${k.vi_value == '음식점'}">
												<p>음식점</p>
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
	
	<img src="resources/common-image/chatbot.png" id="chatbot_image" class="chatbot_image">
	<div class="chatbot_modal">
		<%@include file="../common/chatbot.jsp"%>
	</div>
	
	<!-- 날씨 -->
	<img src="resources/common-image/weather.png" id="weather_image" class="weather_image">
	<div class="weather_modal">
		<%@include file="../ygh-view/weather.jsp"%>
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
	 <script type="text/javascript">
        $(document).ready(function () {
            // 팝업창에 주어진 이름을 변수로 던져 저장된 쿠키가 있는지 확인         
            var popup1 = getCookie('popup1');
            var popup2 = getCookie('popup2');

            // 변수가 없을경우 팝업 출력         
            if (!popup1) {
                popUpAction('popup1');
            }

            // 변수가 없을경우 팝업 출력 
            if (!popup2) { popUpAction('popup2'); }

        });

        // 쿠키 가져오기 

        function getCookie(name) {
            var nameOfCookie = name + "=";
            var x = 0; while (x <= document.cookie.length) {
                var y = (x + nameOfCookie.length);
                if (document.cookie.substring(x, y) == nameOfCookie) {
                    if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                        endOfCookie = document.cookie.length;
                    return unescape(document.cookie.substring(y, endOfCookie));
                }
                x = document.cookie.indexOf(" ", x) + 1; if (x == 0)
                    break;
            }
            return "";
        }

     // 24시간 기준 쿠키 설정하기 
     // expiredays 후의 클릭한 시간까지 쿠키 설정 
     function setCookie24(name, value, expiredays) {
         var todayDate = new Date();
         var expireDate = new Date(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000)); // 현재 시간에 expiredays 일수를 더해 만료일을 계산
         document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expireDate.toGMTString() + ";";
     }


        // 팝업출력
        function popUpAction(name) {
            // name으로 해당 팝업창 열기 
            $("div[name=" + name + "]").fadeIn();
        }

        $('.btn_close').click(function () {
            console.log("닫기 버튼 클릭됨");
            $(this).closest('.pop_wrap').fadeOut(); // 팝업 숨기기
            // 오늘하루 보지않기 체크 확인 
            if ($("input:checkbox[name=today_close1]").is(":checked") == true) {
                setCookie24('popup1', "done", 1);
            }

            // 오늘하루 보지않기 체크 확인
            if ($("input:checkbox[name=today_close2]").is(":checked") == true) {
                setCookie24('popup2', "done", 1);
            }
        });

    </script>
</body>
</html>