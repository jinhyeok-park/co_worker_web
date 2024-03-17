<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello Page</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto">
        <div class="flex flex-wrap justify-between items-center py-4">
            <h1 class="text-2xl font-bold text-gray-900 mb-4">CO-WORKER HOME PAGE!</h1>
        <form onsubmit="searchPlaces(); return false;" class="flex space-x-2 items-center">
            <input type="text" placeholder="Search" id="keyword"
                   class="shadow appearance-none border rounded w-[300px] py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline bg-transparent border-gray-300 hover:border-gray-500 focus:border-blue-500 transition duration-300 ease-in-out">
            <button type="submit" id='search' class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">검색하기</button>
        </form>
            <div class="flex space-x-2">
                <c:choose>
                    <c:when test="${not empty sessionScope.user_id}">
                        <form action="/logout" method="post">
                            <input type="submit" value="Logout" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" />
                        </form>
                        <form action="/mypage" method="GET">
                            <input type="submit" value="My Page" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" />
                        </form>
                        <form action="/alarm" method="GET">
                             <input type="submit" value="alarm" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" />
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form action="/login">
                            <input type="submit" value="Login" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" />
                        </form>
                          <form action="/signup">
                                            <input type="submit" value="Sign Up" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" />
                         </form>
                    </c:otherwise>
                </c:choose>

                <form action="/posts_Collection">
                    <input type="submit" value="Posts" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" />
                </form>
            </div>
        </div>
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
    <div id="roomIds" data-roomids="${roomIds}" />
<script>
 var postData = JSON.parse('${postdata}');
</script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/notification.js"></script>
</body>
</html>
