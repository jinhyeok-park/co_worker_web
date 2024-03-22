<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 세션 존재 여부를 확인합니다. 별도로 세션 변수를 선언할 필요가 없습니다.
    if (session == null || session.getAttribute("user_id") == null) {
        // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션합니다.
        response.sendRedirect("/login/login.html");
        return; // 리디렉션 후 추가 코드 실행을 방지하기 위해 리턴합니다.
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/postDetail.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .map_wrap {position:relative;width:100%;height:350px;}
        .title {font-weight:bold;display:block;}
        .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        #centerAddr {display:block;margin-top:2px;font-weight: normal;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    </style>
</head>
<body>
<div class="container">
    <h1 class="post-title">게시물 제목: ${detailPost.title}</h1>
    <h2 class="apply-status"> 최대 지원 가능 수 ${detailPost.apply_limit}</h2>
    <h2 class="apply-status"> 지원 수락한 수 ${detailPost.apply_accept_count}</h2>
    <h2>현재 지원자: <span id="current-applicants">${detailPost.apply_count}</span></h2>
    <div class="post-metadata">
<c:if test="${not empty sessionScope.user_id && sessionScope.user_id == detailPost.user_id}">
    <input id="postDelete" type="button" value="Delete">
    <input id="postEdit" type="button" value="Edit">
</c:if>

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
        <input type="hidden" id="axis_x" value="${detailPost.axis_x}" />
        <input type="hidden" id="axis_y" value="${detailPost.axis_y}" />
        <c:if test="${detailPost.axis_x != 0 && detailPost.axis_y != 0}">
        ##지도에 좌표값이 존재하는지 유무 검사해서 보여줘야함
        <div class="map_wrap">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
            <div class="hAddr">
                <span class="title">지도중심기준 행정동 주소정보</span>
                <span id="centerAddr"></span>
            </div>
        </c:if>
        </div>

</div>
<div class="container">
      <c:forEach var="comment" items="${comments}">
         <div id="comment-${comment.user_id}">
            <span id="content-${comment.comment_id}">${comment.content}</span>
            <c:if test="${comment.user_id == sessionScope.user_id}">
            <button class="editbutton" type="button" data-comment-id="${comment.comment_id}">수정</button>
            <button type="button" class="comment_delete" data-comment-id="${comment.comment_id}" data-user-id="${comment.user_id}">삭제</button>
            </c:if>
         </div>
      </c:forEach>
        <h2>댓글</h2>
        <form action="/comment/${detailPost.proposal_id}/set_comment.do" method="post">
            <input type="hidden" name="postId" value="${detailPost.proposal_id}">
            <textarea name="content" required="required"></textarea>
            <button type="submit">댓글 작성</button>
        </form>
    </div>
    <input type="hidden" id="pro_id" value="${detailPost.proposal_id}" />
    <script src="${pageContext.request.contextPath}/resource/js/post/post_detail_form.js"></script>
</body>
</html>
