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
	
	function board_ans_write_ok(f) {
		f.action="board_ans_write_ok.do";
		f.submit();
	}
	
	 function toggleCommentBox() {
	        var comment_box = document.getElementById("comment_box");
	        if (comment_box.style.display === "none") {
	        	comment_box.style.display = "block";
	        } else {
	        	comment_box.style.display = "none";
	        }
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
				</tbody>
			</table>
			</div>
			<div id="board_detail_btn">
				<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
				<input type="hidden" value="${cPage}" name="cPage"> 
				<input type="button" value="목록" onclick="admin_list(this.form)" /> 
				<input type="button" value="답글" onclick="toggleCommentBox()" /> 
				<input type="button" value="삭제" onclick="board_delete(this.form)" />
			</div>
	</form>
	
	<br><br><br>
	
	<%-- 답글 입력 --%>
	<form method="post">
	<div id="comment_box" style="display: none;">
		<table>
		
			<tr><th colspan="2" style="text-align: left;">답변하기</th></tr>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="com_writer"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="10" cols="60" name="com_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="cPage" value="${cPage}">
				<!-- 댓글 저장 시 어떤 원글의 댓글인지 저장해야 한다. -->
				<input type="hidden" name="bo_idx" value="${bovo.bo_idx}">
				<input type="button" value="입력" onclick="board_ans_write_ok(this.form)" /> 
				</td>
			</tr>
            
		</table>
	</div>
	</form>
	
	<br><br><br>
	
	<%-- 답글 출력 --%>
	<div style="display: table; margin: 0 auto;">
		<c:forEach var="k" items="${com_list}">
				<form method="post">
					<div id="comment_box2">
					<table>
						<tr><th colspan="2" style="text-align: left;">답변</th></tr>
						<tr><th>작성자</th><td>${k.com_writer}</td></tr>
						<tr><th>날짜</th><td>${k.com_regdate.substring(0,10)}</td></tr>
						<tr><th>내용</th><td>${k.com_content}</td></tr>
					</table>
					</div>			
					<!-- 실제는 로그인 성공 && 글쓴사람만 삭제할 수 있어야 한다. -->
					<input type="button" value="댓글삭제" onclick="comment_delete(this.form)">
					<input type="hidden" name="com_idx" value="${k.com_idx}">
					<input type="hidden" name="bo_idx" value="${k.bo_idx}">
				</form>
				<br><br><br>
		</c:forEach>
	</div>

<%@include file="../common/footer.jsp"%>
</body>
</html>