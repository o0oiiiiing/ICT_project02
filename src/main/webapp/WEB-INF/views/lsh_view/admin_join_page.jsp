<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>관리자 생성</title>
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/join.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function back() {
				window.history.back();
			}
			
			// 아이디 중복 여부
			let adminChk = false;
			function admin_chk() {
				$.ajax({
					url : "admin_chk.do",
					data : "a_id="+$("#a_id").val(), 
					method : "post", 	
					dataType : "text",
					success : function(data) {
						if (data === '1') {
							alert("사용 가능");
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
				if (a_pwd.value == a_pwdchk.value) {
					msg.style.color = ok;
					msg.innerHTML = "비밀번호가 일치합니다."
				} else {
					msg.style.color = no;
					msg.innerHTML = "비밀번호가 일치하지 않습니다."
				}
			}
			
			// 유효성검사
			function admin_join_ok(f) {
				if (f.a_id === '' || f.a_pwd === '' || f.a_pwdchk === '' || f.a_name === '' || f.a_email === '' || f.a_phone === '') {
					alert("필수 항목을 입력하세요.");
					return false;
				} else if (! adminChk) {
					alert("아이디 중복 확인을 해주세요.");
					f.idChk.focus();
			        return false;
				} else if (f.a_phone.value.length !== 11) {
					alert("전화번호는  '-'을 제외한 11자리로 입력하세요.");
					f.u_phone.focus();
					return false;
				} else if (!/^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$/.test(f.a_email.value)) {
					alert("이메일 형식을 확인하세요.");
					return false;
				}
				f.action = "admin_join_ok.do";
				f.submit();
			}
			
			function chk_disabled() {
				let a_id = document.getElementById('a_id').value;
				let a_idchk = document.getElementById('a_idchk');
				if (a_id === '') {
					a_idchk.disabled = true;
				} else {
					a_idchk.disabled = false;
				}
			}
			window.onload = function() {
				chk_disabled(); 
		        document.getElementById("a_id").addEventListener("input", chk_disabled);
		    };
		</script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="join_page">
			<div class="join_container">
				<form method="post">
					<h3 class="join_text">관리자 생성</h3>
						<div class="join_box">
							<ul>
								<li>
									<input type="text"  id="a_id" name="a_id" required placeholder="아이디"/>
									<input type="button" class="join_btn" id="a_idchk"  value="중복 확인" onclick="admin_chk()" disabled />
								</li>
								<li>
									<input type="password" id="a_pwd" name="a_pwd" required placeholder="비밀번호" />
								</li>
								<li>
									<input type="password" id="a_pwdchk" name="a_pwdchk" required oninput="pwdchk_go()" placeholder="비밀번호 확인" />
									<span id="msg" ></span>
								</li>
								<li class="join_li_box" >
									<input type="text" id="a_name" name="a_name" required placeholder="이름"/>
								</li>
								<li>
									<input type="email" id="a_email" name="a_email" required 
												pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" placeholder="이메일"/>
								</li>
								<li>
									<input type="text" id="a_phone" name="a_phone" required placeholder="전화번호"/>
								</li>
							</ul>
					</div>
					
					<div>
						<input type="button" class="join_ok_btn" onclick="admin_join_ok(this.form)" value="생성">
						<input type="button" class="join_ok_btn" onclick="back()" value="취소">
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>