var stompClient = null;
var roomId = document.getElementById("getProposal_id").getAttribute("data-proposal-id");

window.addEventListener("DOMContentLoaded", function () {


    connect();

    function connect ()
    {
        var socket = new SockJS("/wd-stomp"); //listen what address?
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function () {
            console.log("connected : " + roomId );
            stompClient.subscribe('/room/' + roomId, function (message)
            {
                var entity = JSON.parse(message.body);


                   // 새 메시지를 위한 div 요소 생성
                        var messageElement = document.createElement("div");
                        messageElement.classList.add("message"); // CSS 클래스 추가 (스타일링을 위해)

                        // 메시지 텍스트 설정
                        var msgContent = entity.sender + ": " + entity.message;
                        messageElement.textContent = msgContent; // 혹은 entity의 다른 속성을 사용

                        // 메시지를 messages 컨테이너에 추가
                        var messagesContainer = document.getElementById("messages");
                        messagesContainer.appendChild(messageElement);

                        // 메시지가 추가될 때마다 스크롤을 아래로 이동시키기 (선택적)
                        messagesContainer.scrollTop = messagesContainer.scrollHeight;

            })
        })
    }

})

    window.connect = connect; // 함수를 window 객체에 할당하여 HTML 버튼에서 접근 가능하게 함

function sendMessage() {
    var messageContent = document.getElementById('messageContent').value;
    var user_id = document.getElementById("user_id").value;
    alert(user_id);
    if(messageContent && stompClient) {
        var chatMessage = {
            message: messageContent,
            sender: user_id
            // roomId 등 필요한 다른 필드를 추가할 수 있습니다.
        };
        // "/app" 대신 "/send" prefix를 사용하도록 수정
        stompClient.send("/send/" + roomId, {}, JSON.stringify(chatMessage));
        document.getElementById('messageContent').value = ''; // 메시지 전송 후 입력 필드 초기화
    }
}

    window.sendMessage = sendMessage; // 함수를 window 객체에 할당
