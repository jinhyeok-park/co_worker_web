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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO-WORKER Community</title>

    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <%-- font --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kodchasan:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
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

    .search-wrapper {
        top:50%;
        left:50%;
    }
    .search-wrapper.active {}

    .search-wrapper .input-holder {
        height: 70px;
        width: 70px;
        overflow: hidden;
        background: rgba(255,255,255,0);
        border-radius:6px;
        position: relative;
        transition: all 0.3s ease-in-out;
    }
    .search-wrapper.active .input-holder {
        width:450px;
        border-radius: 50px;
        background: #D7F1FA;
        transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    }
    .search-wrapper .input-holder .search-input {
        width:100%;
        height: 50px;
        padding:0px 70px 0 20px;
        opacity: 0;
        position: absolute;
        top:0px;
        left:0px;
        background: transparent;
        box-sizing: unset !important;
        border:none;
        outline:none;
        font-family:"Open Sans", Arial, Verdana;
        font-size: 16px;
        font-weight: 400;
        line-height: 20px;
        color:#282828;
        transform: translate(0, 60px);
        transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
        transition-delay: 0.3s;
    }
    .search-wrapper.active .input-holder .search-input {
        opacity: 1;
        transform: translate(0, 10px);
    }
    .search-wrapper .input-holder .search-icon {
        width:70px;
        height:70px;
        border:none;
        border-radius:6px;
        /*background: #FFF;*/
        padding:0px;
        outline:none;
        position: relative;
        z-index: 2;
        float:right;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }
    .search-wrapper.active .input-holder .search-icon {
        width: 50px;
        height:50px;
        margin: 10px;
        border-radius: 30px;
    }
    .search-wrapper .input-holder .search-icon span {
        width:22px;
        height:22px;
        display: inline-block;
        vertical-align: middle;
        position:relative;
        transform: rotate(45deg);
        transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
    }
    .search-wrapper.active .input-holder .search-icon span {
        transform: rotate(-45deg);
    }
    .search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
        position: absolute;
        content:'';
    }
    .search-wrapper .input-holder .search-icon span::before {
        width: 4px;
        height: 11px;
        left: 9px;
        top: 18px;
        border-radius: 2px;
        background: #0ea5e9;
    }
    .search-wrapper .input-holder .search-icon span::after {
        width: 20px;
        height: 20px;
        left: 0px;
        top: 0px;
        border-radius: 16px;
        border: 4px solid #0ea5e9;
    }
    .search-wrapper .close {
        position: absolute;
        z-index: 1;
        top:24px;
        right:20px;
        width:25px;
        height:25px;
        cursor: pointer;
        transform: rotate(-180deg);
        transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
        transition-delay: 0.2s;
    }
    .search-wrapper.active .close {
        right:-50px;
        transform: rotate(45deg);
        transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
        transition-delay: 0.5s;
    }
    .search-wrapper .close::before, .search-wrapper .close::after {
        position:absolute;
        content:'';
        background: rgb(14 165 233);
        border-radius: 2px;
    }
    .search-wrapper .close::before {
        width: 5px;
        height: 25px;
        left: 10px;
        top: 0px;
    }
    .search-wrapper .close::after {
        width: 25px;
        height: 5px;
        left: 0px;
        top: 10px;
    }

    .map-img {
        max-width: 20px;
        float: right;
        padding-top: 0px;
        margin-left: 6px;
    }

    .post-map {
        text-align: right;
        color: #0ea5e9;
        font-weight: 600;
        margin-top: 20px;
    }

    .btn-add-div {
        text-align: left;
        margin-left: -32px;
        margin-top: -27px;
    }

    .btn-add {
        background-color: #0ea5e9;
    }

    .btn-add:hover {
        background-color: #0ea5e9;
        opacity: 0.5;
    }

    .post-content {
        height: 100px;
        width: 260px;
        margin: 15px 0;
        font-size: 16px;
        overflow: scroll;
    }

    .post-content::-webkit-scrollbar {
        display: none;
    }
</style>
<body class="bg-gray-100">
    <div class="container mx-auto">
        <%-- 헤더 영역 시작--%>
        <div class="header-div">
            <div class="flex flex-wrap justify-between items-center py-4">
                <div class="kodchasan-bold logo-title">
                    <img class="logo-img" src="${pageContext.request.contextPath}/resource/img/logo.png"/>
                    CO-WORKER
                </div>

                <form onsubmit="searchPlaces(); return false;" class="">
                    <div class="search-wrapper">
                        <div class="input-holder">
                            <input type="text" id='keyword' class="search-input" placeholder="Type to search" />
                            <button type="submit" id='search' class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                        </div>
                    </div>
                </form>

                <div class="flex space-x-2 text-sm font-semibold" style="color: #0f172a; font-weight: 600;">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user_id}">
                            <a href="#" onclick="logout()">Logout&nbsp;</a> |
                            <a href="/mypage/my_page.html">My Page&nbsp;</a> |
                            <a href="/alarm/alarm_list.html">Alarm</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/login/login.html">Login&nbsp;</a> |
                            <a href="/signup/signup.html">Sign Up&nbsp;</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div><%-- 헤더 영역 끝 --%>

        <%-- Go to Map 영역 시작--%>
        <div class="text-sm font-semibold post-map">
            <span>
                <a href="/" >Go to Map <img class="map-img" src="${pageContext.request.contextPath}/resource/img/map.png"/></a>
            </span>
        </div><%-- Go to Map 영역 끝--%>

        <%-- Make Community Button 영역 시작 --%>
        <div class="btn-add-div">
            <form action="/post/post_edit_form.html" class="mb-4">
                <button type="submit" class="btn-add pointer-events-auto ml-8 rounded-md bg-indigo-600 px-3 py-2 text-[0.8125rem] font-semibold leading-5 text-white hover:bg-indigo-500">
                    Make Community!
                </button>
            </form>
        </div><%-- Make Community Button 영역 끝 --%>

        <%-- Community List 영역 시작 --%>
         <div id="postListContainer" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-5">
             <!-- 동적으로 게시글이 여기에 생성됩니다. -->
         </div>
        <%-- Community List 영역 끝 --%>

        <%-- Pagination 영역 시작 --%>
        <div class="flex flex-wrap justify-between items-center py-4">
             <div id="pagination" class="mt-4 space-x-4 mx-auto text-gray-600 dark:text-gray-400 font-bold">
                <!-- 페이지네이션 컨트롤이 여기에 생성됩니다. -->
             </div>
        </div>
        <%-- Pagination 영역 시작 --%>
    </div>
      <div id="roomIds" data-roomids="${roomIds}"></div>
        <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/post/post_list.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/notification/notification.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/post/post_list.js"></script>
        <script>
                var jsonPostData = JSON.parse('${jsonPostData}');
        </script>
</body>
</html>
