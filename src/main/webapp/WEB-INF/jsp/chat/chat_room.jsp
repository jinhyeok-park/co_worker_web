<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

<html>
<head>
    <title>chatting Page</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white shadow-md rounded-lg max-w-md mx-auto">
            <div class="border-b border-gray-300 p-4">
                <div id="getProposal_id" data-proposal-id="${proposal_id}"></div>
                <h1 class="text-lg font-semibold text-gray-700">Chatting Room</h1>
            </div>
<c:set var="test" value="${sessionScope.user_id}" />
<!-- 현재 세션 사용자 ID 값 직접 출력 -->

<!-- 메시지 표시 영역 -->
<div id="messages" class="max-h-96 overflow-y-auto p-4 space-y-2">
    <c:forEach var="msg" items="${msgs}">
        <c:choose>
            <c:when test="${msg.user_id eq test}">
                <!-- 현재 세션의 사용자 ID와 메시지의 사용자 ID가 같은 경우: 오른쪽 정렬 -->
                <div class="text-right p-2 rounded-lg bg-blue-100 max-w-max ml-auto">
                    <span class="text-gray-800">${msg.message}</span>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 현재 세션의 사용자 ID와 메시지의 사용자 ID가 다른 경우: 왼쪽 정렬 -->
                <div class="text-left p-2 rounded-lg bg-gray-200 max-w-max">
                    <span class="text-gray-800">${msg.user_id} : ${msg.message}</span>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

            <div class="p-4 border-t border-gray-300">
                <input type="text" id="messageContent" placeholder="Type a message..." class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
                <input type="hidden" id="user_id" value="<%= (String)session.getAttribute("user_id") %>" />
                <button onclick="sendMessage()" class="mt-2 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Send</button>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/notification/notification.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/chat/stomp.js"></script>
</body>
</html>
