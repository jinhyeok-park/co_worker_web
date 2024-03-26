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
    <title>CO-WORKER Community</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/postDetail.css">

    <%-- font --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kodchasan:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <style>
        .header-div {
            border-bottom: 1px solid;
            border-bottom-color: #969696;
            margin-bottom: 10px;
        }

        .logo-title {
            color: #0ea5e9;
        }

        .logo-img {
            max-width: 40px;
            float: left;
            padding-top: 5px;
        }

        .map_wrap {
            position:relative;
            height:350px;
        }

        .title {
            font-weight:bold;
            display:block;
        }

        .hAddr {
            position:absolute;
            left:10px;
            top:10px;
            border-radius: 2px;
            background:#fff;
            background:rgba(255,255,255,0.8);
            z-index:1;padding:5px;
        }

        #centerAddr {
            display:block;
            margin-top:2px;
            font-weight: normal;
        }

        .btn-submit {
            border: 1px solid rgb(14, 165, 233); /* 테두리 색상과 너비 설정 */
            color: rgb(14, 165, 233); /* 글자 색상 설정 */
        }

        .btn-submit:hover {
            background-color: rgb(13, 148, 209); /* 호버 시 배경색 - 조금 더 진한 sky 색상 */
            color: white; /* 호버 시 글자 색상 */
        }

    </style>
</head>
<body class="bg-gray-200">
<div class="container mx-auto p-8">
    <%-- 헤더 영역 시작--%>
    <div class="header-div">
        <div class="flex flex-wrap justify-between items-center py-4">
            <div class="kodchasan-bold logo-title">
                <img class="logo-img" src="${pageContext.request.contextPath}/resource/img/logo.png"/>
                CO-WORKER
            </div>

            <div class="flex space-x-2 text-sm font-semibold" style="color: #0f172a; font-weight: 600;">
                <c:choose>
                    <c:when test="${not empty sessionScope.user_id}">
                        <a href="/post/post_list.html">Community&nbsp;</a> |
                        <a href="/mypage/my_page.html">My Page&nbsp;</a> |
                        <a href="/alarm/alarm_list.html">Alarm&nbsp;</a> |
                        <a href="#" onclick="logout()">Logout&nbsp;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/post/post_list.html">Community&nbsp;</a> |
                        <a href="/login/login.html">Login&nbsp;</a> |
                        <a href="/signup/signup.html">Sign Up&nbsp;</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div><%-- 헤더 영역 끝 --%>

    <%-- post 영역 시작 --%>
    <div class="max-w-6xl border-none rounded shadow bg-white mx-auto py-10" style="min-height: calc(110vh - 180px);">
        <div class="max-w-5xl border-none bg-white mx-auto py-10">
            <div>
                <h1 class="post-title text-2xl mx-10 font-bold mb-5">${detailPost.title}</h1>
                <div class="mx-10 mb-3 flex justify-start" style="font-size:14px">작성자 : ${detailPost.user_id}</div>
            </div>

            <hr class="mx-10">

            <div class="mx-10 flex justify-end my-5 text-base font-bold text-blue-500">
                <div class="w-48 flex justify-end"> 최대 지원 가능 인원 : ${detailPost.apply_limit}명</div>
                <div class="w-48 flex justify-end"> 지원 수락 인원 : ${detailPost.apply_accept_count}명</div>
                <div class="w-48 flex justify-end" id="current-applicants">현재 지원자 : ${detailPost.apply_count}명</div>
                <c:choose>
                    <c:when test="${not empty sessionScope.user_id and sessionScope.user_id ne detailPost.user_id}">
                        <div class="ml-10 mb-3 flex justify-end" style="font-size:14px; margin-top: -10px;">
                            <button type="button" class="apply-button btn-submit w-18 py-1 px-1 text-white rounded m-1" name="apply_id" value="${detailPost.proposal_id}">지원하기</button>
                        </div>
                    </c:when>
                </c:choose>
            </div>

            <div class="my-20 mx-10 custom-scrollbar rounded text-gray-700 mb-3 focus:outline-none focus:shadow-outline ">
                ${detailPost.content}
            </div>
            <input type="hidden" id="axis_x" value="${detailPost.axis_x}" />
            <input type="hidden" id="axis_y" value="${detailPost.axis_y}" />


            <c:if test="${detailPost.axis_x != 0 && detailPost.axis_y != 0}">
                <div class="mx-10 map_wrap flex border rounded">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    <div class="hAddr">
                        <span class="title">지도중심기준 행정동 주소정보</span>
                        <span id="centerAddr"></span>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.user_id && sessionScope.user_id == detailPost.user_id}">
                <div class="flex justify-end m-10">
                    <input class="btn-submit w-18 py-1 px-3 text-white rounded m-1" id="postEdit" type="button" value="Edit">
                    <input class="btn-submit w-18 py-1 px-3 text-white rounded m-1" id="postDelete" type="button" value="Delete">
                </div>
            </c:if>

            <hr class="mx-10">

            <form action="/comment/${detailPost.proposal_id}/set_comment.do" method="post" class="flex m-7">
                <input type="hidden" name="postId" value="${detailPost.proposal_id}">
                <div class="w-5/6">
                    <textarea name="content" placeholder="댓글을 작성해주세요." class="bg-gray-100 post-content ml-2 custom-scrollbar rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline " required="required"></textarea>
                </div>
                <div class="w-1/6 py-1 px-1 text-white rounded m-1">
                    <button type="submit" class="btn-submit w-full py-3 px-1 text-white rounded m-1" style="margin-top: -5px;">등록</button>
                </div>
            </form>

            <hr class="mx-10">

            <c:forEach var="comment" items="${comments}">
                <div class="flex mx-10 border-b-2 border-gray-200">
                    <div id="comment-${comment.user_id}" class="flex flex-col w-5/6 my-2">
                        <div class="font-bold">${comment.user_id}</div>
                        <span id="content-${comment.comment_id}" class="mb-5 w-full">${comment.content}</span>
                        <div class="font-light text-gray-400">${comment.reg_time}</div>
                    </div>
                    <c:if test="${comment.user_id == sessionScope.user_id}">
                        <div class="w-1/6">
                            <div class="flex mt-16">
                                <button class="editbutton btn-submit w-1/2 py-1 px-3 text-white rounded m-1" type="button" data-comment-id="${comment.comment_id}">수정</button>
                                <button type="button" class="comment_delete btn-submit w-1/2 py-1 px-3 text-white rounded m-1" data-comment-id="${comment.comment_id}" data-user-id="${comment.user_id}">삭제</button>
                            </div>
                        </div>
                    </c:if>
                </div>
            </c:forEach>

            <div class="flex mx-10 ">
                <div class="w-full ml-10 mb-3 flex justify-center" style="font-size:14px;margin-top: 10px;">
                    <button type="button" class="list-button btn-submit w-18 py-1 px-1 text-white rounded m-1">목록으로</button>
                </div>
            </div>


            <input type="hidden" id="pro_id" value="${detailPost.proposal_id}" />
        </div>
    </div><%-- post 영역 끝 --%>

    <script src="${pageContext.request.contextPath}/resource/js/post/post_detail_form.js"></script>
</body>
</html>
