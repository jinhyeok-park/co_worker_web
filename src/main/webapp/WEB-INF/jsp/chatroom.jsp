<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <input type="hidden" id="user_id" value="<%= (String)session.getAttribute("user_id") %>">
        <button onclick="sendMessage()">Send</button>
    </div>
    <div id="getProposal_id" data-proposal-id="${proposal_id}"></div>
  <div id="messages" class="max-h-[300px] overflow-y-auto border border-gray-300 p-2">
      <!-- 메시지 표시 영역 -->
      <c:forEach var="msg" items="${msgs}">
          <div><span>${msg.user_id} : ${msg.message}</span></div>
      </c:forEach>
  </div>
    <script src="${pageContext.request.contextPath}/resource/js/STOMP.js"></script>
</body>
</html>
