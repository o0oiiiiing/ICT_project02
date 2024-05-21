<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
<script type="text/javascript">
/*
	function board_ans_write_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 3)
					continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action="board_ans_write_ok.do";
		f.submit();
	}
	*/
	
	function board_ans_write_ok(f) {
		f.action="board_ans_write_ok.do";
		f.submit();
	}
	
	function admin_list(f) {
		f.action="admin_list.do";
		f.submit();
	}
	
</script>
</head>
<body>
	
	<form method="post" enctype="multipart/form-data">
		<table width="700">
		<tbody>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="com_writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="left"> <input type="text" name="com_title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="10" cols="60" name="com_content"></textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td align="left"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="cPage" value="${cPage}">
				<!-- 댓글 저장 시 어떤 원글의 댓글인지 저장해야 한다. -->
				<input type="hidden" name="bo_idx" value="${bovo.bo_idx}">
				<input type="button" value="입력" onclick="board_ans_write_ok(this.form)" /> 
				<input type="button" value="목록" onclick="admin_list(this.form)" /> 
				<input type="reset" value="취소" />
				</td>
			</tr>
            </tbody>
		</table>
	</form>
</body>
</html>