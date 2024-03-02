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
           <div>
              <a href="/post/${post.proposal_id}">${post.title}</a>
             </div>
        </c:forEach>
            <!-- 사용자가 작성한 글 목록이 여기에 표시됩니다. -->
        </ul>
    </div>

    <div class="application-history">
        <h2>내가 지원한 내역</h2>
        <ul id="myApplications">
        <c:forEach var="post" items="${myapplydata}">
                   <div>
                      <a href="/post/${post.proposal_id}">${post.title}</a>
                     </div>
               </c:forEach>
            <!-- 사용자가 지원한 내역이 여기에 표시됩니다. -->
        </ul>
    </div>
<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
</body>
</html>