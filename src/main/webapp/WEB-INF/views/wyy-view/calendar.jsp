<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/wyy-css/main.css' rel='stylesheet' />
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
<script src='resources/wyy-css/main.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			// 오늘날짜로 출력 (풀캘린더는 2024-04-24 이런형식으로 해야함.)
			initialDate : new Date().toISOString().split('T')[0],
			navLinks : true,
			selectable : true,
			selectMirror : true,
			// 빈 캘린더 클릭했을 때(일정추가 나중에 하면 등록..) 
			/* select : function(arg) {
				var title = prompt('일정 제목:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end
					});
				}
				calendar.unselect();
			}, */
			eventClick : function(arg) {
				console.log("Clicked event ID:", arg.event.id);
				if (confirm('일정을 삭제하시겠습니까?')) {
					$.ajax({
						url : "calDelete",
						data : {
							// extendedProps -> 풀캘린더에서  사용자 정의로 추가하고 싶은 속성이나 데이터가 있을 경우 씀
							c_idx : arg.event.extendedProps.c_idx
						},
						method : "POST",
						dataType : "text",
						success : function(data) {
							if (data == "0") {
								alert("삭제 실패");
							} else if (data == "1") {
								arg.event.remove(); // 이벤트 삭제
							}
						},
						error : function() {
							alert("요청 실패");
						}
					});
				}
			},
			editable : true,
			dayMaxEvents : true,
			// 처음 들어갔을때 일정 list
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : "calList",
					method : "POST",
					dataType : "json",
					success : function(data) {
						var events = data.map(function(item) {
							return {
								title : item.c_title,
								start : item.c_start,
								end : item.c_end,
								c_idx : item.c_idx 
							};
						});
						// FullCalendar에 이벤트 객체 배열 전달
						successCallback(events);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						failureCallback();
					}
				});
			}
		});

		calendar.render();
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>