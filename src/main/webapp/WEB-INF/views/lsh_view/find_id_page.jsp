<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FiND_ID | Jeju_travel</title>
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/find_id.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function findID_ok(f) {
				if (f.u_name.value === '') {
					alert("이름을 입력하세요");
					f.u_name.focus();
					return false;
				} else if (f.u_email.value === '') {
					alert("이메일을 입력하세요");
					f.u_email.focus();
					return false;
				} else if (!/^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$/.test(f.u_email.value)) {
					alert("이메일 형식을 확인하세요.");
					return false;
				} 
				f.action="findID_ok.do";
				f.submit();
			}
			function back() {
				window.history.back();
			}
		</script>
		<style type="text/css">
			.find_id_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			}
			.find_id_container {
				position: relative;
			  	z-index: 1;
			  	background: white;
			  	max-width: 360px;
			  	max-height: 450px;
			  	margin: 0 auto 150px;
			  	padding: 45px;
			  	text-align: center;
			  	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="find_id_page">
			<div class="find_id_container">
				<form method="post">
				<h3 class="find_id_text">아이디 찾기</h3>
					<div class="find_id_box">
						<ul>
							<li>
								<input type="text" id="u_name"  name="u_name" placeholder="Name" required>
							</li>
							<li>
								<input type="email" id="u_email" name="u_email" placeholder="E-Mail"  
											pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" required>
							</li>
							<li>
								<input type="button" class="find_id_btn" value="find your ID" onclick="findID_ok(this.form)">
							</li>
							<li>
								<input type="button" class="find_id_btn" onclick="back()" value="Cancel">
							</li>
						</ul>
					</div>
					
					<div class="find_id_link_box">
						<a href="login_go.do" >Login &nbsp; | </a> 
						<a href="findpwd_go.do" >find your Password</a>
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>

