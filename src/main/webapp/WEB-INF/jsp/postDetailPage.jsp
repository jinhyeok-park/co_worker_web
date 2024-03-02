<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/postDetail.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1 class="post-title">게시물 제목: ${detailPost.title}</h1>
    <h2 class="apply-status"> 최대 지원 가능 수 ${detailPost.apply_limit}</h2>
    <h2 class="apply-status"> 지원 수락한 수 ${detailPost.apply_accept_count}</h2>
    <h2>현재 지원자: <span id="current-applicants">${detailPost.apply_count}</span></h2>
    <div class="post-metadata">
            작성자: ${detailPost.user_id}
        </div>
        <div class="post-content">
            ${detailPost.content}
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.user_id and sessionScope.user_id ne detailPost.user_id}">
                <button type="button" class="apply-button" name="apply_id" value="${detailPost.proposal_id}">지원하기</button>
            </c:when>
        </c:choose>
</div>
<div class="container">
      <c:forEach var="comment" items="${comments}">
         <div>
            ${comment.user_id} : ${comment.content}
           </div>
      </c:forEach>
        <h2>댓글</h2>
        <form action="/post/${detailPost.proposal_id}/setComment" method="post">
            <input type="hidden" name="postId" value="${detailPost.proposal_id}">
            <textarea name="content" required="required"></textarea>
            <button type="submit">댓글 작성</button>
        </form>
    </div>
    <script src="${pageContext.request.contextPath}/resource/js/postDetail.js"></script>
</body>
</html>
