<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 대시보드</title>
<link rel="stylesheet" href="/resources/ygh-css/css/styles.css" />
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
<body>
	<%@include file="../common/header.jsp"%>

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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="/resources/ygh-css/assets/demo/chart-area-demo.js"></script>
	<script src="/resources/ygh-css/assets/demo/chart-pie-demo.js"></script>
</body>
</html>
