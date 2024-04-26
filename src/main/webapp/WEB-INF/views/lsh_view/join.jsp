<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			function join_ok(f) {
				f.action = "join_ok.do";
				f.submit();
			}
			function back() {
				window.history.back();
			}
			function double_chk(f) {
				f.action = "double_chk.do";
				f.submit();
			}
		
			function execDaumPostcode() {
				new daum.Postcode({
					oncomplete : function(data) {
						let addr = ''
						let extraAddr = '';
		
						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}
		
						if (data.userSelectedType === 'R') {
							if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '' && data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
		
							// 표시할 참고항목이 있을 경우,
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							document.getElementById("u_detali_addr2").value = extraAddr;
						} else {
							document.getElementById("u_detali_addr2").value = '';
						}
		
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('u_postcode').value = data.zonecode;
						document.getElementById('u_addr').value = addr;
						// 커서를 상세주소 필드로 이동 
						document.getElementById('u_detali_addr').focus();
					}
				}).open();
			}
		</script>
	</head>
	<body>
		<section>
			<form method="post">
				<div class="join_box">
					<table>
						<thead class="join_header">
							<tr>
								<td>회원가입</td>
							</tr>
						</thead>
						<tbody class="join_body">
							<tr>
								<td>
									<label>아이디</label>
									<input type="text" name="u_id" required />
									<input type="button" value="중복확인" onclick="double_chk(this.form)">
								</td>
								
								<td>
									<label>비밀번호</label>
									<input type="password" name="u_pwd" required />
								</td>
								
								<td>
									<label>비밀번호 확인</label>
									<input type="password" name="u_pwd" required />
								</td>
								
								<td>
									<label>이름</label>
									<input type="text" name="u_name" required />
								</td>
								
								<td>
									<label>성별</label>
									<input type="radio" name="u_gender" value="1" checked /> 남자
									<input type="radio" name="u_gender" value="2" /> 여자
								</td>
								
								<td>
									<label>이메일</label>
									<input type="email" name="u_email" required />
								</td>
								
								<td>
									<label>전화번호</label>
									<input type="text" name="u_phone" required />
								</td>
								
								<td>
									<label>주소</label>
									<input type="text" id="u_postcode" name="u_postcode" placeholder="우편번호">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
									<input type="text" id="u_addr" name="u_addr">
									<input type="text" id="u_detali_addr" name="u_detali_addr" placeholder="상세주소1">
									<input type="text" id="u_detali_addr2" name="u_detali_addr2" placeholder="상세주소2">
									<input type="submit">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="joinOK_box">
					<input type="button" onclick="join_ok(this.form)" value="가입하기">
					<input type="button" onclick="back()" value="취소">
				</div>
			</form>
		</section>
	</body>
</html>