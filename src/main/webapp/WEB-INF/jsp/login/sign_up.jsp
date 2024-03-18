<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEditMode ? '회원 정보 수정' : '회원 가입'}</title>
    <!-- Tailwind CSS CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
    <div class="w-full max-w-md">
        <div class="flex justify-center mb-6">
            <img src="${pageContext.request.contextPath}/resource/img/logo.png" alt="logo" class="h-12">
        </div>
        <form action="${isEditMode ? '/mypage/user_edit.do' : '/signup/signup.do'}" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <h2 class="text-xl text-center font-bold mb-6">${isEditMode ? '회원 정보 수정' : '회원 가입'}</h2>
              <c:if test="${!isEditMode}">
                            <div class="mb-4">
                                <label for="user_id" class="block text-gray-700 text-sm font-bold mb-2">ID:</label>
                                <input type="text" id="user_id" name="user_id" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                <button type='button' id="checkUserIdBtn" class="mt-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">중복확인</button>
                            </div>
                        </c:if>
            <div class="mb-4">
                <label for="username" class="block text-gray-700 text-sm font-bold mb-2">이름:</label>
                <input type="text" id="username" name="username" value="${isEditMode ? user_name : ''}" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="password" class="block text-gray-700 text-sm font-bold mb-2">비밀번호:</label>
                <input type="password" id="password" name="password" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
            <label for="password_check" class="block text-gray-700 text-sm font-bold mb-2">비밀번호 확인:</label>
            <input type="password" id="password_check" name="password_check" onkeyup="PasswordCheck();" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div id="passwordCheckFlag">비밀 번호가 일치하지 않습니다.</div>
            <div class="mb-4">
                <label for="email" class="block text-gray-700 text-sm font-bold mb-2">이메일:</label>
                <input type="email" id="email" name="email" value="${isEditMode ? email : ''}" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="nickname" class="block text-gray-700 text-sm font-bold mb-2">닉네임:</label>
                <input type="text" id="nickname" name="nickname" value="${isEditMode ? nickname : ''}" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="phoneNum" class="block text-gray-700 text-sm font-bold mb-2">휴대폰 번호:</label>
                <input type="tel" id="phoneNum" name="phoneNum" value="${isEditMode ? phonenum : ''}" "required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="flex items-center justify-between">
                <input type="submit" value="${isEditMode ? '정보 수정' : '가입하기'}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full">
            </div>
        </form>
        <script>
            var isEditMode = ${isEditMode != null ? isEditMode : false};
        </script>
    </div>
    <script src="${pageContext.request.contextPath}/resource/js/login/sign_up.js"></script>
</body>
</html>
