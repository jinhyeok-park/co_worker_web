document.getElementById("editUserInfo").addEventListener("click", function() {
    window.location.href = "/mypage/user_edit.html?isEditMode=true";
});
var isShown = false;

$(document).ready(function()
{
    $(".exitButton").click(function ()
    {
        var user_id = $(this).data("user-id");
        var proposal_id = $(this).data("proposal-id");

        $.ajax({
            url:"/chat_exit.do",
            type:'DELETE',
            data:{
                user_id : user_id,
                proposal_id : proposal_id
            },
            success(response)
            {
                if (response)
                {
                    $("#postContainer" + proposal_id).remove();
                }               // 게시글 안보이도록 없애기
            }
        })
    })
    //맴버  리스트를 전달 받아서 ,  클릭 이벤트들을 등록 하여야함
$('.showMembersBtn').click(function() {
    var proposal_id = $(this).data('proposal-id');
    var memberListSelector = '.memberList-' + proposal_id;

    if (!isShown) {
        $.ajax({
            url:'/mypage/get_member.do',
            type:'GET',
            data: {proposal_id: proposal_id},
            success: function(members) {
                // 이제 members는 서버로부터 받은 멤버 목록이 됩니다.
                // 응답 데이터의 유효성 검증 후 처리
                if (members && members.length > 0) {
                    isShown = true;
                    $(memberListSelector).empty().data('proposal-id', proposal_id);
                    $.each(members, function(index, member) {
                        // 예를 들어, 서버에서 member 객체에 id와 name 필드가 있다고 가정
                        var memberId = proposal_id + "-" + member;
                        $(memberListSelector).append('<li data-member-id="' + memberId + '">' + member + '<button class="userKick" data-member-id="' + member + '">강퇴하기</button></li>');
                    });
                }
            }
        });
    } else {
        isShown = false;
        $(memberListSelector).empty();
    }
});


$(document).on('click', '.userKick', function() {
    var userConfirm = confirm("강퇴 하시겠습니까?");
    if (userConfirm) {
        var memberId = $(this).data('member-id');
        // 여기서 closest()를 사용해 가장 가까운 ul 요소에서 proposal_id를 찾습니다.
        var proposalId = $(this).closest('ul').data('proposal-id');

        // 멤버 식별자를 사용하여 li 제거
        $('li[data-member-id="'+ proposalId + "-" + memberId + '"]').remove();

        // AJAX 요청으로 서버에 멤버 강퇴 처리, proposal_id도 함께 전달
        $.ajax({
            url: "/mypage/userkick.do",
            method: "POST",
            data: {
                user_id: memberId,
                proposal_id : proposalId // proposal_id도 함께 서버에 전달
            },
            success: function(response) {
                alert("강퇴 처리되었습니다.");
            },
            error: function() {
                alert("오류 발생");
            }
        });
    }
});


})

document.addEventListener("DOMContentLoaded", function()
{
    var forms = document.querySelectorAll(".chatForm");
    if (forms)
    {
        forms.forEach(function(form)
        {
            form.addEventListener("submit", openChatWindow);
        })
    }
})

function openChatWindow(e)
{
    e.preventDefault();

    var form = e.target;
    var action = form.action;

    // 'hegith'를 'height'로 수정
    var windowFeatures = 'width=400,height=650,left=100,top=100,scrollbars=no';
    window.open(action, 'ChatWindow', windowFeatures);
}

$(document).ready(function() {
    // 각 TeamPage 버튼을 찾아서 클릭 이벤트를 추가합니다.
    $('[class^="teamPageButton-"]').click(function() {
        // 클래스 이름에서 proposal_id를 가져옵니다.
        var proposalId = $(this).attr('class').split('teamPageButton-')[1].split(' ')[0];
        // 새로운 URL을 생성합니다.
        var newUrl = "/teampage/" + proposalId + "/teampage.html";
        // 새로운 페이지를 새 탭에서 엽니다.
        window.open(newUrl, '_blank');
    });

    $('.CreateTeamPageButton').click(function ()
    {
        var proposal_id = $(this).data("proposal-id");

                        alert("TeamPage를 생성합니다.");
                        $.ajax(
                        {
                            url:"/post/create_teampage.do",
                            data : {proposal_id : proposal_id},
                            type : 'POST',
                            success: function(response)
                            {
                                if (response == "true")
                                {
                                    alert("생성 완료");
                                    window.location.reload();
                                }
                            }
                        })
    })

                $(".DeleteTeamPageButton").click(function ()
                            {
                                var proposal_id = $(this).data("proposal-id");
                                var userConfirm = confirm("TeamPage를 삭제하시겠습니까? 모든 내용이 초기화 됩니다.")
                                if (userConfirm)
                                {
                                $.ajax(
                                                            {
                                                                url:"/post/delete_teampage.do",
                                                                data : {proposal_id : proposal_id},
                                                                type : 'POST',
                                                                success: function(response)
                                                                {
                                                                    if (response == "true")
                                                                    {
                                                                        alert("삭제 완료");
                                                                        window.location.reload();
                                                                    }
                                                                }
                                                            })
                                }
                            });


});



$(document).ready(function ()
{
    $(".chatRoomStartQuestion").click(function ()
    {
        var proposal_id = $(this).data("proposal-id");


        alert("member들을 채팅방으로 불러모읍니다");
        $.ajax(
        {
            url:"/post/create_chat.do",
            data : {proposal_id : proposal_id},
            type : 'POST',
            success: function(response)
            {
                if (response == "true")
                {
                    alert("생성 완료");
                    window.location.reload();
                }
            }
        })
    });

     $(".chatRoomDeleteQuestion").click(function ()
        {
            var proposal_id = $(this).data("proposal-id");

            var userConfirmation = confirm("채팅 내용이 모두 초기화 됩니다. 정말로 삭제하시겠습니까 ?");
            if (userConfirmation)
            {
                $.ajax(
                        {
                            url:"/post/delete_chat.do",
                            data : {proposal_id : proposal_id},
                            type : 'POST',
                            success: function(response)
                            {
                                if (response == "true")
                                {
                                    alert("삭제 완료");
                                    window.location.reload();
                                }
                            }
                        })
            }
        });
})
