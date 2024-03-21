<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!-- Tailwind CSS 추가 -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
      .myButton {
        border: 1px solid rgb(14, 165, 233); /* 테두리 색상과 너비 설정 */
        color: rgb(14, 165, 233); /* 글자 색상 설정 */
      }

      .myButton:hover {
        background-color: rgb(13, 148, 209); /* 호버 시 배경색 - 조금 더 진한 sky 색상 */
        color: white; /* 호버 시 글자 색상 */
      }
    </style>
</head>
<body class="h-screen flex justify-center items-center bg-gray-100">
  <div class="w-full max-w-xs">
    <form id="loginForm" action="/login/login.do" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 id="title" class="text-xl mb-4">Login</h2>
      <div class="mb-4">
        <label for="user_id" class="block text-gray-400 text-sm font-bold mb-2">*ID</label>
        <input type="text" id="user_id" name="user_id" required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-400 focus:ring-0 focus:outline-none focus:border-blue-500 w-full">
      </div>
      <br>
      <div class="mb-6">
        <label for="pwd" class="block text-gray-400 text-sm font-bold mb-2">*Password</label>
        <input type="password" id="pwd" name="pwd"  required class="bg-transparent border-0 border-b border-gray-400 focus:border-blue-400 focus:ring-0 focus:outline-none focus:border-blue-500 w-full">
      </div>
      <div class="flex items-center justify-between">
        <button type="submit" class="myButton font-bold py-2 px-4 rounded focus:outline-none  focus:shadow-outline w-full">Login</button>
      </div>
    </form>
    <div id="errorMessage" class="text-center text-red-500"></div>
  </div>
</body>
</html>