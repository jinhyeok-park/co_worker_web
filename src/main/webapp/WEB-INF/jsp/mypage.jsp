<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Hello Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
    <div class="container mx-auto p-8">
        <div class="user-info bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <h2 class="block text-gray-700 text-lg font-bold mb-2">사용자 정보</h2>
            <p><strong>Email:</strong> <span id="email">${userData.email}</span></p>
            <p><strong>Nickname:</strong> <span id="nickname">${userData.nickname}</span></p>
            <p><strong>Phone Number:</strong> <span id="phoneNum">${userData.phone_num}</span></p>
            <p><strong>Username:</strong> <span id="username">${userData.user_name}</span></p>
            <button id="editUserInfo" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">정보 수정</button>
        </div>

       <div class="user-contents bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
           <h2 class="block text-gray-700 text-lg font-bold mb-2">내가 작성한 글</h2>
           <ul id="myPosts">
               <c:forEach var="post" items="${mypostdata}">
                   <li class="mb-4">
                       <div class="post-item">
                           <div class="flex justify-between items-center">
                               <a href="/post/${post.proposal_id}" class="post-title text-blue-500 hover:text-blue-800">${post.title}</a>
                               <form class="chatForm" action="/chatstart/${post.proposal_id}" method="GET" onsubmit="openChatWindow(event)">
                                   <input type="submit" value="chatting" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                               </form>
                           </div>
                           <div class="post-details">
                               <ul class="applications">
                                   <c:forEach var="appliers" items="${appliers}">
                                       <c:if test="${post.apply_accept_count < post.apply_limit}">
                                           <c:if test="${post.proposal_id eq appliers.proposal_id}">
                                               <c:if test="${appliers.status eq '0'}">
                                                   <li class="flex items-center justify-between">
                                                       <span>${appliers.user_id}</span>
                                                       <form action="/MyPageButtonController" method="post">
                                                           <input type="submit" name="action" value="accept" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 rounded">
                                                           <input type="submit" name="action" value="reject" class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded">
                                                           <input type="hidden" name="proposal_id" value="${appliers.proposal_id}">
                                                           <input type="hidden" name="user_id" value="${appliers.user_id}">
                                                       </form>
                                                   </li>
                                               </c:if>
                                           </c:if>
                                       </c:if>
                                   </c:forEach>
                               </ul>
                           </div>
                       </div>
                   </li>
               </c:forEach>
           </ul>
       </div>


        <div class="application-history bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <h2 class="block text-gray-700 text-lg font-bold mb-2">내가 지원한 내역</h2>
            <ul id="myApplications">
                <c:forEach var="post" items="${myapplydata}">
                    <c:forEach var="status" items="${myapplystatus}">
                        <c:if test="${post.proposal_id eq status.proposal_id}">
                            <div class="mb-4">
                                <a href="/post/${post.proposal_id}" class="text-blue-500 hover:text-blue-800">${post.title}</a>
                                <span>status : "${status.status}"</span>
                                <form class="chatForm" action="/chatstart/${post.proposal_id}" method="GET" onsubmit="openChatWindow(event)">
                            <c:if test="${status.status != '2'}">
                                <input type="submit" value="chatting" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                            </c:if>
                                </form>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div id="roomIds" data-roomids="${roomIds}"></div>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/mypage.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/notification.js"></script>
</body>
</html>
