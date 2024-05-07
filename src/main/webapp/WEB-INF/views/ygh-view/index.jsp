<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function board_list() {
		location.href="board_list.do"
	}
	function report_list() {
		location.href="report_list.do"
	}
</script>
</head>
<body>
	<button onclick="board_list()">Q&A 게시판</button>
	<button onclick="report_list()">신고 게시판</button>
</body>
</html>