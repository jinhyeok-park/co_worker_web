<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Hello Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mypage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
 <div class="user-info">
        <h2>사용자 정보</h2>
        <p><strong>Email:</strong> <span id="email">${userData.email}</span></p>
        <p><strong>Nickname:</strong> <span id="nickname">${userData.nickname}</span></p>
        <p><strong>Phone Number:</strong> <span id="phoneNum">${userData.phone_num}</span></p>
        <p><strong>Username:</strong> <span id="username">${userData.user_name}</span></p>
        <button id="editUserInfo">정보 수정</button>
    </div>

<div class="user-contents">
    <h2>내가 작성한 글</h2>
    <ul id="myPosts">
        <c:forEach var="post" items="${mypostdata}">
            <li>
                <div class="post-item">
                    <div class="flex justify-between items-center">
                        <a href="/post/${post.proposal_id}" class="post-title">${post.title}</a>
                        <form class="chatForm" action="/chatstart/${post.proposal_id}" method="GET" onsubmit="openChatWindow(event)">
                            <input type="submit" value="chatting">
                        </form>
                    </div>
                    <div class="hidden post-details">
                        <ul class="applications">
                            <c:forEach var="appliers" items="${appliers}">
                                <c:if test="${post.apply_accept_count < post.apply_limit}">
                                    <c:if test="${post.proposal_id eq appliers.proposal_id}">
                                        <c:if test="${appliers.status eq '0'}">
                                        <li class="flex items-center justify-between">
                                            <span>${appliers.user_id}</span>
                                            <form action="/MyPageButtonController" method="post">
                                                <input type="submit" name="action" value="accept">
                                                <input type="submit" name="action" value="reject">
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


    <div class="application-history">
        <h2>내가 지원한 내역</h2>
        <ul id="myApplications">
                     <c:forEach var="post" items="${myapplydata}">
                         <c:forEach var="status" items="${myapplystatus}">
                             <c:if test="${post.proposal_id eq status.proposal_id}">
                                 <div>
                                     <a href="/post/${post.proposal_id}">${post.title}</a>
                                     status : "${status.status}"
                                     <form class="chatForm" action="/chatstart/${post.proposal_id}" method="GET" onsubmit="openChatWindow(event)">
                                     <input type="submit" value="chatting">
                                     </form>

                                 </div>
                             </c:if>
                         </c:forEach>
                     </c:forEach>

            <!-- 사용자가 지원한 내역이 여기에 표시됩니다. -->
        </ul>
    </div>
<script src="${pageContext.request.contextPath}/resource/js/mypage.js"></script>
</body>
</html>