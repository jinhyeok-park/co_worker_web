<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO-WORKER</title>

    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font.css">

    <%-- font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kodchasan:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
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

    .list-img {
        max-width: 20px;
        float: right;
        padding-top: 0px;
        margin-left: 6px;
    }

    .post-list {
        text-align: right;
        color: #0ea5e9;
        font-weight: 600;
        margin-top: 20px;
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

        <div class="text-sm font-semibold post-list">
            <span>
                <a id="post-list" href="/post/post_list.html" >All Community <img class="list-img" src="${pageContext.request.contextPath}/resource/img/list.png"/></a>
            </span>
        </div>

        <div>
            <div class="flex justify-center">
                <div class="map_wrap" style="width: 120%; height: 500px;">
                    <div id="map" style="width:100%; height:100%; position:relative; overflow:hidden;" class="rounded-lg shadow"></div>
                    <div id="menu_wrap" class="bg-white w-500 h-300">
                        <div class="option">

                        </div>
                        <hr>
                        <ul id="placesList" class="list-disc pl-5"></ul>
                        <div id="pagination" class="py-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="roomIds" data-roomids="${roomIds}" />
<script>
 var postData = JSON.parse('${postdata}');
</script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/notification/notification.js"></script>
</body>
</html>
