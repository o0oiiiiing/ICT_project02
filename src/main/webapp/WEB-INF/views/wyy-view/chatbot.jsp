<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .message {
            border-top: 1px solid #ccc;
            padding: 10px;
            margin-top: 5px;
            background-color: #e6e6e6;
        }
        #chat-container {
            width: 400px;
            height: 600px;
            display: flex;
            flex-direction: column;
            border: 1px solid #ccc;
        }
        #chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 10px;
            display: flex;
            flex-direction: column-reverse;
        }
        #user-input {
            display: flex;
            padding: 10px;
 
        }
        #user-input input {
            flex: 1;
            padding: 10px;
            outline: none;
        }
        #user-input button {
            border: none;
            background-color: #1e88e5;
            color: white;
            padding: 10px 15px;
            cursor: pointer;
        }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
// 이전 질문 및 답변을 저장해 놓을 빈 배열 객체
// 이전 질문과 답변을 저장해놓고 gpt에 물어봐야 더 정확한 답변이 옵니다.
let gpt_token = [];

// open api에서 제공 받은 각자의 API_KEY를 저장해놓은 변수
let api_key = "api키적기"

// GPT에 답변을 요구하는 ajax 함수
function gpt() {
	$.ajax({
		// Open API에서 제공하는 GPT 사용을 위한 url 주소
	    url: 'https://api.openai.com/v1/chat/completions',
	    type: 'POST',
	 	// 헤더 요청에 필수로 들어가야하는 값들을 지정하는 곳
	    headers: {
	        'Content-Type': 'application/json',
	        'Authorization': 'Bearer ' + api_key
	    },
	 	// ajax는 데이터를 보낼 때 String만 보내기 때문에 Json객체를 String으로 변환해서 보내야합니다.
	    data: JSON.stringify({
	        model: "gpt-3.5-turbo",
	        messages: gpt_token
	    }),
	    success: function(data) {
	    	// 챗봇이 응답 데이터에 
	    	let message = data.choices[0].message.content
	    	test = { role: "assistant", content: message }
	    	gpt_token.push(test)
	    	addMessage('관리자(이름바꿈가능)', message);
	    },
	    error: function(xhr, status, error) {
	        console.error('Error:', error);
	    }
	});
}

//div에 메세지 추가
function addMessage(sender, message) {
    // 새로운 div 생성
    const messageElement = document.createElement('div');
    // 생성된 요소에 클래스 추가
    messageElement.className = 'message';
     // 채팅 메시지 목록에 새로운 메시지 추가
    messageElement.textContent = sender + ": " + message;
    $("#chat-messages").prepend(messageElement);
}

$(document).ready(function() {
	//전송 버튼 클릭 이벤트 처리
	$("#user-input button").on('click', function(e) {
		// 사용자가 입력한 메시지
	    let message = $("#user-input input").val();
	    // 메시지가 비어있으면 리턴
	    if (message.length === 0) return;
	    // 사용자 메시지 화면에 추가
	    addMessage('유저(이름바꿈가능)', message);
	    $("#user-input input").val("");
	    test = { role: "user", content: message }
	    gpt_token.push(test)
	    //ChatGPT API 요청후 답변을 화면에 추가
	    gpt();
	});
	
	// 사용자 입력 필드에서 Enter 키 이벤트를 처리
	$("#user-input input").on('keydown', function(e) {
		if (e.key === 'Enter') {
			$("#user-input button").click();
		}
	});
	
})
</script>
</head>
<body>
    <div id="chat-container">
        <div id="chat-messages"></div>
        <div id="user-input">
            <input type="text" placeholder="메시지를 입력하세요..." />
            <button>전송</button>
        </div>
    </div>
</body>
</html>