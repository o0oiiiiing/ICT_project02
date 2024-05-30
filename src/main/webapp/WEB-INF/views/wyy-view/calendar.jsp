<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
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
				left : 'prev,next',
				center : 'title',
				right : 'today'
				/* right : 'dayGridMonth' */
				/* ,timeGridWeek,timeGridDay */
			},
			// 오늘날짜 중심
			initialDate : new Date().toISOString().split('T')[0],
			navLinks : true,
			selectable : true,
			selectMirror : true,
			
			// 일정 삭제
			eventClick : function(arg) {
				if (confirm('일정을 삭제하시겠습니까?')) {
					$.ajax({
						url : "calDelete",
						data : {
							// extendedProps -> 풀캘린더에서 사용자 정의로 
							// 추가하고 싶은 속성이나 데이터가 있을 경우 쓴다.
							c_idx : arg.event.extendedProps.c_idx
						},
						method : "POST",
						dataType : "text",
						success : function(data) {
							if (data == "0") {
								alert("삭제 실패");
							} else if (data == "1") {
								arg.event.remove();
								// 지도 함수 호출
								window.parent.myTripPlan();
							}
						},
						error : function() {
							alert("요청 실패");
						}
					});
				}
			},
			// 드래그 막기
			editable : false,
			dayMaxEvents : true,
			// 화면에 일정이름+일정내용 출력
			eventContent: function(arg) {
   				 var content =
        			'<p><strong>' + arg.event.title + '</strong></p>' +
        			'<p>' + (arg.event.extendedProps.vi_title || '') + '</p>';
    			return { html: content };
			},
			// 처음 들어갔을때 일정 list
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : "calList",
					method : "POST",
					dataType : "json",
					success : function(data) {
						console.log(data);
						var events = data.map(function(item) {
							var endDate = new Date(item.c_end);
						    // 종료일에 1초 추가(풀캘린더는 00:00:00 시간은 해당 날짜로 안친다.)
						    endDate.setSeconds(endDate.getSeconds() + 1);
							return {
								title : item.c_title,
								start : item.c_start,
								end : endDate,
								c_idx : item.c_idx,
								vi_title : item.vi_title
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