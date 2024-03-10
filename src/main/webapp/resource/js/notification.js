var stompClient = null;
var roomIds = document.getElementById("roomIds").getAttribute("data-roomids");
if (roomIds)
    roomIds = JSON.parse(roomIds);

window.addEventListener("DOMContentLoaded", function () {
    var socket = new SockJS("/wd-stomp"); // 서버의 실제 SockJS 엔드포인트로 변경해야 합니다.
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function () {
        // 연결 성공 시 로그를 출력할 수 있습니다.
        stompClient.subscribe('/room/common', function (message) {
            var messageData = JSON.parse(message.body);
            if (roomIds === null) {
                console.log("hit null ids");
                return;
            }
            console.log("hit normal ids");
            console.log(roomIds);
            if (roomIds.includes(messageData.room_id)) {
                ShowNotification("새로운 메시지 도착");
            }
        });
    });
});


function ShowNotification(message) {
    var notification = document.getElementById('notification');
    if (!notification) {
        notification = document.createElement('div');
        notification.id = 'notification';
        notification.className = 'fixed top-5 right-5 bg-green-500 text-white px-4 py-2 rounded shadow-lg transform scale-0 transition-transform duration-300';
        document.body.appendChild(notification);
    }
    notification.textContent = message;
    notification.classList.remove('scale-0');
    notification.classList.add('scale-100');

    setTimeout(() => {
        notification.classList.remove('scale-100');
        notification.classList.add('scale-0');
    }, 3000); // 3초 후 알림 사라짐
}
