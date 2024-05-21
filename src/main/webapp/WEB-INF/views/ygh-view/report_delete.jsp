<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 게시판 삭제</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/board_detail.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	function report_list(f) {
		f.action="report_list.do";
		f.submit();
	}

	function report_detail(f) {
		f.action = "report_detail.do";
		f.submit();
	}
	
	function report_delete_ok(f) {
		f.action="report_delete_ok.do";
		f.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form method="post">
		<div id="board_detail">
			<table>
				<caption>신고 게시판 삭제</caption>
				<tbody>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="report_pwd"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<div id="board_detail_btn">
				<input type="hidden" value="${revo.report_idx}" name="report_idx"> 
				<input type="hidden" value="${cPage2}" name="cPage2"> 
				<input type="button" value="목록" onclick="report_list(this.form)" /> 
				<input type="button" value="취소" onclick="report_detail(this.form)" />
				<input type="button" value="삭제" onclick="report_delete_ok(this.form)" />
			</div>
	</form>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>