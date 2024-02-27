<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 존재 여부를 확인합니다. 별도로 세션 변수를 선언할 필요가 없습니다.
    if (session == null || session.getAttribute("user_id") == null) {
        // 사용자가 로그인하지 않은 경우 로그인 페이지로 리디렉션합니다.
        response.sendRedirect("/login");
        return; // 리디렉션 후 추가 코드 실행을 방지하기 위해 리턴합니다.
    }
%>
<html>
<head>
    <title>Hello Page</title>
</head>
<body>
    <h1>Hello from JSP!</h1>
</body>
</html>