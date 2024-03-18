var pro_id = JSON.parse(document.getElementById("pro_id").value);

document.addEventListener('DOMContentLoaded', function () {
    var deleteButton = document.getElementById("postDelete");
    if (deleteButton) {
        deleteButton.addEventListener('click', function () {
            if (confirm("정말로 삭제하시겠습니까?")) {
                $.ajax({
                    url: "/post/" + pro_id + "/delete.do",
                    type: 'DELETE',
                    success: function(res) {
                        if (res == true) {
                            alert("삭제 되었습니다.");
                            window.history.back();
                        } else {
                            alert("삭제 실패");
                        }
                    }
                });
            }
        });
    }
});
$(document).ready(function()
{
    $(".comment_delete").click(function()
    {
        var userId = $(this).data("user-id");
        var comment_id = $(this).data("comment-id");
        $.ajax({
            url:"/comment/delete_comment.do/" + comment_id,
            type: "DELETE",
            success(response)
            {
                if (response === "true")
                {
                    $("#comment-" + userId).remove();
                }
            }
        })
    })
})

$(document).ready(function()
{
    $(".editbutton").click(function() {
        var comment_id = $(this).data("comment-id");
        var originalContent = $("#content-" + comment_id).text();

        // 기존 내용을 입력 필드로 변경
        var inputField = '<input type="text" id="edit-content-' + comment_id  + '" value="' + originalContent + '">';
        $("#content-" + comment_id ).replaceWith(inputField);

        var saveButton = '<button id="save-' + comment_id  + '">저장</button>';
        var cancelButton = '<button id="cancel-' + comment_id  + '">취소</button>';
        $(this).after(cancelButton);
        $(this).after(saveButton);
        $(this).hide(); // 원래 수정 버튼 숨기기

        $("#save-" + comment_id).click(function() {
            var updateContent = $("#edit-content-" + comment_id ).val();
            $.ajax({
                url: '/comment/edit_comment.do',
                type: 'POST',
                data: {
                    updateContent: updateContent,
                    comment_id: comment_id
                },
                success: function(response) {
                    if (response === "true") {
                        var displayContent = '<span id="content-' + comment_id  + '">' + updateContent + '</span>';
                        $("#edit-content-" + comment_id ).replaceWith(displayContent);
                        $("#save-" + comment_id ).remove();
                        $("#cancel-" + comment_id ).remove();
                        $(".editbutton").show();
                    }
                }
            });
        });

        $("#cancel-" + comment_id).click(function() {
            var displayContent = '<span id="content-' + comment_id  + '">' + originalContent + '</span>';
            $("#edit-content-" + comment_id ).replaceWith(displayContent);
            $("#save-" + comment_id ).remove();
            $("#cancel-" + comment_id ).remove();
            $('button.editbutton[data-comment-id="' + comment_id + '"]').show();
        });
    });
})
document.addEventListener('DOMContentLoaded', function () {
    var editButton = document.getElementById("postEdit");
    if (editButton) {
        editButton.addEventListener('click', function () {
             window.location.href = "/post/post_edit_form.html?isEditMode=true&proposal_id=" + pro_id;
        });
    }
});


window.onload = () => {
    // 버튼의 ID 대신 클래스 사용을 고려하세요. 예: class="apply-button"
    $(".apply-button").click(function(e) {
        e.preventDefault();
        $.ajax({
            url: '/post/apply.do',
            type: 'POST',
            data: {proposal_id: this.value}, // this.value를 사용하여 현재 클릭된 버튼의 값을 가져옵니다.
            success: function(response) {
                if (response == "fail") {
                    alert("apply fail");
                } else if(response == "limit_over") {
                    alert("limit_over");
                } else if(response == "already applied") {
                    alert("already applied");
                }
                else if (response == "true")
                {
                    alert("apply success");
                    var currentApplicants = parseInt($('#current-applicants').text());
                    $('#current-applicants').text(currentApplicants + 1);
                }
            } // 이전에 빠진 쉼표를 추가합니다.
        });
    });
};
