<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Hello Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>Hello this is index page!</h1>
<form action="/login">
    <input type="submit" value="Login" />
</form>
<form action="/signup">
    <input type="submit" value="signup" />
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
 var postData = JSON.parse('${post}');
</script>
<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
</body>
</html>
