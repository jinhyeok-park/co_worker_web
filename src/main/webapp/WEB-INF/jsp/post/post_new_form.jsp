<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${isEditMode ? '게시글 수정' : '게시글 작성'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/newpost.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
</head>
<body>
    <div class="max-w-4xl mx-auto py-10">
            <h2 class="text-2xl font-bold mb-5">${isEditMode ? '게시글 수정' : '게시글 작성'}</h2>
            <form action="${isEditMode ? '/post/edit_post.do' : '/post/post_new_form.html'}" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                <div class="mb-4">
                    <label for="title" class="block text-gray-700 text-sm font-bold mb-2">제목:</label>
                    <input type="text" id="title" name="title" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="${title}">
                </div>

                <div class="mb-4">
                    <label for="content" class="block text-gray-700 text-sm font-bold mb-2">내용:</label>
                    <textarea id="content" name="content" rows="10" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">${content}</textarea>
                </div>

                <div class="mb-4">
                    <label for="apply_limit" class="block text-gray-700 text-sm font-bold mb-2">지원 가능 수:</label>
                    <input type="number" id="apply_limit" name="apply_limit" value="${apply_limit}" min="0" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <!-- Hidden fields for location data and possibly other metadata -->
                <input type="hidden" id="load_x" name="axis_x" value="${axis_x}">
                <input type="hidden" id="load_y" name="axis_y" value="${axis_y}">
                <input type="hidden" id="address" name="address" value="${address}">
                <input type="hidden" id="proposal_id" name="proposal_id" value="${proposal_id}">

                <div class="flex items-center justify-between">
                    <input type="submit" value="${isEditMode ? '게시글 수정' : '게시글 작성'}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                </div>
            </form>

        <p class="text-sm text-gray-600 mb-4">장소를 선택해주세요! 필수는 아닙니다</p>
        <div id="clickedInfo" class="mb-4"></div>
    </div>
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
    <script src="${pageContext.request.contextPath}/resource/js/post/post_new_form.js"></script>
</body>
</html>