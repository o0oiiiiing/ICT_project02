<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A | Jeju_travel</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- summer note -->
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/board_write.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if (pwdchk == 'fail') {
			alert("비밀번호 틀림");
			return;
		}
	});
</script>
<script type="text/javascript">
	function board_list(f) {
		f.action = "board_list.do";
		f.submit();
	}
	
	function board_detail(f) {
		f.action = "board_detail.do";
		f.submit();
	}

	function board_update_ok(f) {
		f.action = "board_update_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<form method="post" enctype="multipart/form-data">
		<div id="board_write">
			<table>
				<caption>Q&A 게시판 수정</caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="bo_title" size="50"
							value="${bovo.bo_title}" /></td>
					</tr>

					<tr>
						<th>작성자</th>
						<td><input type="text" name="bo_writer"
							value="${bovo.bo_writer}" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="bo_pwd"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="60" id="bo_content"
								name="bo_content" style="margin: 5px;">${bovo.bo_content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="board_write_btn">
			<input type="hidden" name="bo_idx" value="${bovo.bo_idx}">
			<input type="hidden" name="cPage" value="${cPage}">
			<input type="button" value="목록" onclick="board_list(this.form)" /> 
			<input type="button" value="취소" onclick="board_detail(this.form)" /> 
			<input type="button" value="확인" onclick="board_update_ok(this.form)" />
		</div>
	</form>

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/common-js/summernote-lite.js"></script>
	<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#bo_content").summernote({
				lang : "ko-KR", // 한글 설정
				height : 300, // 에디터 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				placeholder : '최대 1000자까지 작성할 수 있습니다. ', // placeholder 설정
				callbacks : {
					onImgeUpload : function(files, editor) {
						for (var i = 0; i < files.length; i++) {
							sendImage(files[i], editor)
						}
					}
				}
			});
		});
	
		function sendImage(file, editor) {
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "saveImg.do",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				dataType : "json",
			}).done(function(data) {
				let path = data.path;
				let fname = data.fname;
				$("#bo_content").summernote("editor.insertImage", path + "/" + fname);
			});
		}
	</script>

	<%@include file="../common/footer.jsp"%>
</body>
</html>