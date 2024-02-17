<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/signup.css">
</head>
<body>
<div class="logo">
    <img src="${pageContext.request.contextPath}/resource/img/logo.png" alt="logo">
</div>
<form action="/signup" method="post">
    <h2>회원 가입</h2>
    <label for="username">이름:</label>
    <input type="text" id="username" name="username" required>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>

    <label for="nickname">닉네임:</label>
    <input type="text" id="nickname" name="nickname" required>

    <label for="phoneNum">휴대폰 번호:</label>
    <input type="tel" id="phoneNum" name="phoneNum" required>

    <input type="submit" value="가입하기">
</form>
<script src="js/signup.js"></script>
</body>
</html>


