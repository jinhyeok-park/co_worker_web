<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Alarm Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <%-- font --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kodchasan:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

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

    .logo-img, .alarm-img {
        max-width: 40px;
        float: left;
        padding-top: 5px;
    }

</style>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
<%-- Container 영역 시작 --%>
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

    <%-- Alarm 영역 시작--%>
    <div>
        <c:choose>
            <c:when test="${fn:length(alarms) eq 0 or empty alarms}">
                No Alarm Data ...
            </c:when>
            <c:otherwise>
                <c:forEach var="alarm" items="${alarms}">
                    <div class="flex w-68 items-center rounded-md bg-white my-3 p-4 shadow-xl shadow-black/5 ring-1 ring-slate-700/10">
                        <div class="flex mx-3">
                            <img class="alarm-img" src="${pageContext.request.contextPath}/resource/img/alarm.png"/>
                        </div>
                        <div class="flex">
                            <p>${alarm.message}</p>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <%-- Alarm 영역 끝--%>

    <script src="${pageContext.request.contextPath}/resource/js/alarm/alarm_list.js"></script>
</div>
</body>
</html>
