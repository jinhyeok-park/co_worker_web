<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 존재 여부를 확인합니다. 별도로 세션 변수를 선언할 필요가 없습니다.
    if (session == null || session.getAttribute("user_id") == null) {
        // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션합니다.
        response.sendRedirect("/login");
        return; // 리디렉션 후 추가 코드 실행을 방지하기 위해 리턴합니다.
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>게시판</h1>
            <div class="buttons">
            <form action="/logout" method="post">
                <input type="submit" value="logout" />
            </form>
            <form action="/newpost">
                <input type="submit" value="글쓰기" />
            </form>
            </div>
        </div>
        <div class="post-list">
            <!-- 게시글 목록; 실제 구현에서는 서버로부터 받은 데이터로 채워질 부분 -->
            <div class="post">게시글 제목 1</div>
            <div class="post">게시글 제목 2</div>
            <!-- 반복 -->
        </div>
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a class="active" href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
</body>
</html>