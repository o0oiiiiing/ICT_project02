<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ADMIN | Jeju_travel</title>
<!-- 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="resources/common-css/reset.css" rel="stylesheet" />
<link href="resources/lsh_css/admin_join.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function go_main() {
		location.href = "home";
	}

	// 아이디 중복 여부
	let adminChk = false;
	function admin_chk() {
		$.ajax({
			url : "admin_chk.do",
			data : "a_id=" + $("#a_id").val(),
			method : "post",
			dataType : "text",
			success : function(data) {
				if (data === '1') {
					alert("사용 가능한 아이디입니다.");
					adminChk = true;
				} else if (data === '0') {
					alert("이미 사용중인 아이디입니다.");
					adminChk = false;
				}
			},
			error : function() {
				alert("읽기 실패");
				adminChk = false;
			}
		});
	}

	// 비밀번호 확인
	function pwdchk_go() {
		let a_pwd = document.getElementById('a_pwd');
		let a_pwdchk = document.getElementById('a_pwdchk');
		let msg = document.getElementById('msg');

		let ok = "green";
		let no = "red";
		
		document.getElementById('a_pwd').addEventListener('input', pwdchk_go);
		if (a_pwd.value.length < 6) {
			msg.style.color = no;
			msg.style.fontSize = "12px";
	        msg.style.fontWeight = "bold";
			msg.innerHTML = "비밀번호는 6자리 이상으로 입력하세요.";
		} else if (a_pwd.value === a_pwdchk.value && a_pwdchk.value !== '') {
			msg.style.color = ok;
			msg.style.fontSize = "12px";
	        msg.style.fontWeight = "bold";
			msg.innerHTML = "비밀번호가 일치합니다."
		} else {
			msg.style.color = no;
			msg.style.fontSize = "12px";
	        msg.style.fontWeight = "bold";
			msg.innerHTML = "비밀번호가 일치하지 않습니다."
		}
	}

	// 유효성검사
	function admin_join_ok(f) {
		if (f.a_id === '' || f.a_pwd === '' || f.a_pwdchk === ''
				|| f.a_name === '' || f.a_email === '' || f.a_phone === '') {
			alert("필수 항목을 입력하세요.");
			return false;
		} else if (f.a_id.value === '') {
			alert("아이디를 입력하세요.");
			f.a_id.focus();
			return false;
		} else if (!adminChk) {
			alert("아이디 중복 확인을 해주세요.");
			f.idChk.focus();
			return false;
		} else if (f.a_pwd.value === '') {
			alert("비밀번호를 입력하세요.");
			f.a_pwd.focus();
			return false;
		} else if (f.a_name.value === '') {
			alert("이름을 입력하세요.");
			f.a_name.focus();
			return false;
		} else if (!/^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$/
				.test(f.a_email.value)) {
			alert("이메일 형식을 확인하세요.");
			f.a_email.focus();
			return false;
		} else if (f.a_phone.value.length !== 11) {
			alert("전화번호는  '-'을 제외한 11자리로 입력하세요.");
			f.a_phone.focus();
			return false;
		}
		f.action = "admin_join_ok.do";
		f.submit();
	}

	function chk_disabled() {
		let a_id = document.getElementById('a_id').value;
		let a_idchk = document.getElementById('a_idchk');
		let basic = "lightgray";
		let empty = "#b6dedc";
		if (a_id === '') {
			a_idchk.style.background = basic;
			a_idchk.disabled = true;
		} else if (a_id.length < 4) {
			a_idchk.style.background = basic;
			a_idchk.disabled = true;
		} else {
			a_idchk.style.background = empty;
			a_idchk.disabled = false;
		}
	}

	window.onload = function() {
		chk_disabled();
		document.getElementById("a_id").addEventListener("input", chk_disabled);
	};
</script>
<style type="text/css">
.admin_join_page {
	padding: 2% 0 0;
	margin: auto;
	width: 100%;
	height: 600px;
	font-family: 'NanumSquare';
}

.admin_join_container {
	position: relative;
	z-index: 1;
	background: white;
	max-width: 360px;
	max-height: 450px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	overflow: auto;
}

.admin_join_container::-webkit-scrollbar {
	width: 7px;
}

.admin_join_container::-webkit-scrollbar-thumb {
	height: 30%;
	background: #a5deeb;
	border-radius: 10px;
}

.admin_join_container::-webkit-scrollbar-track {
	background: rgba(33, 122, 244, .1);
}
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<%@include file="../ygh-view/admin_bar.jsp"%>

	<section class="admin_join_page">
		<div class="admin_join_container">
			<form method="post">
				<h3 class="admin_join_text">ADMIN | Sign UP</h3>
				<div class="admin_join_box">
					<ul>
						<li><input type="text" id="a_id" name="a_id" required
							placeholder="ID" /> <input type="button" class="admin_join_btn"
							id="a_idchk" value="중복 확인" onclick="admin_chk()" disabled /></li>
						<li><input type="password" id="a_pwd" name="a_pwd" required
							placeholder="Password" /></li>
						<li><input type="password" id="a_pwdchk" name="a_pwdchk"
							required oninput="pwdchk_go()" placeholder="Password Check" /> <span
							id="msg"></span></li>
						<li class="admin_join_li_box"><input type="text" id="a_name"
							name="a_name" required placeholder="Name" /></li>
						<li><input type="email" id="a_email" name="a_email" required
							pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*"
							placeholder="E-Mail" /></li>
						<li><input type="text" id="a_phone" name="a_phone" required
							placeholder="Phone" /></li>
					</ul>
				</div>

				<div>
					<input type="button" class="admin_join_ok_btn"
						onclick="admin_join_ok(this.form)" value="Create Admin_account">
					<input type="button" class="admin_join_ok_btn" onclick="go_main()"
						value="Cancel">
				</div>
			</form>
		</div>
	</section>
	<%@include file="../common/footer.jsp"%>
</body>
</html>