<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/login.css">
</head>
<body>
  <div class="container">
    <form id="loginForm" action="/login" method="post">
      <h2>Login</h2>
      <div class="input-group">
        <label for="user_id">Username</label>
        <input type="text" id="user_id" name="user_id" required>
      </div>
      <div class="input-group">
        <label for="pwd">Password</label>
        <input type="password" id="pwd" name="pwd" required>
      </div>
      <button type="submit">Login</button>
    </form>
    <div id="errorMessage" class="error-message"></div>
  </div>

</body>
</html>
