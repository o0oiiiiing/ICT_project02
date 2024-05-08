<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A 게시판 수정</title>
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

	function board_update_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 3 || i == 4)
					continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action = "board_update_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<form method="post">
		<div id="board_write">
			<table>
				<caption>Q&A 게시판 수정</caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="bo_subject" size="50"
							value="${bovo.subject}" /></td>
					</tr>

					<tr>
						<th>작성자</th>
						<td><input type="text" name="bo_writer"
							value="${bovo.writer}" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="bo_pwd"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="60" id="bo_content"
								name="bo_content" style="margin: 5px;">${bovo.content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="board_write_btn">
			<input type="button" value="목록" onclick="board_list(this.form)" /> 
			<input type="reset" value="초기화" /> 
			<input type="button" value="확인" onclick="board_update_ok(this.form)" />
		</div>
	</form>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/common-js/summernote-lite.js"></script>
	<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		$(function() {
			$("bo_#content").summernote({
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
			var frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg.do",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				dataType : "json",
			}).done(
					function(data) {
						var path = data.path;
						var fname = data.fname;
						$("#bo_content").summernote("editor.insertImage",
								path + "/" + fname);
					});
		}
	</script>

	<%@include file="../common/footer.jsp"%>
</body>
</html>