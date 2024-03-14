document.getElementById("editUserInfo").addEventListener("click", function() {
    window.location.href = "/signup?isEditMode=true";
});

$(document).ready(function()
{
    $(".exitButton").click(function ()
    {
        var user_id = $(this).data("user-id");
        var proposal_id = $(this).data("proposal-id");

        $.ajax({
            url:"/exitButton",
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
