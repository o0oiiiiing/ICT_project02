<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 여행(관리자)</title>
<link href="<c:url value="/resources/ygh-css/board_detail.css"/>" rel='stylesheet' />
<script type="text/javascript">
	function admin_list(f) {
		f.action="admin_list.do";
		f.submit();
	}
	
	function board_ans_write(f) {
		f.action="board_ans_write.do";
		f.submit();
	}

</script>
</head>
<body>
	<form method="post">
		<div id="board_detail">
			<table>
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
						<td>
							<%-- <pre>${bovo.content}</pre> --%> 
							<textarea rows="10" cols="60" id="content" name="content" readonly style="margin: 5px;">${bovo.bo_content}</textarea>
						</td>
					</tr>

				</tbody>
			</table>
			<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
			<input type="hidden" value="${cPage}" name="cPage"> 
			<input type="button" value="목록" onclick="admin_list(this.form)" /> 
			<input type="button" value="답글" onclick="board_ans_write(this.form)" /> 
			<input type="button" value="삭제" onclick="board_delete(this.form)" />
		</div>
	</form>


</body>
</html>