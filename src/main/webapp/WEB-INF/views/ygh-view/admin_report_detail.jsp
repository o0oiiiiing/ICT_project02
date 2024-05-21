<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 여행(관리자)</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- summer note -->
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/board_detail.css"/>"
	rel='stylesheet' />
<script type="text/javascript">
function admin_list(f) {
	f.action = "admin_list.do";
	f.submit();
}

function report_ans_write_ok(f) {
	f.action = "report_ans_write_ok.do";
	f.submit();
}

function toggleCommentBox() {
	let comment_box = document.getElementById("comment_box");
	let comment_btn = document.getElementById("comment_btn");
	if (comment_box.style.display === "none" || comment_btn.style.display === "none") {
		comment_box.style.display = "block";
		comment_btn.style.display = "block";
	} else {
		comment_box.style.display = "none";
		comment_btn.style.display = "none";
	}
}

//답글수정 버튼 클릭 시
function reply_update(f) {
	let comment_box3 = document.getElementById("comment_box3");
	let comment_btn3 = document.getElementById("comment_btn3");
	let comment_box = document.getElementById("comment_box");
	let comment_btn = document.getElementById("comment_btn");
	if (comment_box3.style.display === "none" || comment_btn3.style.display === "none") {
		comment_box3.style.display = "block";
		comment_btn3.style.display = "block";
		comment_box.style.display = "none";
		comment_btn.style.display = "none";
	} else {
		comment_box3.style.display = "none";
		comment_btn3.style.display = "none";
	}
	f.action = "reply_update.do";
}

function reply_update_ok(f) {
	f.action = "reply_update_ok.do";
	f.submit();
}
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<form method="post">
	<div id="board_detail">
		<table>
			<caption>신고 게시판</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${revo.report_title}</td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${revo.report_writer}</td>
				</tr>

				<tr>
					<th>날짜</th>
					<td>${revo.report_regdate.substring(0,10)}</td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="60" id="report_content"
							name="report_content" readonly style="margin: 5px;">${revo.report_content}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="board_detail_btn">
		<input type="hidden" value="${revo.report_idx}" name="report_idx">
		<input type="hidden" value="${cPage2}" name="cPage2"> 
		<input type="button" value="목록" onclick="admin_list(this.form)" /> 
		<input type="button" value="답글" onclick="toggleCommentBox()" /> 
		<input type="button" value="삭제" onclick="report_delete(this.form)" />
	</div>
</form>

<br>
<br>
<br>

<%-- 답글 입력 --%>
<form method="post">
	<div id="comment_box" style="display: none;">
		<table>

			<tr>
				<th colspan="2" style="text-align: left;">답변하기</th>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="rep_writer"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="rep_content"></textarea></td>
			</tr>
		</table>
	</div>
	<div id="comment_btn" style="display: none;">
		<input type="hidden" name="cPage2" value="${cPage2}">
		<input type="hidden" name="report_idx" value="${revo.report_idx}">
		<input type="button" value="입력" onclick="report_ans_write_ok(this.form)" />
	</div>
</form>

<br>
<br>
<br>

<%-- 답글 출력 --%>
<div style="display: table; margin: 0 auto;">
	<c:forEach var="k" items="${rep_list}">
		<form method="post">
			<div id="comment_box2">
				<table>
					<tr>
						<th colspan="2" style="text-align: left;">답변</th>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${k.rep_writer}</td>
					</tr>
					<tr>
						<th>날짜</th>
						<td>${k.rep_regdate.substring(0,10)}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${k.rep_content}</td>
					</tr>
				</table>
			</div>
			<div id="comment_btn">
				<input type="button" value="답글수정" onclick="reply_update(this.form)">
				<input type="hidden" name="rep_idx" value="${k.rep_idx}"> 
				<input type="hidden" name="report_idx" value="${k.report_idx}">
				<input type="hidden" value="${cPage2}" name="cPage2"> 
			</div>
		</form>
		<br>
		<br>
		<br>
	</c:forEach>
</div>

<%-- 답글 수정 --%>
<form method="post">
	<div id="comment_box3" style="display: none;" >
	<c:forEach var="k" items="${rep_list}">
		<table>
			<tr>
				<th colspan="2" style="text-align: left;">답변하기</th>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="rep_writer" value="${k.rep_writer}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="rep_content">${k.rep_content}</textarea>
				</td>
			</tr>
		</table>
	</c:forEach>
	</div>
	<div id="comment_btn3" style="display: none;">
		<input type="hidden" name="report_idx" value="${revo.report_idx}"> 
		<input type="hidden" name="cPage2" value="${cPage2}">
		<input type="button" value="수정" onclick="reply_update_ok(this.form)" />
	</div>
</form>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	crossorigin="anonymous"></script>
<script src="resources/common-js/summernote-lite.js"></script>
<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#report_content").summernote({
			lang : "ko-KR", // 한글 설정
			height : 300, // 에디터 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			placeholder : '최대3000자까지 쓸 수 있습니다', // placeholder 설정
			callbacks : {
				onImageUpload : function(files, editor) {
					for (var i = 0; i < files.length; i++) {
						sendImage(files[i], editor);
					}
				}
			}
		});
		$('#report_content').summernote('disable');
	});

	function sendImage(file, editor) {
		var frm = new FormData();
		frm.append("s_file", file);
		$.ajax({
			url : "/saveImg.do",
			data : frm,
			type : "post",
			contentType : false,
			processData : false,
			dataType : "json"
		}).done(
				function(data) {
					var path = data.path;
					var fname = data.fname;
					$("#report_content").summernote("editor.insertImage",
							path + "/" + fname);
				});
	}
</script>

<%@include file="../common/footer.jsp"%>
</body>
</html>