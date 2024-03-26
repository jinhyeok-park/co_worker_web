<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>CO-WORKER My Page</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

        .btn-edit-div {
            text-align: right;
        }

        .btn-edit {
            background-color: #0ea5e9;
        }

        .btn-edit:hover {
            background-color: #0ea5e9;
            opacity: 0.5;
        }
    </style>
</head>
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

        <%-- 탭 구분 영역 시작--%>
        <div class="mt-10">
            <div class="flex overflow-auto -mx-4 sm:mx-0">
                <ul class="flex-none inline-grid gap-x-2 px-4 sm:px-0 xl:gap-x-6" style="grid-template-columns:repeat(3, minmax(6rem, 1fr))">
                    <li style="text-align: center">
                        <button type="button" id="myProfile" class="tab group mt-8 font-semibold text-gray-500 dark:text-gray-400">
                            My Profile
                        </button>
                    </li>
                    <li>
                        <button type="button" id="myCommunity" class="tab group mt-8 font-semibold text-gray-500 dark:text-gray-400">
                            My Community
                        </button>
                    </li>
                    <li>
                        <button type="button" id="applyCommunity" class="tab group mt-8 font-semibold text-gray-500 dark:text-gray-400">
                            Apply Community
                        </button>
                    </li>
                </ul>
            </div>
        </div><%-- 탭 구분 영역 끝--%>

        <%-- My Profile 영역 시작 --%>
        <div class="user-info bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 my-8">
            <div class="relative rounded-xl overflow-auto">
                <div class="shadow-sm overflow-hidden my-8">
                    <table class="border-collapse table-auto w-full text-sm">
                        <tbody class="bg-white dark:bg-slate-800">
                        <tr>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-32 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">Email</td>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-80 p-4 text-slate-500 dark:text-slate-400">${userData.email}</td>
                        </tr>
                        <tr>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-32 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">Nickname</td>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-80 p-4 text-slate-500 dark:text-slate-400">${userData.nickname}</td>
                        </tr>
                        <tr>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-32 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">Phone Number</td>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-80 p-4 text-slate-500 dark:text-slate-400">${userData.phone_num}</td>
                        </tr>
                        <tr>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-32 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">Username</td>
                            <td class="border-b border-slate-100 dark:border-slate-700 w-80 p-4 text-slate-500 dark:text-slate-400">${userData.user_name}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="btn-edit-div">
                <button type="submit" id="editUserInfo" class="btn-edit pointer-events-auto ml-8 rounded-md bg-indigo-600 px-3 py-2 text-[0.8125rem] font-semibold leading-5 text-white hover:bg-indigo-500">
                    정보 수정
                </button>
            </div>
        </div><%-- My Profile 영역 끝 --%>

        <%-- My Community 영역 시작 --%>
        <div class="user-contents bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 my-8">
            <div class="relative rounded-xl overflow-auto">
                <div class="shadow-sm overflow-hidden my-8">
                    <table class="border-collapse table-auto w-full text-sm">
                        <thead>
                        <tr>
                            <th class="border-b dark:border-slate-600 font-bold p-4 pl-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Group Name</th>
                            <th class="border-b dark:border-slate-600 font-bold p-4 pl-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Chat Status</th>
                            <th class="border-b dark:border-slate-600 font-bold p-4 pr-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Team Page</th>
                            <th class="border-b dark:border-slate-600 font-bold p-4 pr-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Member</th>
                            <th class="border-b dark:border-slate-600 font-bold p-4 pr-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Request Member</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white dark:bg-slate-800">

                    <c:forEach var="post" items="${mypostdata}">
                        <tr>
                            <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                <a href="/post/${post.proposal_id}/post_detail_form.html" class="post-title text-blue-500 hover:text-blue-800">${post.title}</a>
                            </td>
                            <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                <c:choose>
                                    <c:when test="${post.chatroom_status == '1'}">
                                        <form class="chatForm" action="/chatstart/${post.proposal_id}" method="GET" onsubmit="openChatWindow(event)" style="margin-bottom: 0">
                                            <input type="submit" value="chatting" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                                            <input type="button" value="Delete Chat" data-proposal-id="${post.proposal_id}" class="chatRoomDeleteQuestion bg-red-400 hover:bg-red-500 text-white font-bold py-2 px-4 rounded">
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" value="Create Chat" data-proposal-id="${post.proposal_id}" class="chatRoomStartQuestion bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${post.chatroom_status == '1'}">
                                </c:if>
                            </td>
                            <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                <c:choose>
                                    <c:when test="${post.teampage_status == '1'}">
                                        <input type="button" value="TeamPage" class="teamPageButton-${post.proposal_id} bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-2 px-4 rounded">
                                        <input type="button" value="Delete TeamPage" data-proposal-id="${post.proposal_id}" class="DeleteTeamPageButton bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-2 px-4 rounded">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="button" value="create TeamPage" data-proposal-id="${post.proposal_id}" class="CreateTeamPageButton bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-2 px-4 rounded">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                <input type="button" value="View" data-proposal-id="${post.proposal_id}" class="showMembersBtn bg-gray-400 hover:bg-gray-500 text-white font-bold py-2 px-4 rounded">
                                <ul class="memberList-${post.proposal_id}" data-proposal-id="${post.proposal_id}"></ul>
                            </td>
                            <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                <ul class="applications">
                                    <c:forEach var="appliers" items="${appliers}">
                                        <c:if test="${post.apply_accept_count < post.apply_limit}">
                                            <c:if test="${post.proposal_id eq appliers.proposal_id}">
                                                <c:if test="${appliers.status eq '0'}">
                                                    <li class="flex items-center justify-between">
                                                        <form action="/post/post_accept.do" method="post">
                                                            <span>${appliers.user_id}</span>
                                                            (
                                                            <input type="submit" name="action" value="accept" class="text-blue-500 font-bold py-1 px-2" style="border: none; background-color: white;">
                                                            |
                                                            <input type="submit" name="action" value="reject" class="text-red-500 font-bold py-1 px-2" style="border: none; background-color: white;">
                                                            )
                                                            <input type="hidden" name="proposal_id" value="${appliers.proposal_id}">
                                                            <input type="hidden" name="user_id" value="${appliers.user_id}">
                                                        </form>
                                                    </li>
                                                </c:if>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><%-- My Community 영역 끝 --%>

        <%-- Apply Community 영역 시작 --%>
        <div class="application-history bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 my-8">
            <div class="relative rounded-xl overflow-auto">
                <div class="shadow-sm overflow-hidden my-8">
                    <table class="border-collapse table-auto w-full text-sm">
                        <thead>
                        <tr>
                            <th class="border-b dark:border-slate-600 font-bold w-64 p-4 pl-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Group Name</th>
                            <th class="border-b dark:border-slate-600 font-bold w-48 p-4 pl-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Apply Status</th>
                            <th colspan="3" class="border-b dark:border-slate-600 font-bold w-64 p-4 pr-8 pt-0 pb-3 text-base font-semibold text-slate-400 dark:text-slate-200 text-left">Action</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white dark:bg-slate-800">
                            <c:forEach var="post" items="${myapplydata}">
                                <tr id="postContainer${post.proposal_id}">
                                    <c:forEach var="status" items="${myapplystatus}">
                                        <c:if test="${post.proposal_id eq status.proposal_id}">
                                            <td class="border-b border-slate-100 dark:border-slate-700 w-48 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                                <a href="/post/${post.proposal_id}/post_detail_form.html" id="myAplly${post.proposal_id}" class="text-blue-500 hover:text-blue-800">${post.title}</a>
                                            </td>
                                            <td class="border-b border-slate-100 dark:border-slate-700 w-48 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                                <c:choose>
                                                    <c:when test="${status.status eq '0'}">
                                                        <span>HOLD</span>
                                                    </c:when>
                                                    <c:when test="${status.status eq '1'}">
                                                        <span>ACCEPT</span>
                                                    </c:when>
                                                    <c:when test="${status.status eq '2'}">
                                                        <span>REJECT</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td class="border-b border-slate-100 dark:border-slate-700 w-48 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                                <button type="button" data-proposal-id="${post.proposal_id}" data-user-id="${sessionScope.user_id}"class="exitButton bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">exit</button>
                                            </td>
                                            <td class="border-b border-slate-100 dark:border-slate-700 w-48 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                                <form class="chatForm" action="/chatstart/${post.proposal_id}" method="GET" onsubmit="openChatWindow(event)">
                                                    <c:if test="${status.status == '1' && post.chatroom_status == '1'}">
                                                        <input type="submit" value="chatting" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                                    </c:if>
                                                </form>
                                            </td>
                                            <td class="border-b border-slate-100 dark:border-slate-700 w-48 p-4 pl-8 text-base font-semibold text-slate-500 dark:text-slate-400">
                                                <c:if test="${status.status == '1'}">
                                                    <input type="button" value="TeamPage" class="teamPageButton-${post.proposal_id} bg-indigo-500 hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded">
                                                </c:if>
                                            </td>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><%-- Apply Community 영역 끝 --%>
    </div><%-- Container 영역 끝 --%>

    <div id="roomIds" data-roomids="${roomIds}"></div>

    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/mypage/my_page.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/notification/notification.js"></script>
</body>
</html>
