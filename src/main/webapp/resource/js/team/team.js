//$(document).ready(function() {
//    // Function to save title and content to localStorage
//    function saveContent() {
//        localStorage.setItem('title', $('#titleInput').val());
//        localStorage.setItem('content', $('#markdownInput').val());
//    }
//
//    // Event listeners to save content as the user types
//    $('#titleInput').on('input', saveContent);
//    $('#markdownInput').on('input', saveContent);
//
//    // Load saved content on page load
//    const savedTitle = localStorage.getItem('title');
//    const savedContent = localStorage.getItem('content');
//
//    if(savedTitle) {
//        $('#titleInput').val(savedTitle);
//    }
//
//    if(savedContent) {
//        $('#markdownInput').val(savedContent);
//    }
//});
var isConnected = false; // 연결 상태를 추적하는 전역 변수
var stompClient;
$(document).ready(function() {
    $('#markdownInput').on('input', function() {
        const markdownText = $(this).val();
        $('#markdownPreview').html(marked.parse(markdownText));
    });
});


$(document).ready(function() {
    // Function to save title and content to localStorage
    function saveContent() {
        localStorage.setItem('title', $('#titleInput').val());
        localStorage.setItem('content', $('#markdownInput').val());
    }

//    $('#titleInput').on('input', saveContent);
//    $('#markdownInput').on('input', saveContent);

//    $('#titleInput').on('input', sendMessage);
//    $('#markdownInput').on('input', sendMessage);
    // send 함수를 call 해서 subscribe 하는 곳에 모든 message를 전달한다.

        // Load saved content on page load
        const savedTitle = localStorage.getItem('title');
        const savedContent = localStorage.getItem('content');

        if(savedTitle) {
            $('#titleInput').val(savedTitle);
        }

        if(savedContent) {
            $('#markdownInput').val(savedContent);
        }

    let isPreviewFull = false; // 전체보기 상태를 추적하는 플래그

    $('#togglePreview').click(function() {
        if (!isPreviewFull) {
            // 전체보기 상태로 전환
            $('#titleInput').hide();
            $('#markdownInput').hide(); // 입력 창 숨기기
            $('#markdownPreview').css('width', '100%'); // 미리보기 너비 100%로 설정
            $(this).text('되돌아가기'); // 버튼 텍스트 변경
        } else {
            // 원래 레이아웃으로 복귀
            $('#titleInput').show(); // 오타 수정: 'titleInput'이 아니라 '#titleInput'으로 변경
            $('#markdownInput').show(); // 입력 창 다시 보이기
            $('#markdownPreview').css('width', ''); // 미리보기 너비 원래대로
            $(this).text('전체보기'); // 버튼 텍스트 원래대로
        }
        isPreviewFull = !isPreviewFull; // 플래그 상태 반전
    });
});

//$(document).ready(function() {
//
//    // 일정 시간 후 자동 저장 설정 (예: 5분)
//    var autoSaveTimer = setTimeout(saveContentToServer, 300000); // 300000ms = 5분
//
//    // 페이지를 떠날 때 내용 저장
//
//
//    // 내용을 서버로 저장하는 함수
//
//
//    // 사용자가 입력을 시작하면 자동 저장 타이머를 재설정
//    $('#titleInput, #markdownInput').on('input', function() {
//        clearTimeout(autoSaveTimer); // 이전 타이머 취소
//        autoSaveTimer = setTimeout(saveContentToServer, 300000); // 다시 5분 후 저장 설정
//    });
//});

$(document).ready(function() {

    $("#documentList").on('click', '.document-item', function () {
        // 현재 클릭된 항목의 data 속성 값 가져오기
        saveContentToServer();

        window.currentTeamPostId = $(this).data('team-post'); // 현재 선택된 teamPostId를 전역 변수에 저장합니다.
        window.currentProposalId = $(this).data('proposal-id');
         $.ajax(
         {
            url:   "/teampage/"+ window.currentProposalId +"/"+ window.currentTeamPostId + "/" + "getPageContents.do",
            type: 'GET',
            success: function(response)
            {
                window.currentTitle = response.title; // 예상되는 응답 형태에 따라 수정 필요
                window.currentContent = response.contents; // 예상되는 응답 형태에 따라 수정 필요
                // 페이지의 입력 필드에 데이터 설정
                $('#titleInput').val(window.currentTitle);
                $('#markdownInput').val(window.currentContent);
            }
         })
//        window.currentTeamPostId = $(this).data('team-post'); // 현재 선택된 teamPostId를 전역 변수에 저장합니다.
//        window.currentTitle = $(this).data('title');
//        window.currentContent = $(this).data('content');
//        window.currentProposalId = $(this).data('proposal-id');

        // 제목과 내용을 입력 필드에 설정
        $('#titleInput').val(window.currentTitle);
        $('#markdownInput').val(window.currentContent);
        // 선택된 문서의 ID를 'teamPost' 요소의 data-team-post 속성에 설정
        $('#teamPost').data('team-post', window.currentTeamPostId).attr('data-team-post', window.currentTeamPostId); // jQuery data() 함수로 데이터 설정과 동시에 attr()로 속성 업데이트
        // 추가적인 처리가 필요한 경우 여기에 작성
        // 예를 들어, 선택된 문서의 ID를 서버로 전송하는 AJAX 요청 등
        if (stompClient && stompClient.connected) {
            stompClient.disconnect(function() {
                console.log('Disconnected from previous connection');
                connect();
            });
        } else {
            connect();
        }
    });

    $('.document-item').first().click(); // 첫 번째 document-item의 클릭 이벤트를 트리거합니다.
    connect();
    $('#markdownInput').trigger('input');

    $('#titleInput').on('input', debounce(sendMessage, 500));
    $('#markdownInput').on('input', debounce(sendMessage, 500) );

    $("#addDocument").on('click', function () {
        var postData = $("#post").data("post");
        $.ajax({
            url: "/teampage/" + window.currentProposalId + "/teampage_insert.do",
            type: 'POST',
            success: function(response) {
                var documentList = $("#documentList");

                // 새로운 버튼 요소를 생성
                // var newButton = $("<button></button>", {
                //     "class": "document-item py-2 px-4 bg-blue-500 text-white rounded shadow",
                //     "data-team-post": response.teamPost_id,
                //     "data-title": response.title,
                //     "data-content": response.contents,
                //     "data-proposal-id": response.proposal_id,
                //     text: response.title // 버튼의 표시될 텍스트
                // });
                //
                // // 생성된 버튼을 documentList에 추가
                // documentList.append(newButton);
                var chatMessage = {
                    user_id : "test",
                    title: response.title,
                    contents: response.contents,
                    proposal_id: response.proposal_id,
                    teamPost_id: response.teamPost_id
                    // 여기에 필요한 다른 필드 추가
                };
                stompClient.send(`/room/teamnavi/` + window.currentProposalId + "/" + window.currentTeamPostId , {}, JSON.stringify(chatMessage));

            },
            error: function(xhr, status, error) {
                // AJAX 요청 실패 시 처리할 코드
                console.error("AJAX request failed: " + status + ", " + error);
            }
        });
    });
 var autoSaveTimer = setInterval(saveContentToServer, 3000); // 1000ms = 1초
$("#saveButton").on('click', saveContentToServer);
$("#deleteButton").on('click', deleteContentInServer);
});

