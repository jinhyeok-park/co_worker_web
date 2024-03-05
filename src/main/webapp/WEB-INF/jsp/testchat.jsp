<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>

<html>
<head>
    <title>chatting Page</title>
</head>
<body>
    <h1>Hello, this is chatting room</h1>
    <div>
        <input type="text" id="messageContent" placeholder="Type a message..."/>
        <button onclick="connect()">Connect</button>
        <button onclick="sendMessage()">Send</button>
    </div>
    <div id="messages">
        <!-- 메시지 표시 영역 -->
    </div>
    <script src="${pageContext.request.contextPath}/resource/js/STOMP.js"></script>
</body>
</html>
