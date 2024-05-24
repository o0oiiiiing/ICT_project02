<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 대시보드</title>
<!-- 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="resources/ygh-css/css/styles.css" rel="stylesheet" />
<link href="resources/ygh-css/admin_bar.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', () => {
	    const lastUpdatedElement = document.getElementById('lastUpdated');
	    if (lastUpdatedElement) {
	        const currentDate = new Date();
	        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', timeZone: 'Asia/Seoul' };
	        const formattedDate = currentDate.toLocaleDateString('ko-KR', options);
	        lastUpdatedElement.textContent = '최종 업데이트: ' + formattedDate;
	    }
	}, { once: true }); // 한 번만 실행되도록 옵션 추가
</script>
</head>
<body class="sb-nav-fixed">
	<%@include file="../common/header.jsp"%>

	<div id="menubar">
		<h1>나의 여행(관리자)</h1>
		<table>
			<tr>
				<td><span class="material-symbols-outlined">finance</span><br><a href="dashboard.do">대시보드</a></td>
				<td><span class="material-symbols-outlined">manage_accounts</span><br><a href="user_list.do">회원관리</a></td>
				<td><span class="material-symbols-outlined">mark_chat_read</span><br><a href="admin_list2.do">답변</a></td>
				<td><span class="material-symbols-outlined">mark_chat_unread</span><br><a href="admin_list.do">미답변</a></td>
				<td><span class="material-symbols-outlined">calendar_add_on</span><br><a href="admin_insert">일정 추가</a></td>
				<c:if test="${adminVO.a_status == '1'}">
					<td><span class="material-symbols-outlined">person_add</span><br><a href="admin_join.do">관리자 생성</a></td>
				</c:if>
			</tr>
		</table>
	</div>
	 
	
	<div id="inner_body">
		<aside class="side_bar js-side_bar">
			<ul>
				<li><span class="material-symbols-outlined">finance</span><a href="dashboard.do">대시보드</a></li>
				<li><span class="material-symbols-outlined">manage_accounts</span><a href="user_list.do">회원관리</a></li>
				<li><span class="material-symbols-outlined">mark_chat_read</span><a href="admin_list2.do">답변</a></li>
				<li><span class="material-symbols-outlined">mark_chat_unread</span><a href="admin_list.do">미답변</a></li>
				<li><span class="material-symbols-outlined">calendar_add_on</span><a href="admin_insert">일정 추가</a></li>
				<c:if test="${adminVO.a_status == '1'}">
					<li><span class="material-symbols-outlined">person_add</span><a href="admin_join.do">관리자 생성</a></li>
				</c:if>
			</ul>
		</aside>
	</div>
	

	<div id="layoutSidenav_content">
		<main class="container-fluid px-4">
			<div class="container-comment">
				<h1 class="mt-4">관리자 대시보드</h1>
				<h1 id="lastUpdated"></h1>
			</div>

			<div class="row ">
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-pie me-1"></i> 회원 현황
						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="60"></canvas>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> 일일 가입자 수
						</div>
						<div class="card-body">
							<canvas id="dailyVisitsChart" width="100%" height="60"></canvas>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<%@include file="../common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/ygh-css/assets/demo/chart-area-demo.js"></script>
	<script src="resources/ygh-css/assets/demo/chart-pie-demo.js"></script>
</body>
</html>
