<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function login_ok(f) {
				if (f.id.value === '' || f.pwd.value === '' ){
		            alert("다시 입력하세요");
		            return;
		    	}
				f.action="login_ok.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<section>
			<div class="login_box">
				<form method="post">
					<table>
						<thead class="login_header">
							<tr>
								<td>로그인</td>
							</tr>
						</thead>
						<tbody class="login_body">
							<tr>
								<td>
									<input type="text"  id="id" name="u_id" placeholder="아이디" required>
								</td>
								<td>
									<input type="password" id="pwd" name="u_pwd" placeholder="비밀번호" required>
								</td>
								<td>
									<input type="hidden" name="u_idx" value="${u_idx}" >
									<input type="button" value="로그인" onclick="login_ok(this.form)">
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="anyitems_box">
						<a href="findID_go.do">아이디 찾기</a> | 
						<a href="findpwd_go.do">비밀번호 찾기</a> &nbsp;&nbsp;&nbsp;
						<a href="join_go.do">회원가입</a> 
						<a href="logout_go.do">로그아웃</a> 
					</div>
					
					<div class="sns_login_box">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=e6360ca36b4fb9784b213174df6b6022&redirect_uri=http://localhost:8090/kakaologin.do&response_type=code">
							<img src="resources/images/kakao_login_medium_narrow.png" width="160px">
						</a>
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=y0uYS0PIjookcvhFn2xI&state=STATE_STRING&redirect_uri=http://localhost:8090/naverlogin.do">
							<img src="resources/images/btnG_logIn.png" width="150px">
						</a>
					</div>
				</form>
			</div>
		</section>
	</body>
</html>