<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가</title>
<style type="text/css">
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
}

.screen {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.screen p {
	margin-bottom: 10px;
}

.screen input[type="text"], .screen input[type="date"], .screen input[type="submit"],
	.screen button {
	width: 90%;
	padding: 10px;
	margin-bottom: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-family: 'NanumSquare';
}

.screen input[type="submit"], .screen button {
	background-color: lightgray;
	color: black;
	cursor: pointer;
}

.screen input[type="submit"]:hover, .screen button:hover {
	background-color: gray;
	color: white;
}

.modal--close {
	background-color: #ccc;
	color: #000;
	cursor: pointer;
}

.modal--close:hover {
	background-color: #999;
}
</style>
<script type="text/javascript">
	//모달창 열고닫기
	function openModal(contentsid) {
		$(".modal").show();
		$("#contentsid").val(contentsid);
	}
	
	function closeModal() {
		$(".modal").hide();
	}
</script>
</head>
<body>
	<!-- 일정추가 모달창  -->
	<div class="modal">
		<div class="screen">
			<form action="addSchedule" method="post">
				<p>
					일정 제목 <input type="text" name="c_title">
				</p>
				<p>
					시작 날짜 <input type="date" name="c_start">
				</p>
				<p>
					끝 날짜 <input type="date" name="c_end">
				</p>
				<input type="submit" value="일정추가"> <input type="hidden"
					name="contentsid" id="contentsid">
				<button type="button" value="close" class="btn modal--close"
					onclick="closeModal()">Close</button>
			</form>
		</div>
	</div>
</body>
</html>