<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#chatbot_image{
	width: 50px;
	height: 50px;
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 99;
	line-height: 60px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	//챗봇 창 이동
	function chatbotgo(){
		location.href = "chatbot";
	}
</script>
</head>
<body>
	<img src="resources/common-image/chatbot.png" onclick="chatbotgo()" id="chatbot_image">
</body>
</html>