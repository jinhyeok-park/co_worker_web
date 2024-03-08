
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
    alert("hit new chatting blank");
    e.preventDefault();

    var form = e.target;
    var action = form.action;

    // 'hegith'를 'height'로 수정
    var windowFeatures = 'width=400,height=650,left=100,top=100,scrollbars=no';
    window.open(action, 'ChatWindow', windowFeatures);
}
