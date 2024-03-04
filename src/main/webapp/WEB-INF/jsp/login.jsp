<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!-- Tailwind CSS 추가 -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="h-screen flex justify-center items-center bg-gray-100">
  <div class="w-full max-w-xs">
    <form id="loginForm" action="/login" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 class="text-xl mb-4">Login</h2>
      <div class="mb-4">
        <label for="user_id" class="block text-gray-700 text-sm font-bold mb-2">Username</label>
        <input type="text" id="user_id" name="user_id" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
      </div>
      <div class="mb-6">
        <label for="pwd" class="block text-gray-700 text-sm font-bold mb-2">Password</label>
        <input type="password" id="pwd" name="pwd" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
      </div>
      <div class="flex items-center justify-between">
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full">Login</button>
      </div>
    </form>
    <div id="errorMessage" class="text-center text-red-500"></div>
  </div>
</body>
</html>
