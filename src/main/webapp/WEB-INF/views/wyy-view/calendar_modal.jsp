<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

//모달창 이벤트
$(document).ready(function() {
    $("#exampleModal").modal("show");
	
    // 취소 버튼 눌렀을 때
    // 이전화면으로 돌아가게 구현하기
//    $("#cancelChanges").click(function(){
    	
//    });
    
    // 저장 버튼 눌렀을 때
    $("#saveChanges").click(function() {
    var eventData = {
        c_title: $("#title").val(),
        c_start: $("#start").val(),
        c_end: $("#end").val()
    };
	console.log(eventData);
    if (
        eventData.c_title == "" ||
        eventData.c_start == "" ||
        eventData.c_end == ""
    ) {
        alert("입력하지 않은 값이 있습니다.");
    } else if ($("#start").val() > $("#end").val()) {
        alert("시간을 잘못입력 하셨습니다.");
    } else {
        $.ajax({
            url: "calSave",  // 서버의 처리 URL
            method: "POST",
            data: eventData,  // 전송할 데이터
            contentType: "application/json",
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    alert("일정이 추가되었습니다.");
                    //원래 페이지로 이동하기?
                } else {
                    alert("일정 추가에 실패하였습니다.");
                }
            },
            error: function() {
                alert("요청 실패");
            }
        });
    }
});
});
</script>

</head>
<body>
		<!-- 일정추가 모달.. 부트스트랩 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					일정이름 : <input type="text" id="title" /><br />
					시작시간 : <input type="datetime-local" id="start" /><br />
					종료시간 : <input type="datetime-local" id="end" /><br /> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelChanges">취소</button>
					<button type="button" class="btn btn-primary" id="saveChanges" >
						추가</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>