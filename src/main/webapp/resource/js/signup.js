$(document).ready(function()
{
    var isUserIdChecked = false;

    $('#checkUserIdBtn').click(function(e)
    {

        alert("hit button click");
        e.preventDefault(); // 폼 제출 방지
        var userId = $('#user_id').val();
        alert(userId);
        $.ajax
        ({
            url: 'checkUserIdServlet',
            type: 'POST',
            data: { user_Id: userId },
            success: function(response)
            {
                if(response === 'EXISTS')
                {
                    $('#userIdResult').text('이미 존재하는 아이디입니다.');
                    $('#userIdResult').css('color', 'red');
                    alert("사용 불가능한 ID입니다.")
                }
                else
                {

                    $('#userIdResult').text('사용 가능한 아이디입니다.');
                    $('#userIdResult').css('color', 'green');
                    alert("사용 가능한 ID입니다.");
                    isUserIdChecked = true;
                }
            }
        });
    });
    $('form').submit(function(e)
    {
        alert("hit submit");
        if(!isUserIdChecked)
        {
            e.preventDefault();
            alert("ID 중복 확인이 필요합니다.");
        }
    });
});

//$(document).ready(function() {
//    $('checkUserIdBtn').click(function(e) {
//    e.preventDefault();
//    var useredId = })})