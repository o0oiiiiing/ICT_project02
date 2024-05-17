<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FiND_ID | Jeju_travel</title>
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
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="find_id_page">
			<div class="find_id_container" style="opacity: 0.9; height: 400px;">
				<form method="post">
				<h3 class="find_id_text">아이디 찾기</h3>
					<div class="find_id_box">
						<ul>
							<li>
								<input type="text" id="u_name"  name="u_name" placeholder="이름을 입력하세요" required>
							</li>
							<li>
								<input type="email" id="u_email" name="u_email" placeholder="가입하신 이메일을 입력하세요"  
											pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" required>
							</li>
							<li>
								<input type="button" class="find_id_btn" value="아이디 찾기" onclick="findID_ok(this.form)">
							</li>
							<li>
								<input type="button" class="find_id_btn" onclick="back()" value="Cancel">
							</li>
						</ul>
					</div>
					
					<div class="find_id_link_box">
						<a href="login_go.do" >로그인 &nbsp; &nbsp; | </a> 
						<a href="findpwd_go.do" >비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>

