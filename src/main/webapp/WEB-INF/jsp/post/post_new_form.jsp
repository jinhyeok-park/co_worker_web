<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${isEditMode ? '커뮤니티 수정' : '커뮤니티 생성'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/newpost.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
    <style>
        .custom-scrollbar::-webkit-scrollbar {
          display: none; /* Chrome, Safari and Opera */
        }

        #hrColor {border-color: rgb(14, 165, 233);}

        .btn-submit {
            background-color: #0ea5e9;
        }

        .btn-submit:hover {
            background-color: #0ea5e9;
            opacity: 0.5;
        }
    </style>
</head>
<body class="bg-gray-200">
    <div class="max-w-4xl border-none rounded shadow bg-white mx-auto py-10">
            <h2 class="text-2xl mx-10 font-bold mb-5">${isEditMode ? 'Edit Community!' : 'Create Community!'}</h2>
            <form action="${isEditMode ? '/post/edit_post.do' : '/post/post_new_form.html'}" method="post" class="bg-white rounded px-8 pt-6 pb-8 mb-4">
                <div class="mb-4">
                    <label for="title" class="block text-gray-700 text-sm font-bold mb-2"></label>
                    <input type="text" id="title" placeholder="제목" name="title" required class="w-full py-2 px-3 text-gray-700 " style="border:none;" value="${title}">
                </div>
                <hr id="hrColor">
                <div class="mb-4">
                    <label for="content" class="block text-gray-700 text-sm font-bold mb-2"></label>
                    <textarea id="content" name="content" placeholder="내용을 입력해 주세요..."  rows="10" required style="border:none;" class="custom-scrollbar rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">${content}</textarea>
                </div>
                <hr>
                <div class="mb-4">
                    <label for="apply_limit" class="block text-gray-700 text-sm font-bold mb-2"></label>
                    <input type="number" placeholder="최대 지원자" id="apply_limit" name="apply_limit" value="${apply_limit}" min="0" class="rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <hr>

                <!-- Hidden fields for location data and possibly other metadata -->
                <input type="hidden" id="load_x" name="axis_x" value="${axis_x}">
                <input type="hidden" id="load_y" name="axis_y" value="${axis_y}">
                <input type="hidden" id="address" name="address" value="${address}">
                <input type="hidden" id="proposal_id" name="proposal_id" value="${proposal_id}">

                <div class="flex items-center mt-5 justify-end">
                    <input type="submit" id="submitButton" value="${isEditMode ? 'Update' : 'Create'}" class="btn-submit pointer-events-auto ml-8 rounded-md bg-indigo-600 px-3 py-2 text-[0.8125rem] font-semibold leading-5 text-white hover:bg-indigo-500 ">
                </div>
                <p class="text-gray-400 mb-4" style="font-size:10px">*장소를 선택해주세요! 필수는 아닙니다</p>
                        <input id="clickedInfo" readonly placeholder="선택된 장소가 표시됩니다." class="mb-4"></input>
                <br>
                        <div class="map_wrap mx-auto w-full border rounded shadow">
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
            </form>


    </div>

    <script src="${pageContext.request.contextPath}/resource/js/post/post_new_form.js"></script>
</body>
</html>