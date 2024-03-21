<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEditMode ? '회원 정보 수정' : '회원 가입'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font.css">

    <%-- font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kodchasan:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <!-- Tailwind CSS CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
      .myButton {
        border-color: rgb(14, 165, 233); /* 테두리 색상 설정 */
        color: rgb(14, 165, 233); /* 글자 색상 설정 */
      }

      .myButton:hover {
        background-color: rgb(13, 148, 209); /* 호버 시 배경색 - 조금 더 진한 sky 색상 */
        color: white; /* 호버 시 글자 색상 */
      }
    </style>
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
    <div class="w-full max-w-md">
        <div class="flex justify-center mb-6">
            <div>
                <img src="${pageContext.request.contextPath}/resource/img/logo.png" alt="logo" class="h-12">
            </div>
            <div class="kodchasan-bold">co-worker</div>
        </div>
        <form action="${isEditMode ? '/mypage/user_edit.do' : '/signup/signup.do'}" method="post" class="bg-white border border-blue-300 shadow-2xl rounded-lg px-8 pt-6 pb-8 mb-4" style="--tw-shadow-color: #0ea5e9; --tw-shadow: 0 20px 40px -12px var(--tw-shadow-color);">
            <h2 style="color: rgb(14, 165, 233);" class="text-xl text-left font-bold mb-6 font-sans">${isEditMode ? '회원 정보 수정<br>정보를 입력해주세요' : '회원 가입을 위해<br>정보를 입력해주세요'}</h2>
              <c:if test="${!isEditMode}">
                            <div class="mb-4 flex items-center space-x-2 ">
                                <label for="user_id" class="block text-gray-400 text-sm font-bold mb-2">*ID</label>
                                <input type="text" id="user_id" name="user_id"  required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-400 focus:ring-0 focus:outline-none focus:border-blue-500 w-full">
                                <button type='button' id="checkUserIdBtn" class="myButton mt-2 border font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-2/5 bg-white ">중복확인</button>
                            </div>
                        </c:if>
            <div class="mb-4">
                <label for="username" class="block text-gray-400 text-sm font-bold mb-2">*이름</label>
                <input type="text" id="username" name="username" value="${isEditMode ? user_name : ''}" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-500 focus:ring-0 focus:outline-none focus:border-blue-400 w-full">
            </div>
            <div class="mb-4">
                <label for="password" class="block text-gray-400 text-sm font-bold mb-2">*비밀번호</label>
                <input type="password" id="password" name="password" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-500 focus:ring-0 focus:outline-none focus:border-blue-500 w-full">
            </div>
            <div class="mb-4">
            <label for="password_check" class="block text-gray-400 text-sm font-bold mb-2">*비밀번호 확인</label>
            <input type="password" id="password_check" name="password_check" onkeyup="PasswordCheck();" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-500 focus:ring-0 focus:outline-none focus:border-blue-400 w-full">
            </div>
            <div id="passwordCheckFlag" class="text-red-500 text-xs">비밀 번호가 일치하지 않습니다.</div>
            <br>
            <div class="mb-4">
                <label for="email" class="block text-gray-400 text-sm font-bold mb-2">*이메일</label>
                <input type="email" id="email" name="email" value="${isEditMode ? email : ''}" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-500 focus:ring-0 focus:outline-none focus:border-blue-400 w-full">
            </div>
            <div class="mb-4">
                <label for="nickname" class="block text-gray-400 text-sm font-bold mb-2">*닉네임</label>
                <input type="text" id="nickname" name="nickname" value="${isEditMode ? nickname : ''}" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-500 focus:ring-0 focus:outline-none focus:border-blue-400 w-full">
            </div>
            <div class="mb-4">
                <label for="phoneNum" class="block text-gray-400 text-sm font-bold mb-2">*휴대폰 번호</label>
                <input type="tel" id="phoneNum" name="phoneNum" value="${isEditMode ? phonenum : ''}" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-500 focus:ring-0 focus:outline-none focus:border-blue-400 w-full">
            </div>
            <div class="flex items-center justify-center">
                <input type="submit" value="${isEditMode ? '정보 수정' : '가입하기'}" class="myButton mt-2 border border-blue-500 text-blue-500 hover:bg-blue-500 hover:text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-2/5 bg-white">
            </div>
        </form>
        <script>
            var isEditMode = ${isEditMode != null ? isEditMode : false};
        </script>
    </div>
    <script src="${pageContext.request.contextPath}/resource/js/login/sign_up.js"></script>
</body>
</html>
