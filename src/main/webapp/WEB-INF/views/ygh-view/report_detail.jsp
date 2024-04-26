<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 여행(관리자)</title>
<link href="<c:url value="/resources/ygh-css/board_detail.css"/>"
	rel='stylesheet' />
</head>
<body>
<div id="report_detail">
	<form method="post">
		<table width="700">
			<tbody>
				<tr>
					<th bgcolor="#B2EBF4">제목</th>
					<td>${revo.report_title}</td>
				</tr>

				<tr>
					<th bgcolor="#B2EBF4">작성자</th>
					<td>${revo.report_writer}</td>
				</tr>

				<tr>
					<th bgcolor="#B2EBF4">날짜</th>
					<td>${revo.report_regdate.substring(0,10)}</td>
				</tr>

				<tr>
					<th bgcolor="#B2EBF4">내용</th>
					<td>
						<%-- <pre>${bovo.content}</pre> --%> <textarea rows="10" cols="60"
							id="content" name="content">${revo.report_content}</textarea>
					</td>
				</tr>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="hidden" value="${revo.report_idx}" name="bo_idx"> 
						<input type="hidden" value="${cPage}" name="cPage"> 
						<input type="button" value="목록" onclick="report_list(this.form)" /> 
						<input type="button" value="답글" onclick="ans_write(this.form)" /> 
						<input type="button" value="삭제" onclick="board_delete(this.form)" /></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>


</body>
</html>