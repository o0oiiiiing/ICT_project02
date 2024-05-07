<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summer note -->
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>"
	rel='stylesheet' />
</head>
<body>
	<input type="text" name="qa_title" value="제목입력" required>제목
	<input type="text" name="qa_title" value="제목입력" required>제목
	<input type="password" name="qa_title" value="제목입력" required>제목

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
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
</body>
</html>