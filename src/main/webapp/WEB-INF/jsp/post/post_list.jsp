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
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>게시판</title>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4">
        <h1 class="text-2xl font-bold text-gray-900 pt-6 mb-4">게시판</h1>
        <form action="/post/post_edit_form.html" class="mb-4">
            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                새 글 작성
            </button>
        </form>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
             <div id="postListContainer" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <!-- 동적으로 게시글이 여기에 생성됩니다. -->
                    </div>
               <div id="pagination" class="mt-4">
                        <!-- 페이지네이션 컨트롤이 여기에 생성됩니다. -->
              </div>
        </div>
    </div>
      <div id="roomIds" data-roomids="${roomIds}"></div>
        <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/notification/notification.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/post/post_list.js"></script>
        <script>
                var jsonPostData = JSON.parse('${jsonPostData}');
        </script>
</body>
</html>