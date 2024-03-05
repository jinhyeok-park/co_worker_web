var stompClient = null;
var roomId = '1'; // 예시로 '1'을 사용. 실제 애플리케이션에서는 적절한 방식으로 설정 필요

window.onload = function() {
    function connect() {
        var socket = new SockJS("/wd-stomp");
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function() {
            console.log("Connected");
            stompClient.subscribe('/room/' + roomId, function(message) {
                console.log("Message received: ", message);
                // 메시지를 화면에 표시하는 로직 추가
                var test = JSON.parse(message.body);
                alert(test.message);

            });
        });
    }

    window.connect = connect; // 함수를 window 객체에 할당하여 HTML 버튼에서 접근 가능하게 함

function sendMessage() {
    var messageContent = document.getElementById('messageContent').value;
    if(messageContent && stompClient) {
        var chatMessage = {
            message: messageContent
            // roomId 등 필요한 다른 필드를 추가할 수 있습니다.
        };
        // "/app" 대신 "/send" prefix를 사용하도록 수정
        stompClient.send("/send/" + roomId, {}, JSON.stringify(chatMessage));
        document.getElementById('messageContent').value = ''; // 메시지 전송 후 입력 필드 초기화
    }
}

    window.sendMessage = sendMessage; // 함수를 window 객체에 할당
}