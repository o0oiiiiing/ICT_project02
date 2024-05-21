<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A 게시판 삭제</title>
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
	function board_list(f) {
		f.action="board_list.do";
		f.submit();
	}
	
	function board_delete_ok(f) {
		f.action="board_delete_ok.do";
		f.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form method="post">
		<div id="board_detail">
			<table>
				<caption>Q&A 게시판 삭제</caption>
				<tbody>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="bo_pwd"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<div id="board_detail_btn">
				<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
				<input type="hidden" value="${cPage}" name="cPage"> 
				<input type="button" value="목록" onclick="board_list(this.form)" /> 
				<input type="button" value="삭제" onclick="board_delete_ok(this.form)" />
			</div>
	</form>
	
	<%@include file="../common/footer.jsp"%>
</body>
</html>