<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>짜증나는거</title>
	    <style>
	        .modal {
	            display: none;
	            position: fixed;
	            z-index: 1;
	            left: 0;
	            top: 0;
	            width: 100%;
	            height: 100%;
	            overflow: auto;
	            background-color: rgba(0, 0, 0, 0.4);
	        }
	
	        .modal-content {
	            background-color: #fefefe;
	            margin: 15% auto;
	            padding: 20px;
	            border: 1px solid #888;
	            width: 80%;
	        }
	    </style>
	</head>
	<body>
		<button id="send_btn">SSE test</button>
		
		<div id="myModal" class="modal">
		    <div class="modal-content">
		        <span class="close">&times;</span>
		        <p id="messageContent"></p>
		    </div>
		</div>
		
		<script>
		    document.getElementById("send_btn").addEventListener("click", function() {
		        var xhr = new XMLHttpRequest();
		        xhr.open("POST", "send_event.do", true);
		        xhr.send();
		    });
		
		    const eventSource = new EventSource("see.do");
		
		    eventSource.onmessage = function(event) {
		        const message = decodeURIComponent(escape(event.data));
		        showMessageModal(message);
		    };
		
		    function showMessageModal(message) {
		        const modal = document.getElementById("myModal");
		        const messageContent = document.getElementById("messageContent");
		        messageContent.textContent = message;
		        modal.style.display = "block";
		
		        // 모달 닫기 버튼 설정
		        const closeButton = document.querySelector(".close");
		        closeButton.onclick = function() {
		            modal.style.display = "none";
		        };
		
		        // 사용자가 모달 외부를 클릭하면 모달 닫기
		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        };
		    }
		</script>
	</body>
</html>
