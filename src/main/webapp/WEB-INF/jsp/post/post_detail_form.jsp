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
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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
<body class="bg-gray-200">
<div class="container max-w-4xl border-none rounded shadow bg-white mx-auto py-10">
    <h1 class="post-title text-2xl mx-10 font-bold mb-5">${detailPost.title}</h1>
    <hr>
    <div class="post-metadata">
        </div>
        <div class="post-content mx-10 custom-scrollbar rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline ">
            ${detailPost.content}
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.user_id and sessionScope.user_id ne detailPost.user_id}">
                <button type="button" class="apply-button" name="apply_id" value="${detailPost.proposal_id}">지원하기</button>
            </c:when>
        </c:choose>
        <input type="hidden" id="axis_x" value="${detailPost.axis_x}" />
        <input type="hidden" id="axis_y" value="${detailPost.axis_y}" />
        <div class="flex justify-end mx-10" style="font-size:12px">
            <div class="apply-status"> 최대 지원 가능 수 ${detailPost.apply_limit}</div>
            <br>
            <div class="apply-status"> 지원 수락한 수 ${detailPost.apply_accept_count}</div>
            <br>
            <div id="current-applicants">현재 지원한 수 ${detailPost.apply_count}</div>
            </div>
             <div class="mx-10 mb-3 flex justify-end" style="font-size:12px">작성자: ${detailPost.user_id}</div>
            <c:if test="${not empty sessionScope.user_id && sessionScope.user_id == detailPost.user_id}">
            <div class="flex justify-end mx-10">
                <input class="mx-2 bg-blue-300 border-none rounded shadow hover:bg-blue-400 w-20 h-10 text-lg" id="postEdit" type="button" value="Edit">
                <input class="bg-red-300 border-none rounded shadow hover:bg-red-400 w-20 h-10 text-lg" id="postDelete" type="button" value="Delete">
                </div>
            </c:if>
        <c:if test="${detailPost.axis_x != 0 && detailPost.axis_y != 0}">
        ##지도에 좌표값이 존재하는지 유무 검사해서 보여줘야함
        <div class="map_wrap flex border rounded">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
            <div class="hAddr">
                <span class="title">지도중심기준 행정동 주소정보</span>
                <span id="centerAddr"></span>
            </div>
        </c:if>
        </div>
</div>
<div class="container max-w-4xl border-none bg-white mx-auto py-5er">
        <h2 class="post-title text-2xl mx-10 font-bold mb-5">댓글</h2>
        <form action="/comment/${detailPost.proposal_id}/set_comment.do" method="post" class="flex mb-7">
            <input type="hidden" name="postId" value="${detailPost.proposal_id}">
            <textarea name="content" placeholder="댓글을 작성해주세요" class="bg-gray-100 post-content ml-10 custom-scrollbar rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline " required="required"></textarea>
            <button type="submit" class="bg-blue-300 mt-2 mr-10 mb-4 ml-7 border-none rounded w-40" >댓글 작성</button>
        </form>
          <c:forEach var="comment" items="${comments}">
          <div class="flex">
             <div id="comment-${comment.user_id}" class="flex flex-col w-full">
                <div class=" font-bold mx-10">${comment.user_id}</div>
                <span id="content-${comment.comment_id}" class="mx-10 mb-5 w-full">${comment.content}</span>
            </div>
            <c:if test="${comment.user_id == sessionScope.user_id}">
                <div class="flex">
                    <button class="editbutton editbutton w-20 h-10 bg-blue-300 border-none rounded shadow hover:bg-blue-400" type="button" data-comment-id="${comment.comment_id}">수정</button>
                    <button type="button" class="comment_delete comment_delete bg-red-300 border-none rounded shadow hover:bg-red-400 w-20 h-10 text-lg mr-10" data-comment-id="${comment.comment_id}" data-user-id="${comment.user_id}">삭제</button>
                </div>
            </c:if>
            </div>
          </c:forEach>

    </div>
    <input type="hidden" id="pro_id" value="${detailPost.proposal_id}" />
    <script src="${pageContext.request.contextPath}/resource/js/post/post_detail_form.js"></script>
</body>
</html>
