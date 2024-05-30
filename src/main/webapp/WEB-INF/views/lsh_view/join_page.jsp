<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>SIGN UP | Jeju_travel</title>
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/join_page.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function back() {
				window.history.back();
			}
			
			// 아이디 중복 여부
			let idChk = false;
			function id_doublechk() {
				$.ajax({
					url : "id_doublechk.do",
					data : "u_id="+$("#u_id").val(), 
					method : "post", 	
					dataType : "text",
					success : function(data) {
						if (data === '1') {
							alert("사용 가능한 아이디입니다.");
							idChk = true;
						} else if (data === '0') {
							alert("이미 사용중인 아이디입니다.");
							idChk = false;
						}
					},
					error : function() {
						alert("read fail");
						idChk = false;
					}
				});
			}
			
			// 비밀번호 확인
			function pwdchk_go() {
				let u_pwd = document.getElementById('u_pwd');
				let u_pwdchk = document.getElementById('u_pwdchk');
				let msg = document.getElementById('pwd_msg');
				
				let ok = "green";	
				let no = "red";
				
				let pwd_patten = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
				
				document.getElementById('u_pwd').addEventListener('input', pwdchk_go);
				if (u_pwd.value.length < 6) {
			        msg.style.color = no;
			        msg.style.fontSize = "12px";
			        msg.style.fontWeight = "bold";
			        msg.innerHTML = "비밀번호는 6자리 이상으로 입력하세요.";
			    } else if (!pwd_patten.test(u_pwd.value)) {
			        msg.style.color = no;
			        msg.style.fontSize = "12px";
			        msg.style.fontWeight = "bold";
			        msg.innerHTML = "비밀번호는 특수문자, 영문자, 숫자를 모두 포함해야 합니다.<br>특수문자는 '@, $, !, %, *, ?, &'만 사용 가능합니다.";
			    } else if (u_pwd.value === u_pwdchk.value && u_pwdchk.value !== '') {
			        msg.style.color = ok;
			        msg.style.fontSize = "12px";
			        msg.style.fontWeight = "bold";
			        msg.innerHTML = "비밀번호가 일치합니다.";
			    } else {
			        msg.style.color = no;
			        msg.style.fontSize = "12px";
			        msg.style.fontWeight = "bold";
			        msg.innerHTML = "비밀번호가 일치하지 않습니다.";
			    }
			}
			
			// 약관 전체 동의 확인필요
			function terms_box() {
				let clickAll = document.getElementById('click_all');
				let clickItem = document.querySelectorAll('.click_item');

				clickItem.forEach(function(item) {
					item.checked = clickAll.checked;
				});
			}
			
			// 개별 동의 확인필요
			function terms_click() {
				let clickAll = document.getElementById('click_all');
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
			function join_ok(f) {
				if (f.u_id === '' || f.u_pwd === '' || f.u_pwdchk === '' || f.u_name === '' || f.u_birth === '' || 	f.u_email === '' 
						|| f.u_phone === '' || f.u_addr === '' || f.u_detail_addr === '') {
					alert("필수 항목들을 입력해주세요.");
					return false;
				} else if (!/^[a-zA-Z0-9]{4,}$/.test(f.u_id.value)) {
					alert("아이디는 영문자와 숫자로 이루어진 최소 4자 이상이어야 합니다.");
					f.u_id.focus();
					return false;
				} else if (! idChk) {
					alert("아이디 중복 확인을 하세요.");
					f.idChk.focus();
			        return false; 
				} else if (!/(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{6,}/.test(f.u_pwd.value)) {
					alert("비밀번호는 최소 6자 이상이어야 하며, 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
					f.u_pwd.focus();
					return false;
				} else if (!/^[a-zA-Z가-힣]+$/.test(f.u_name.value)) {
					alert("이름은 한글과 영문 대소문자만 허용됩니다.");
					f.u_name.focus();
					return false;
				} else if (f.u_birth.value === '') {
					alert("생년월일을 선택하세요.");
					f.u_birth.focus();
					return false;
				} else if (f.u_phone.value.length !== 11) {
					alert("전화번호는  '-'을 제외한 11자리로 입력하세요.");
					f.u_phone.focus();
					return false;
				} else if (!/^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$/.test(f.u_email.value)) {
					alert("이메일 형식을 확인하세요.");
					f.u_email.focus();
					return false;
				} else if (f.u_postcode.value === '') {
					alert("주소를 입력해주세요.");
					f.u_postcode.focus();
					return false;
				} else if (! f.click_1.checked) {
					alert("필수 이용 약관1에 동의해주세요.");
					f.click_1.focus();
					return false;
				} else if (! f.click_2.checked) {
					alert("필수 이용 약관2에 동의해주세요.");
					f.click_2.focus();
					return false;
				}
				f.action = "join_ok.do";
				f.submit();
			} 
			
			// 엔터키 활성화
			document.addEventListener('keypress', function(e) {
			    if (e.keyCode === 13) {
			        if (document.activeElement.tagName === 'INPUT') {
			        	join_ok(document.activeElement.form);
			        }
			    }
			});
			
			// 중복확인 버튼 활성화 및 비활성화
			function chk_disabled() {
				let u_id = document.getElementById('u_id').value;
				let u_idchk = document.getElementById('u_idchk');
				
			    // 공백제거
			    let cid = u_id.replace(/\s/g, '');
			 	// 영문자와 숫자만 허용
			    cid = cid.replace(/[^a-zA-Z0-9]/g, '');
				
				let empty = "#b6dedc";
				let basic = "lightgray";
				if (cid === '') {
			        u_idchk.style.background = basic;
			        u_idchk.disabled = true;
			    } else if (cid.length < 4) {
			        u_idchk.style.background = basic;
			        u_idchk.disabled = true;
			    } else {
			        u_idchk.style.background = empty;
			        u_idchk.disabled = false;
			    }
			}
			
			// 중복확인 버튼 활성화 및 비활성화
			window.onload = function() {
				chk_disabled(); 
				document.getElementById("u_id").addEventListener("input", chk_disabled);
		    };
		    
		    // 첨부파일 미리보기
		    function read_prev_img(input) {
		    	let prev_img = document.getElementById('prev_img');
		    	
				if (input.files && input.files[0]) {
					let file_reader = new FileReader();
					file_reader.onload = function(e) {
						prev_img.src = e.target.result;
						prev_img.style.display = 'block';
					};
					file_reader.readAsDataURL(input.files[0]);
				} else if (prev_img.src) {
					prev_img.style.display = 'block';
				} else {
					prev_img.src = "";
					prev_img.style.display = 'none';
				}
			}
		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			// 주소 api
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
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							
							document.getElementById("u_detail_addr2").value = extraAddr;
						} else {
							document.getElementById("u_detail_addr2").value = '';
						}
						document.getElementById('u_postcode').value = data.zonecode;
						document.getElementById('u_addr').value = addr;
						document.getElementById('u_detail_addr').focus();
					}
				}).open();
			}
		</script>
		<style type="text/css">
			.join_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			  	font-family: 'NanumSquare';
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="join_page">
			<div class="join_container">
				<form method="post" enctype="multipart/form-data">
					<h3 class="join_text">Sign Up</h3>
						<div class="join_box">
							<ul>
								<li>
									<input type="text"  id="u_id" name="u_id" required placeholder="ID" />
									<input type="button" class="join_btn" id="u_idchk"  value="중복 확인" onclick="id_doublechk()" disabled />
								</li>
								<li>
									<input type="password" id="u_pwd" name="u_pwd" required placeholder="Password" />
								</li>
								<li>
									<input type="password" id="u_pwdchk" name="u_pwdchk" required oninput="pwdchk_go()" placeholder="Password Check" />
									<span id="pwd_msg"></span>
								</li>
								<li class="join_li_box" >
									<input type="text" id="u_name" name="u_name" required placeholder="Name" />
								</li>
								<li>
									<label for="user_profile">
										<div class="join_file_upload_btn">Choose your profile Image</div>
									</label>
									<input type="file" id="user_profile" name="user_profile" accept="image/*" class="join_file_upload" onchange="read_prev_img(this)" />
									<img id="prev_img" />
								</li>
								<li>
									<input type="date" id="u_birth" name="u_birth" value="생년월일" required data-placeholder="생년월일을 입력하세요" max="9999-12-31" />
								</li>
								<li class="join_radio_btn">
									<input  style="width: 50px;" type="radio" name="u_gender" value="M" checked />
										<span class="join_radio_text">Male</span>
									<input  style="width: 50px;" type="radio" name="u_gender" value="F" />
										<span class="join_radio_text">Female</span>
								</li>
								<li>
									<input type="email" id="u_email" name="u_email" required 
												pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" placeholder="E-Mail" />
								</li>
								<li>
									<input type="text" id="u_phone" name="u_phone" required placeholder="Phone" />
								</li>
								<li>
									<input type="button" class="join_btn" onclick="execDaumPostcode()" value="우편번호 찾기" />
									<input type="text" id="u_postcode" name="u_postcode" placeholder="우편번호" readonly />
									<input type="text" id="u_addr" name="u_addr" readonly />
									<input type="text" id="u_detail_addr" name="u_detail_addr" placeholder="Address" />
									<input type="text" id="u_detail_addr2" name="u_detail_addr2" placeholder="Address" readonly />
								</li>
							</ul>
					</div>
					
					<div class="join_terms_container">
						<ul>
							<li>
								<div class="join_terms_box">
									<p>[필수] 이용약관1</p>
									<div class="join_terms_box_chk">
										<input type="checkbox" id="click_1" onclick="terms_click()" class="click_item">
										<label for="click_1">동의</label>
									</div>
								</div>
								<div class="terms_box">
									<p>제1조(목적)</p>
										<p>이 약관은 한국인재개발원 이하 “팀_2라봉”이 운영하는 'Jeju_travel' 사이트('http://localhost:8090/home'이하 'Jeju_travel 홈페이지')에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이트와 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.</p>
										<br>
										<p>제2조(약관의 범위 및 변경)</p>
										<p>이 약관 외에 통신망을 통하여 이용자에게 공지되는 내용은 약관의 일부로서 유효하고, 약관의 내용에 변경이 있을 경우에는 전산망 내에 공지사항을 이용하여 공지합니다.</p>
										<br>
										<p>제3조(취급의 준칙)</p>
										<p>이 서비스는 전기통신공사업법 및 관계법령에 규정하는 사항을 제외하고는 이 약관에 의하여 취급합니다.</p>
										<br>
										<p>제4조(정의)</p>
										<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
										<p>1. “Jeju_travel”('http://localhost:8090/home'이하 'Jeju_travel 홈페이지')라 함은 Jeju_travel에서 운영하는 인터넷 홈페이지를 말합니다.</p>
										<p>2. “사이트”란 공사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다.</p>
										<p>3. “이용자”란 사이트에 접속하여 이 약관에 따라 사이트가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</p>
										<p>4. “이용약관”이란 서비스 이용과 관련하여 사이트와 이용자간에 체결하는 계약을 말합니다.</p>
										<p>5. “회원”이란 사이트에 개인정보를 제공하여 회원등록을 한 자로서, 사이트의 정보를 지속적으로 제공받으며, 사이트가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</p>
										<p>6. “비회원”이란 회원에 가입하지 않고 사이트가 제공하는 서비스를 이용하는 자를 말합니다.</p>
										<p>7. "회원ID"라 함은 회원식별과 회원의 서비스 이용을 위하여 회원자신이 선정하고 제주관광공사가 승인하는 문자와 숫자의 조합입니다.</p>
										<p>8. “연동로그인 비회원”이란 제휴사이트를 통해 연동로그인한 자를 말합니다.</p>
										<p>9. "캠페인 참여자”란 공유작품을 제출한 회원을 말합니다.</p>
										<p>10. “공유작품”이란 회원이 사이트에 사진 등록과정을 완료한 사진을 말합니다.</p>
										<p>11. “비밀번호”란 이용자가 등록회원과 동일인인지 신원을 확인하고 통신상의 자신의 개인정보보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합을 말합니다.</p>
										<p>12. “탈퇴(해지)”란 회원이 이용계약을 종료시키는 행위를 말합니다.</p>
										<br>
										<p>제5조(회원가입)</p>
										<p>1. 이용자는 사이트가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관 및 개인정보취급방침에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</p>
										<p>2. 사이트는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다. </p>
										<p>1) 가입신청자가 이 약관 제8조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제8조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 사이트의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</p>
										<p>2) 등록 내용에 허위, 기재누락, 오기가 있는 경우</p>
										<p>3) 기타 회원으로 등록하는 것이 사이트의 기술상 현저히 지장이 있다고 판단되는 경우</p>
										<p>3. 회원가입계약의 성립시기는 사이트의 승낙이 회원에게 도달한 시점으로 합니다.</p>
										<p>4. 회원은 제10조(개인정보보호) 제2항에 의한 가입사항을 변경 및 해지하고자 할 때에는 그 사항을 제주관광정보 사이트 회원정보변경 및 해지신청을 이용하여 변동하거나, 제주관광정보 사이트 운영자에게 메일을 이용하여 알려야 합니다.</p>
										<p>5. 공사는 회원에 대하여 등급별로 구분하여 각종 서비스 메뉴를 세분하여 이용에 차등을 둘 수 있습니다.</p>
										<p>6. 회원은 반드시 본인의 진정한 정보만을 공사에 제공하여야 하며 공사는 회원이 등록한 정보에 대하여 확인요청을 할 수 있습니다. 회원은 공사의 확인요청에 대하여 10일 이내에 소명을 하여야 하며, 만일 이를 준수하지 아니하거나 소명이 불충분한 경우 공사는 회원이 등록한 정보가 부정한 것으로 처리할 수 있으며, 그에 따라 발생되는 제반 사항 (예: 경품 수령 불가, 각종 이벤트 당첨 취소 등)에 대해서는 공사는 임의로 처리할 수도 있습니다.</p>
										<p>7. 기타 이용자 개인정보 관리 및 변경 등에 관한 사항은 사이트가 정하는 바에 의합니다.</p>
										<br>
										<p>제6조(회원 탈퇴 및 자격 상실 등)</p>
										<p>1. 회원은 사이트에 언제든지 탈퇴를 요청할 수 있으며 사이트는 즉시 회원탈퇴를 처리합니다.</p>
										<p>2. 회원이 다음 각호의 사유에 해당하는 경우, 사이트는 회원자격을 제한 및 정지시킬 수 있습니다.</p>
										<p>1) 타인의 이용자ID 및 비밀번호를 도용한 경우</p>
										<p>2) 서비스 운영을 고의로 방해한 경우</p>
										<p>3) 허위로 가입 신청을 한 경우</p>
										<p>4) 회원 기본정보가 변경되어 회원과 연락이 불가한 경우</p>
										<p>5) 같은 사용자가 다른 ID로 이중 등록을 한 경우</p>
										<p>6) 공공질서 및 미풍양속에 저해되는 내용을 유포시킨 경우</p>
										<p>7) 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우</p>
										<p>8) 컴퓨터 바이러스 유포 등 서비스의 운영을 고의로 방해한 경우</p>
										<p>9) 기타 관련법령에 위반된다고 판단되는 경우</p>
										<p>3. 사이트가 회원 자격을 제한•정지 시킨 후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 사이트는 회원자격을 상실시킬 수 있습니다.</p>
										<p>4. 사이트가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</p>
										<br>
										<p>제7조(사이트 이용)</p>
										<p>사이트 이용은 정기점검 등 제주관광공사가 필요로 정한 날, 업무상 또는 기술상 특별한 지장이 없는 한 연중 무휴(1일 24시간) 서비스를 하며, 제주관광정보 공식사이트의 모든 자료는 이용자들이 자유롭게 이용할 수 있습니다. 다만, 실명을 요하는 게시판 글올리기 등은 회원에 한하여 권한을 줄 수 있습니다.</p>
										<br>
										<p>제8조(회원ID 및 비밀번호관리)</p>
										<p>1. 회원ID 및 비밀번호의 관리는 회원의 책임으로 합니다.</p>
										<p>2. 회원의 회원ID 및 비밀번호에 의하여 발생되는 사용상의 과실 또는 제 3자에 의한 부정사용 등에 대한 모든 책임은 회원에게 있습니다.</p>
										<p>3. 회원 자신의 회원ID가 부정하게 사용된 경우 회원은 반드시 제주관광공사에 그 사실을 통보해야 합니다.</p>
										<br>
										<p>제9조(게시물의 관리)</p>
										<p>제주관광정보 공식사이트 이용자는 다음 각호에 해당하는 사항을 게재하여서는 아니되며 게시물 내용이 다음 각호의 1에 해당한다고 판단되는 경우에는 제8조(회원 자격의 제한 및 자격상실)에 준하고, 해당 게시물은 통보없이 삭제할 수 있습니다.</p>
										<p>1. 국가안전이나 보안에 위배되는 경우</p>
										<p>2. 선거와 관련한 내용, 정치적 목적이나 성향이 있는 경우</p>
										<p>3. 특정기관, 단체, 부서를 근거없이 비난하는 경우</p>
										<p>4. 특정인을 비방하거나 명예훼손의 우려가 있는 경우</p>
										<p>5. 영리목적의 상업성 광고, 저작권을 침해할 수 있는 내용</p>
										<p>6. 욕설, 음란물 등 불건전한 내용</p>
										<p>7. 실명을 원칙으로 하는 경우에 실명을 사용하지 않았거나 실명이 아닌 것으로 판단되었을 경우</p>
										<p>8. 동일인 또는 동일인이라고 인정되는 자가 똑같은 내용을 주 2회 이상 게시하거나 비슷한 내용을 1일 2회 이상 게시하는 경우</p>
										<p>9. 연습성, 오류, 장난성의 내용</p>
										<p>10. 기타 관계법령에 위배된다고 판단되는 경우</p>
										<p>※제주관광정보 공식사이트 이용자는 게시물을 정확하고 올바르게 등록해야 하며 게시물 등록에 의해 발생되는 모든 문제에 대하여는 민·형사상의 책임을 져야 합니다.</p>
										<br>
										<p>제10조(약관의 동의)</p>
										<p>1. 사이트는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 서비스를 제공하며, 이용자가 본 약관의 내용에 동의하는 경우, 사이트의 서비스 제공 행위 및 이용자의 서비스 사용 행위에는 본 약관이 우선적으로 적용됩니다.</p>
										<p>제5조(서비스의 제공 및 변경)</p>
										<p>1. 사이트는 다음과 같은 업무를 수행합니다.</p>
										<p>1) 공사 및 공사가 제공하는 서비스에 대한 홍보 내용</p>
										<p>2) 공사가 홍보하는 정보 안내</p>
										<p>3) 다른 기관과의 제휴 계약 등을 통해 회원에게 제공하는 일체의 서비스</p>
										<p>4) 공사가 제공하는 각종 프로모션 등의 정보</p>
										<p>5) 회원 이용 서비스</p>
										<p>6) 기타 공사가 정하는 업무</p>
										<p>2. 공사는 필요한 경우 서비스의 내용을 추가 또는 변경하여 제공할 수 있습니다.</p>
										<p>3. 일부 서비스의 경우 회원에 한해 제공될 수 있으며, 이때 제반 되는 혜택은 비회원 이용자에게는 적용되지 않습니다.</p>
										<p>4. 사이트의 모든 서비스는 무료를 원칙으로 하되, 일부 이벤트 경품의 경우 제세공과금이 부과될 수 있습니다.</p>
								</div>
							</li>
							<li>
								<div class="join_terms_box">
									<p>[필수] 이용약관2</p>
									<div class="join_terms_box_chk">
										<input type="checkbox" id="click_2" onclick="terms_click()" class="click_item">
										<label for="click_2">동의</label>
									</div>
								</div>
								<div class="terms_box">
									<p>제11조(Jeju_travel 의무)</p>
									<p>1. 'Jeju_travel' 사이트 시스템을 일시적으로 서비스를 제공할 의무가 있습니다.</p>
									<p>2. 'Jeju_travel' 사이트 서비스를 위한 설비에 장애가 발생될 때에는 신속한 복구가 가능하도록 조치하여야 합니다.</p>
									<p>3. 전화 또는 메일 등을 이용 가입회원에 대한 실명확인을 할 수 있으며, 가입회원의 신상정보를 본인의 승낙없이 제3자에게 누설, 배포하지 않습니다. 다만, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.</p>
									<p>4. 서비스 내용의 변경 또는 추가사항이 있을 경우에는 온라인으로 공지합니다.</p>
									<p>5. 제주관광정보 사이트의 모든 정보가 제10조에 위배되는지의 점검을 위하여 필요한 경우에 일부 회원의 정보를 열람한 후 그 결과를 홈페이지에 게시할 수 있습니다.</p>
									<br>
									<p>제12조(이용자의 의무 등)</p>
									<p>제주관광정보 공식사이트 이용자는 이 약관에서 규정하는 사항 이외에 서비스 이용안내와 주의사항을 준수하여야 합니다.</p>
									<p>1. 이용자는 다음 각호의 행위를 하여서는 안됩니다.</p>
									<p>1) 등록 또는 변경 시 허위 내용의 등록</p>
									<p>2) 타인의 정보 도용 및 타인의 정보를 수집 또는 저장하는 행위</p>
									<p>3) 사이트에 게시된 정보의 변경</p>
									<p>4) 사이트가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</p>
									<p>5) 사이트 기타 제3자의 저작권 등 지적재산권에 대한 침해</p>
									<p>6) 사이트 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</p>
									<p>7) 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 사이트에 공개 또는 게시하는 행위</p>
									<p>8) 사이트의 승인을 받지 아니한 광고, 판촉물, 스팸메일, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위</p>
									<p>9) 해킹행위 또는 컴퓨터바이러스의 유포행위</p>
									<p>10) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위</p>
									<p>11) 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</p>
									<p>12) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위</p>
									<p>13) 기타 법률행위 및 선량한 풍속, 기타 사회질서를 해하는 행위</p>
									<p>2. 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 하거나 위배하였다고 의심될만한 합리적인 사유가 발생한 경우, 이용자에게 10일 이내에 소명할 것을 요청할 수 있고 이용자가 이에 응하지 않거나 소명이 불충분한 경우에는 서비스 사용을 제한 및 중단하거나 이용자의 동의 없이 이용계약을 해지할 수 있습니다. 이 경우 사이트는 위 이용자의 접속을 금지할 수 있으며 이로 인해 발생하는 불이익에 대해 사이트는 책임을 부담하지 아니합니다.</p>
									<p>3. 회원은 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</p>
									<p>4. 회원은 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</p>
									<br>
									<p>제13조(회원홈페이지에 관한 의무)</p>
									<p>회원은 다음 각호 사항을 준수할 의무를 갖게 되며 준수하지 않을시는 제8조 1(회원 자격의 제한 및 자격상실)에 준하고 통보없이 홈페이지를 직권으로 삭제할 수 있습니다. 제주관광정보 공식사이트를 통한 회원자신의 홈페이지 등록자료 및 게시내용에 대하여는 최신상태를 유지해야 합니다. 회원 자신의 홈페이지 게재내용이 실제 내용과 상이하게 게재하는 등 민원이 있는 경우(공신력이 있는 기관에서 판명이 난 경우를 말한다) 제주관광공사는 회원의 홈페이지 서비스제공을 중지할 수 있으며, 관계법령에 위배되었을 경우 모든 책임은 회원에게 있습니다. 회원은 자신의 홈페이지에 공공질서 및 미풍양속에 위반되는 내용물이나 제3자의 저작권 등 기타 권리를 침해하는 내용물을 등록하는 행위를 하지 않아야 합니다. 만약 이와 같은 내용물로 인하여 발생하는 결과에 대한 모든 책임은 회원에게 있습니다.</p>
									<br>
									<p>제14조(게재된 자료에 대한 권리)</p>
									<p>제주관광정보 사이트에 게재된 자료에 대한 권리는 다음 각호의 1과 같습니다.</p>
									<p>1. 제주관광정보 공식사이트에 게재된 자료를 상업적 목적으로 이용할 수 없습니다.</p>
									<p>2. 게재한 게시물에 대한 권리와 책임은 게시자에게 있습니다. 다만, 제주관광공사는 게시자의 동의없이 이를 비영리적으로 이용할 수 있으며, 게시물을 영리적으로 이용할 시는 반드시 게시자의 동의를 사전에 얻어야 합니다.</p>
									<p>3. 제주관광공사는 회원이 게재한 게시물의 신뢰도나 정확도 그리고 게시자 이외의 이용자가 게시물을 상업적으로 이용하였을 경우 책임을 지지 아니합니다.</p>
									<p>4. 제주관광정보 공식사이트에 수록된 컨텐츠의 무단 또는 불법 복제·배포는 저작권법에 의하여 처벌되나, 사전에 제주관광공사의 동의를 얻은 경우는 그러하지 아니합니다.</p>
									<br>
									<p>제15조(공유작품 저작권의 귀속 및 이용제한)</p>
									<p>1. 공유작품의 저작권은 캠페인 참여자에게 있습니다. 단, 사이트의 서비스 홍보 목적 또는 관련 법령의 준수를 위해 공사는 캠페인 참여자의 동의 없이 공유작품의 게재권 및 편집권을 가질 수 있습니다.</p>
									<p>2. 사이트 내 이벤트 등에 당첨 또는 수상을 한 공유작품의 경우 저작권이 공사에 귀속됩니다. 단, 공유작품는 당첨 또는 수상을 취소하고 이를 거부할 수 있습니다.</p>
									<p>3. 공유작품은 등록후 내부 심사를 거쳐 서비스 게시 여부가 결정되며 공사 내부적으로 정한 기준에 부합하지 않은 경우 게시가 거부될 수 있습니다.</p>
									<p>4. 사이트가 제작하여 제공하는 서비스, 그에 필요한 소프트웨어, 디지털미디어파일, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타 권리는 사이트에 소유권이 있으므로 이용자는 사이트가 명시적으로 승인한 경우를 제외하고는 공사의 권리를 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정 행위 등에 의하여 상업적 이용 행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.</p>
									<p>5. 사이트는 공유작품이 다음의 각호에 해당하는 경우에는 사전 통지 없이 삭제할 수 있습니다.</p>
									<p>1) 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 공유작품을 게시한 경우</p>
									<p>2) 다른 회원 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우</p>
									<p>3) 공공질서 및 미풍양속에 위반되는 내용인 경우</p>
									<p>4) 범죄적 행위에 결부된다고 인정되는 내용일 경우</p>
									<p>5) 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</p>
									<p>6) 현저하게 완성도가 떨어지거나 무성의한 공유작품인 경우</p>
									<p>7) 비슷한 공유작품을 반복하여 등록하는 경우</p>
									<p>8) 기타 관계 법령에 위배되는 경우</p>
									<p>6. 공유작품이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 캠페인참여자가 부담하여야 합니다.</p>
									<br>
									<p>제16조(공유작품에 대한 보관과 처리)</p>
									<p>1. 캠페인 참여자가 공유작품을 업로드하는 행위는 사이트가 “캠페인 기간”은 물론 그 이후에도 공유작품을 사이트내에서 게시하는 것을 동의하는 것으로 간주합니다.</p>
									<p>2. 사이트는 수상작을 포함한 모든 공유작품에 대해 “공유작품의 등록 기간”은 물론 그 이후에도 별도의 삭제조치를 하지 않으며, 캠페인 참여자가 게시를 원치 않을 시 직접 삭제할 수 있도록 삭제 기능을 유지합니다.</p>
									<p>3. 제 6조 1항의 사유로 서비스 중단 시 공사는 캠페인 참여자들의 공유작품을 백업하거나 반환할 의무가 없습니다.</p>
									<br>
									<p>제17조(이의신청 금지)</p>
									<p>이용자는 제주관광정보 공식사이트에서 제공하는 서비스 이용시 발생되는 문제에 대해서 이의신청 및 민원을 제기할 수 없습니다.</p>
									<br>
									<p>제18조(손해배상 청구금지)</p>
									<p>이용자는 제주관광정보 공식사이트에서 제공하는 서비스 이용시 발생되는 문제에 대하여 제주관광공사에 손해배상청구를 할 수 없으며 제주관광공사는 이에 대해 책임을 지지 아니합니다.</p>
								</div>
							</li>
							<li>
								<div class="join_terms_box">
									<p>[선택] 선택사항</p>
									<div class="join_terms_box_chk">
										<input type="checkbox" id="click_3" onclick="terms_click()" class="click_item">
										<label for="click_3">동의</label>
									</div>
								</div>
								<div class="terms_box">
									<p>제1조(가입비 및 이용요금)</p>
									<p>Jeju_travel 의 가입비, 이용요금은 무료입니다.</p>
									<br>
									<p>제2조(약관 등의 명시와 설명 및 개정)</p>
									<p>1. 사이트가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 사이트의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 사이트는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</p>
									<p>2. 사이트가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 ‘사이트“에 송신하여 사이트의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</p>
									<p>3. 이 약관에 정하지 아니한 사항과 이 약관의 해석에 관하여는 약관의 규제에 관한 법률, 콘텐츠산업진흥법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령 또는 상관례에 따릅니다.</p>
									<br>
									<p>본 약관은 2016년 9월 5일부터 적용됩니다.</p>
								</div>
							</li>
							<li>
								<input type="checkbox" id="click_all" onclick="terms_box()">
								<label for="click_all">이용약관 전체 동의</label> 
							</li>
						</ul>
					</div>
					
					<div>
						<input type="button" class="join_ok_btn" onclick="join_ok(this.form)" value="Join us" />
						<input type="button" class="join_ok_btn" onclick="back()" value="Cancel" />
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>