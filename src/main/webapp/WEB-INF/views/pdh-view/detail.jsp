<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>DETAIL | Jeju_travel</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico"
	type="image/x-icon">
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
<link rel="stylesheet" href="resources/common-css/chatbot.css" />

<style type="text/css">
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}
</style>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- summernote -->
<script src="/resources/common-js/summernote-ko-KR.min.js"></script>
<script src="/resources/common-js/summernote-lite.js"></script>
<link rel="stylesheet" href="/resources/common-css/summernote-lite.css">
<script>
    // 페이지 로드 시 history.scrollRestoration을 'manual'로 설정
    history.scrollRestoration = 'manual';
    document.addEventListener('DOMContentLoaded', function() {
        let cPage = "${cPage}"
        let rCPage = "${rCPage}"
        if (cPage != "" || rCPage != "") {
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
	
	// q&a영역, review영역, 신고영역 버튼 클릭할 때 보이게 하기
	document.addEventListener('DOMContentLoaded', function() {
	    var writeButton = document.querySelector('.write_button');
	    var reviewButton = document.querySelector('.write_r_button');
	    var reportButtons= document.querySelectorAll('.report-button');
	    var qaWriteDiv = document.getElementById('qa_write');
	    var reviewWriteDiv = document.getElementById('review_write');
	    var reportWriteDiv = document.getElementById('report_write');
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
	    
	    reportButtons.forEach(function(button) {
	    	button.addEventListener('click', function() {
		    	// input type의 hidden의 value 바꾸기
				var reIdx = this.nextElementSibling;
		    	var uIdx = reIdx.nextElementSibling;
		    	let reIdx_v = reIdx.value
		    	let uIdx_v = uIdx.value
				var realReIdx = document.querySelector('.reIdx');
				var mIdx = document.querySelector('.mIdx');
				realReIdx.value = reIdx_v;
				mIdx.value = uIdx_v;
		        // 요소의 display를 토글
		        if ("${userVO}" == "") {
					alert("로그인 후 이용 가능합니다.")
					location.href="login_go.do"
					return 
				} else {
			        if (reportWriteDiv.style.display === 'block') {
			        	reportWriteDiv.style.display = 'none';
			        	overlay.style.display = 'none';
			        } else {
			        	reportWriteDiv.style.display = 'block';
			        	overlay.style.display = 'block';
			        }
				}
		        overlay.addEventListener('click', function() {
		        	if (reportWriteDiv.style.display === 'block') {
		        		reportWriteDiv.style.display = 'none';
			        	overlay.style.display = 'none';
			        }
		        })
		    });
	    });
	});
	
	function goWishlist() {
		var wish = document.querySelector('.favorite');
		
		if ("${userVO}" == "") {
			alert("로그인 후 이용 가능합니다.")
			location.href="login_go.do"
		} else {
			// 스타일이 이미 적용되어 있는지 확인
	        if (wish.style.fontVariationSettings === '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400') {
	            // 이미 스타일이 적용되어 있다면 다른 스타일로 변경 또는 제거
	            wish.style.fontVariationSettings = '';
	            console.log("${placeDetail.contentsid}")
	            alert("좋아요한 여행지에서 제거되었습니다.");
	            location.href = "removeWish?contentsid=${placeDetail.contentsid}";
	        } else {
	            // 스타일이 적용되어 있지 않다면 스타일 적용
	            wish.style.fontVariationSettings = '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400';
	            console.log("${placeDetail.contentsid}")
	            alert("좋아요한 여행지에 추가되었습니다.");
	            location.href = "addWish?contentsid=${placeDetail.contentsid}";
	        }
		}
	}
	
</script>
</head>
<body>
	<img class="main_image" src="${placeDetail.vi_image}">
	
	<!-- 헤더 -->
	<%@include file="../pdh-view/detailHeader.jsp"%>

	<p class="place_name">${placeDetail.vi_title}</p>

	<table class="icons">
		<tbody>
			<tr class="icons-section">
				<td class="border-right"><span
					class="material-symbols-outlined icon favorite" onclick="goWishlist()">favorite</span></td>
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
					type="button" value="추가하기" onclick="openModal(${placeDetail.contentsid})"></td>
				<td class="icons-number border-right"><fmt:formatNumber
						value="${reviewNum}" pattern="#,##0" /></td>
				<td class="icons-number border-right"><fmt:formatNumber
						value="${placeDetail.vi_hit}" pattern="#,##0" /></td>
				<td class="no-border-right"><input class="icons-button"
					type="button" value="복사하기" onclick="copyLink()"></td>
			</tr>
		</tbody>
	</table>

	<!-- 상세정보 보여주는 영역 -->
	<%@include file="../pdh-view/detailContent.jsp"%>
		
	<!-- Q&A 내용 보여주는 영역 -->
	<%@include file="../pdh-view/qnaContent.jsp"%>
	
	<!-- 리뷰 내용 보여주는 영역 -->
	<%@include file="../pdh-view/reviewContent.jsp"%>
	
	<!-- Q&A 내용 작성하는 영역 -->
	<%@include file="../pdh-view/qnaWrite.jsp"%>
	
	<!-- 리뷰 내용 작성하는 영역 -->
	<%@include file="../pdh-view/reviewWrite.jsp"%>
	
	<!-- 신고 내용 작성하는 영역 -->
	<%@include file="../pdh-view/reportWrite.jsp"%>
	
	<!-- 일정 추가하는 영역 -->
	<%@include file="../pdh-view/addSchedule.jsp"%>

	<!-- 뒷배경용 div -->
	<div class="overlay"></div>
	
	<!-- 탑버튼 -->
	<div>
		<button id="scrollToTopButton">
			<span class="material-symbols-outlined">expand_less</span>
		</button>
	</div>
	
	<!-- 챗봇 -->
	<img src="resources/common-image/chatbot.png" id="chatbot_image"
		class="chatbot_image">
	<div class="chatbot_modal">
		<%@include file="../common/chatbot.jsp"%>
	</div>
	
	<!-- footer -->
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
    function qaWrite(f) {
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
	    	alert("질문이 등록되었습니다.")
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
	    	alert("리뷰 작성이 완료되었습니다.")
			f.submit();
	    }
	}
    
    // 신고 내용 입력안할 시에 alert 뜨기
    function reportWrite(f) {
    	var reportContent = document.getElementById('report_content').value.trim();
    	var reportTitle = document.getElementById('report_title').value.trim();
    	var reporter = ${userVO.u_idx};
    	var reported = f.querySelector(".qa_write__buttons").querySelector(".mIdx").value;
	    
    	if (reporter == reported) {
			alert("본인의 리뷰는 신고할 수 없습니다.");
			return false;
		} else {
		    if (!reportTitle) {
		    	alert("제목을 입력해 주세요.");
	            return false;
		    } else if (!reportContent) {
		    	alert("신고 내용을 작성해주세요.");
		        return false;
			} else {
		    	f.action = "reportWrite?contentsid=${placeDetail.contentsid}";
		    	alert("신고가 완료되었습니다.")
				f.submit();
		    }
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
    
    // 리뷰, 신고 글자 수 제한하기
    document.addEventListener('DOMContentLoaded', function() {
    	const form = document.getElementById('review_write');
    	const reportForm = document.getElementById('report_write');
        const textarea = document.getElementById('review-content');
        const reportTextarea = document.getElementById('report_content');
        const charCount = document.getElementById('charCount');
        const charCount2 = document.getElementById('charCount2');
        const maxLength = 350; // 최대 문자 수 제한
        const maxLength2 = 500; // 최대 문자 수 제한
        
        function updateCharCount() {
            const text = textarea.value;
            if (text.length > maxLength) {
                textarea.value = text.substring(0, maxLength); // 최대 문자 수를 초과하면 자르기
            }
            charCount.textContent = textarea.value.length + "/" + maxLength;
        }

        textarea.addEventListener('input', updateCharCount);

        form.addEventListener('reset', function() {
            setTimeout(updateCharCount, 0); // reset 이벤트 후에 문자 수를 업데이트
        });
        
        function updateCharCount2() {
            const text = reportTextarea.value;
            if (text.length > maxLength2) {
            	reportTextarea.value = text.substring(0, maxLength2); // 최대 문자 수를 초과하면 자르기
            }
            charCount2.textContent = reportTextarea.value.length + "/" + maxLength2;
        }

        reportTextarea.addEventListener('input', updateCharCount2);

        form.addEventListener('reset', function() {
            setTimeout(updateCharCount2, 0); // reset 이벤트 후에 문자 수를 업데이트
        });
        
    });

</script>
</body>

</html>