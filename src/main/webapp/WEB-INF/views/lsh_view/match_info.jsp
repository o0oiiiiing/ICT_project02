<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("k_login_box").empty();
				$.ajax({
					url : "k_login.do",
					method : "post",
					dataType : "text",
					success : function(data) {
						let user = data.split("/");
						$("k_login_box").append(user[0]+"("+user[1]+")"+Welcome)
					},
					error : function() {
						alert("read fail");
					}
				});
			})
		</script>
		<script type="text/javascript">
			function back() {
				window.history.back();
			}
			
			// 약관 전체 동의 확인필요
			function terms_box() {
				let clickAll = document.getElementById('.click_all');
				let clickItem = document.querySelectorAll('.click_item');

				clickItem.forEach(function(item) {
					item.checked = clickAll.checked;
				});
			}
			
			// 개별 동의 확인필요
			function terms_click() {
				let clickAll = document.getElementById('.click_all');
				let clickItem = document.querySelectorAll('.click_item');
				let allChecked = true;
				// .click_item 체크박스 중 하나라도 해제되면 전체 해제
				clickItem.forEach(function(item) {
					if (! item.checked) {
						allChecked = false;
					}
				});
				clickAll.checked = allChecked;
			}
			
			// 유효성검사
			function match_info(f) {
				if (f.u_name === '' || f.u_phone === '' ) {
					alert("필수 항목을 입력하세요.");
					return false;
				} else if (! f.click_1.checked) {
					alert("필수 이용 약관1에 동의해주세요.");
					f.click_1.focus();
					return false;
				} else if (! f.click_2.checked) {
					alert("필수 이용 약관2에 동의해주세요.");
					f.click_2.focus();
					return false;
				} else if (f.u_phone.value.length !== 11) {
					alert("전화번호는  '-'을 제외한 11자리로 입력하세요.");
					f.u_phone.focus();
					return false;
				}
				f.action = "k_join.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<section id="k_login_box">
			<form method="post">
				<div class="join_box1">
					<table>
						<thead class="join_header">
							<tr>
								<td>가입 중복 여부</td>
							</tr>
						</thead>
						<tbody class="join_body">
							<tr>
								<td>
									<label>이름</label>
									<input type="text" id="u_name" name="u_name" required />
								</td>
								
								<td>
									<label>성별</label>
									<input type="radio" name="u_gender" value="1" checked /> 남자
									<input type="radio" name="u_gender" value="2" /> 여자
								</td>
								
								<td>
									<label>전화번호</label>
									<input type="text" id="u_phone" name="u_phone" required />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="join_box2">
					<table>
						<tr>
							<th >
								<input type="checkbox" id="click_all" onclick="terms_box()"> 
								<label for="click_all">이용약관 전체 동의</label>
							</th>
						</tr>
		
						<tr>
							<td>
								<p>[필수] 이용약관1 동의</p> 
								<div class="terms_box">
									<p>필수 동의임</p> 
								</div>
								<input type="checkbox" id="click_1" onclick="terms_click()" class="click_item">
								<label for="click_1">동의</label>
							</td>
						</tr>
						<tr>
							<td>
								<p>[필수] 이용약관2 동의</p>
								<div class="terms_box">
									<p>필수 동의임</p>
								</div>
								<input type="checkbox" id="click_2" onclick="terms_click()" class="click_item">
								<label for="click_2">동의</label>
							</td>
						</tr>
						<tr>
							<td>
								<p>[선택] 광고 수신 동의</p>
								<div class="terms_box">
									<p>선택 동의임</p>
								</div>
								<input type="checkbox" id="click_3" onclick="terms_click()" class="click_item">
								<label for="click_3">동의</label>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="joinOK_box">
					<input type="hidden" name="k_nickname" value="${k_nickname}">
					<input type="hidden" name="k_email" value="${k_email}">
					<input type="button" onclick="match_info(this.form)" value="가입하기">
					<input type="button" onclick="back()" value="취소">
				</div>
			</form>
		</section>
	</body>
</html>