// script.js
const loginForm = document.getElementById('loginForm');
const errorMessage = document.getElementById('errorMessage');

loginForm.addEventListener('submit', function(event) {
  event.preventDefault();

  const username = loginForm.username.value;
  const password = loginForm.password.value;

  // 간단한 로그인 검증 로직
  if (username === 'admin' && password === 'password') {
    // 로그인 성공 시 여기에 작성
    alert('로그인 성공!');
  } else {
    errorMessage.textContent = '잘못된 사용자 이름 또는 비밀번호입니다.';
  }
});
