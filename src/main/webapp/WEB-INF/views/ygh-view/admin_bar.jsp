<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/ygh-css/admin_bar.css"/>" rel='stylesheet' />
</head>
<body>
	<div id="menubar">
		<h1>나의 여행(관리자)</h1>
		<table>
			<tr>
				<td><span class="material-symbols-outlined">finance</span><br><a href="dashboard.do">대시보드</a></td>
				<td><span class="material-symbols-outlined">manage_accounts</span><br><a href="user_list.do">회원관리</a></td>
				<td><span class="material-symbols-outlined">mark_chat_read</span><br><a href="admin_list2.do">답변</a></td>
				<td><span class="material-symbols-outlined">mark_chat_unread</span><br><a href="admin_list.do">미답변</a></td>
				<td><span class="material-symbols-outlined">calendar_add_on</span><br><a href="admin_insert">장소추가</a></td>
				<c:if test="${adminVO.a_status == '1'}">
					<td><span class="material-symbols-outlined">person_add</span><br><a href="admin_join.do">관리자 생성</a></td>
				</c:if>
			</tr>
		</table>
	</div>
	
	
	<div id="inner_body">
		<aside class="side_bar js-side_bar">
			<ul>
				<li><span class="material-symbols-outlined">finance</span><a href="dashboard.do"> 대시보드</a></li>
				<li><span class="material-symbols-outlined">manage_accounts</span><a href="user_list.do"> 회원관리</a></li>
				<li><span class="material-symbols-outlined">mark_chat_read</span><a href="admin_list2.do"> 답변</a></li>
				<li><span class="material-symbols-outlined">mark_chat_unread</span><a href="admin_list.do"> 미답변</a></li>
				<li><span class="material-symbols-outlined">calendar_add_on</span><a href="admin_insert"> 장소추가</a></li>
				<c:if test="${adminVO.a_status == '1'}">
					<li><span class="material-symbols-outlined">person_add</span><a href="admin_join.do"> 관리자 생성</a></li>
				</c:if>
			</ul>
		</aside>
	</div>
</body>
</html>