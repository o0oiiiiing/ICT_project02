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
	function board_list(f) {
		f.action="board_list.do";
		f.submit();
	}
	
	function board_update(f) {
		f.action="board_update.do";
		f.submit();
	}
	
	function board_delete(f) {
		f.action="board_delete.do";
		f.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
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
					<tr>
					<th>첨부파일</th>
					 <c:choose>
					 	<c:when test="${empty bovo.f_name}">
					 		<td><b>첨부파일없음</b></td>
					 	</c:when>
					 	<c:otherwise>
					 		<td>
					 			<a href="down.do?f_name=${bovo.f_name}"><img src="resources/upload/${bovo.f_name}" style="width: 80px;"></a>
					 		</td>
					 	</c:otherwise>
					 </c:choose>
					</tr>
				</tbody>
			</table>
			</div>
			<div id="board_detail_btn">
				<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
				<input type="hidden" value="${cPage}" name="cPage"> 
				<input type="button" value="목록" onclick="board_list(this.form)" /> 
				<input type="button" value="수정" onclick="board_update(this.form)" /> 
				<input type="button" value="삭제" onclick="board_delete(this.form)" />
			</div>
	</form>
	

<%@include file="../common/footer.jsp"%>
</body>
</html>