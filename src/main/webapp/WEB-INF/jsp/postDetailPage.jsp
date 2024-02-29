<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/postDetail.css">
</head>
<body>
<div class="container">
    <h1 class="post-title">게시물 제목: ${detailPost.title}</h1>
    <div class="post-metadata">
            작성자: ${detailPost.user_id}
        </div>
        <div class="post-content">
            ${detailPost.content}
        </div>
</div>
<div class="container">
      <c:forEach var="comment" items="${comments}">
         <div>
            ${comment.content}
           </div>
      </c:forEach>
        <h2>댓글</h2>
        <form action="/post/${detailPost.proposal_id}/setComment" method="post">
            <input type="hidden" name="postId" value="${detailPost.proposal_id}">
            <textarea name="content" required="required"></textarea>
            <button type="submit">댓글 작성</button>
        </form>
    </div>
    <script src="${pageContext.request.contextPath}/resource/js/newpost.js"></script>
</body>
</html>
