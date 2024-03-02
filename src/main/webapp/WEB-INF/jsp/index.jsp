<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
<%
    boolean isLoggin = false;
    if (session != null && session.getAttribute("user_id") != null)
    {
        isLoggin = true;
    }
%>
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Hello Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>CO-WORKER HOME PAGE!</h1>
<c:choose>
    <c:when test="${not empty sessionScope.user_id}">
        <form action="/logout" method="post">
            <input type="submit" value="Logout" />
        </form>
    </c:when>
    <c:otherwise>
        <form action="/login">
            <input type="submit" value="Login" />
        </form>
    </c:otherwise>
</c:choose>

<form action="/signup">
    <input type="submit" value="signup" />
</form>
<form action="/posts_Collection">
    <input type="submit" value="Posts" />
</form>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" placeholder='search' id="keyword" size="13">
                    <button type="submit" id='search' >검색하기</button>
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script>
 var postData = JSON.parse('${postdata}');
</script>
<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
</body>
</html>
