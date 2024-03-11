var pro_id = JSON.parse(document.getElementById("pro_id").value);

document.getElementById("postDelete").addEventListener('click', function () {
    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            url: "/post/" + pro_id + "/delete",
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


window.onload = () => {
    // 버튼의 ID 대신 클래스 사용을 고려하세요. 예: class="apply-button"
    $(".apply-button").click(function(e) {
        e.preventDefault();
        $.ajax({
            url: '/applyRestController',
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
