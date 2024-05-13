<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 여행(관리자)</title>
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

	function board_ans_write_ok(f) {
		f.action = "board_ans_write_ok.do";
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

	function comment_delete(f) {
		f.action = "comment_delete.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<form method="post">
		<div id="board_detail">
			<table>
				<caption>Q&A 게시판</caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${bovo.bo_title}</td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>${bovo.bo_writer}</td>
					</tr>

					<tr>
						<th>날짜</th>
						<td>${bovo.bo_regdate.substring(0,10)}</td>
					</tr>

					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="60" id="bo_content"
								name="bo_content" readonly style="margin: 5px;">${bovo.bo_content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="board_detail_btn">
			<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> <input
				type="hidden" value="${cPage}" name="cPage"> <input
				type="button" value="목록" onclick="admin_list(this.form)" /> <input
				type="button" value="답글" onclick="toggleCommentBox()" /> <input
				type="button" value="삭제" onclick="admin_board_delete(this.form)" />
		</div>
	</form>

	<br>
	<br>
	<br>

	<%-- 답글 입력 --%>
	<form method="post">
		<div id="comment_box" style="display: none;" >
			<table>

				<tr>
					<th colspan="2" style="text-align: left;">답변하기</th>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="com_writer"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="100" name="com_content"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div id="comment_btn" style="display: none;">
			<input type="hidden" name="cPage" value="${cPage}">
			<!-- 댓글 저장 시 어떤 원글의 댓글인지 저장해야 한다. -->
			<input type="hidden" name="bo_idx" value="${bovo.bo_idx}"> 
			<input type="button" value="입력" onclick="board_ans_write_ok(this.form)" />
		</div>
	</form>

	<br>
	<br>
	<br>

	<%-- 답글 출력 --%>
	<div style="display: table; margin: 0 auto;">
		<c:forEach var="k" items="${com_list}">
			<form method="post">
				<div id="comment_box2">
					<table>
						<tr>
							<th colspan="2" style="text-align: left;">답변</th>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${k.com_writer}</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>${k.com_regdate.substring(0,10)}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${k.com_content}</td>
						</tr>
					</table>
				</div>
				<div id="comment_btn">
					<!-- 실제는 로그인 성공 && 글쓴사람만 삭제할 수 있어야 한다. -->
					<input type="button" value="댓글삭제" onclick="comment_delete(this.form)"> 
					<input type="hidden" name="com_idx" value="${k.com_idx}"> 
					<input type="hidden" name="bo_idx" value="${k.bo_idx}">
				</div>
			</form>
			<br>
			<br>
			<br>
		</c:forEach>
	</div>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/common-js/summernote-lite.js"></script>
	<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#bo_content").summernote({
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
			$('#bo_content').summernote('disable');
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
						$("#bo_content").summernote("editor.insertImage",
								path + "/" + fname);
					});
		}
	</script>

	<%@include file="../common/footer.jsp"%>
</body>
</html>