function deleteContentInServer()
{
    var proposalId = window.currentProposalId;
    var teamPostId = window.currentTeamPostId;
    var confirmDelete;

    confirmDelete = confirm("정말로 삭제하시겠습니까?");

    if (confirmDelete)
    {
        $.ajax({
                url: "/teampage/delete_teampage.do",
                type:'DELETE',
                data: {
                    proposal_id: proposalId,
                    teampost_id: teamPostId
                },
                success: function(response)
                {
                    var entity = JSON.parse(response);
                    if (entity === true)
                    {
                        alert("delete done");
                        window.location.reload();
                    }
                }
        })
    }



}


function saveContentToServer() {

        var title = $('#titleInput').val();
        var contents = $('#markdownInput').val();
        if (!window.currentProposalId)
        {
            return;
        }
        // AJAX 요청으로 서버에 데이터
        $.ajax({
            url: '/teampage/saveTeamPost.do', // 서버의 데이터 저장을 처리하는 URL
            type: 'POST',
            data: {
                title: title,
                contents: contents,
                proposal_id: window.currentProposalId,
                teamPost_id: window.currentTeamPostId
            },
            success: function(response) {
                // 성공적으로 저장됐을 때 실행할 코드
                console.log('Content saved successfully!');
            },
            error: function(xhr, status, error) {
                // 저장 실패시 실행할 코드
                console.log('Error saving content:', error);
            }
        });
}

function connect() {
        var socket = new SockJS("/wd-stomp"); // listen to what address?
        stompClient = Stomp.over(socket);
    stompClient.connect({}, function() {
        isConnected = true;
        // stompClient.subscribe('/room/team' + postData.proposal_id + teamPostData, function (message)
        // stompClient.subscribe('/room/team/${postData}/${window.currentTeamPostId}', function (message)
        stompClient.subscribe('/room/team/' + window.currentProposalId + "/" + window.currentTeamPostId, function(message) {
            var entity = JSON.parse(message.body);
            $('#titleInput').val(entity.title);
            $('#markdownPreview').html(marked.parse(entity.contents)); // convert to markdown and apply to preview
            $("#markdownInput").val(entity.contents); // set textarea value using 'contents' property of entity
        });
        stompClient.subscribe('/room/teamnavi/' + window.currentProposalId + "/" + window.currentTeamPostId, function(message) {
            var response = JSON.parse(message.body);

            var newButton = $("<button></button>", {
                "class": "document-item py-2 px-4 bg-blue-500 text-white rounded shadow",
                "id": "team-post-" + response.teamPost_id,
                "data-team-post": response.teamPost_id,
                "data-title": response.title,
                "data-content": response.contents,
                "data-proposal-id": response.proposal_id,
                text: response.title // text to be displayed on the button
            });

            // append the newly created button to the document list
            $("#documentList").append(newButton);
        });
    });
}



function sendMessage() {

    if (!isConnected) {
    alert("guard kick");
                return ;
    }

    // 메시지 내용과 기타 필요한 데이터 준비
    var title = $("#titleInput").val(); // 혹은 다른 입력 값
    var contents = $("#markdownInput").val(); // textarea에서 사용자가 입력한 값
      $(`#team-post-${window.currentTeamPostId}`).text(title);

    //var userId = $("#user-id").data("user-id");
    if(contents && stompClient) {
        var chatMessage = {
            user_id : "test",
            title: title,
            contents: contents,
            proposal_id: window.currentProposalId,
            teamPost_id: window.currentTeamPostId
            // 여기에 필요한 다른 필드 추가
        };
        // 주소와 데이터 형식 수정
        stompClient.send(`/room/team/` + window.currentProposalId + "/" + window.currentTeamPostId , {}, JSON.stringify(chatMessage));
    }
}

function debounce(func, delay) {
  let inDebounce;
  return function() {
    const context = this;
    const args = arguments;
    clearTimeout(inDebounce);
    inDebounce = setTimeout(() => func.apply(context, args), delay);
  };
}