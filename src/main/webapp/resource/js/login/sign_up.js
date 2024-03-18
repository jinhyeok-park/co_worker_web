$(document).ready(function()
{
    var isUserIdChecked = false;
    if (isEditMode === true)
    {
        isUserIdChecked = true;
    }

    $('#checkUserIdBtn').click(function(e)
    {

        e.preventDefault(); // 폼 제출 방지
        var userId = $('#user_id').val();
        alert(userId);
        $.ajax
        ({
            url: '/signup/check_user_id.do',
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
        if(!isUserIdChecked)
        {
            e.preventDefault();
            alert("ID 중복 확인이 필요합니다.");
        }
    });
});


function PasswordCheck()
{
    var password1 = document.getElementById("password").value;
    var password2 = document.getElementById("password_check").value;
    if (password1 != password2)
    {
        document.getElementById("passwordCheckFlag").style.display='block';
        return false;
    }
    else
    {
        document.getElementById("passwordCheckFlag").style.display='none';
        return true;
    }
}
//$(document).ready(function() {
//    $('checkUserIdBtn').click(function(e) {
//    e.preventDefault();
//    var useredId = })})