<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/newpost.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
</head>
<body>
    <div class="container">
        <h2>게시글 작성</h2>
        <form action="/newpost" method="post">
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>

            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="10" required></textarea>
            <input type="hidden" id="load_x" name="axis_x">
            <input type="hidden" id="load_y" name="axis_y">
            <input type="hidden" id="address" name="address">
            <input type="submit" value="게시글 작성">
       </form>
        <br>
        <p>장소를 선택해주세요! 필수는 아닙니다</p>
        <div id="clickedInfo"></div>
        <br>
        <div class="map_wrap">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="성수역" id="keyword" size="15">
                            <button type="submit">검색하기</button>
                        </form>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>

    </div>
    <script src="${pageContext.request.contextPath}/resource/js/newpost.js"></script>
</body>
</html>
