var stompClient = null;
var roomId = document.getElementById("getProposal_id").getAttribute("data-proposal-id");
var user_id = document.getElementById("user_id").value;

document.addEventListener('keydown', function(event) {
    if (event.key === 'Enter')
    {
        sendMessage();
    }
});

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
              // 테일윈드 CSS 클래스 추가
              if(entity.sender === user_id)
              {
                messageElement.classList.add("p-2", "rounded-lg", "bg-blue-100", "max-w-max");
              }
              else
              {
                messageElement.classList.add("p-2", "rounded-lg", "bg-gray-200", "max-w-max");
              }

              // 메시지 텍스트를 담을 span 요소 생성
              var messageText = document.createElement("span");
              // 테일윈드 CSS 클래스 추가
              //messageText.classList.add("text-blue-800");
              var msgConten;
              if(entity.sender === user_id) {
                  messageElement.classList.add("bg-blue-100", "text-right", "ml-auto"); // 자신의 메시지
                  msgContent = entity.message;

              } else {
                  messageElement.classList.add("bg-gray-100", "text-left"); // 상대방의 메시지
                  msgContent = entity.sender + ": " + entity.message;
              }

             // 메시지 텍스트 설정
              messageText.textContent = msgContent;

              // span 요소를 div 요소의 자식으로 추가
              messageElement.appendChild(messageText);

              // 메시지를 messages 컨테이너에 추가
              var messagesContainer = document.getElementById("messages");
              messagesContainer.appendChild(messageElement);

              // 메시지가 추가될 때마다 스크롤을 아래로 이동시키기 (선택적)
              messagesContainer.scrollTop = messagesContainer.scrollHeight;


            })
        })
    }

})


function sendMessage() {
    var messageContent = document.getElementById('messageContent').value;
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
