<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>아이디 찾기</title>
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
		</script>
	</head>
	<body>
		<section>
			<div>
				<form method="post">
					<table>
						<thead>
							<tr>
								<td>아이디 찾기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" id="u_name"  name="u_name" placeholder="이름을 입력하세요" required>
								</td>
								<td>
									<input type="email" id="u_email" name="u_email" placeholder="가입하신 이메일을 입력하세요"  
										pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" required>
								</td>
								<td>
									<input type="button" value="아이디 찾기" onclick="findID_ok(this.form)">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div>
				<a href="login_go.do">로그인</a> | 
				<a href="findpwd_go.do">비밀번호 찾기</a>
			</div>
		</section>
	</body>
</html>


