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

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };


var axis_x = parseFloat($('#axis_x').val()); // val() 사용 및 숫자로 변환
var axis_y = parseFloat($('#axis_y').val());

if (axis_x != 0 && axis_y != 0)
{
// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);
var geocoder = new kakao.maps.services.Geocoder();

var infowindow = new kakao.maps.InfoWindow({zindex:1});

searchAddrFromCoords(map.getCenter(), displayCenterInfo);



    var markerPosition = new kakao.maps.LatLng(axis_x, axis_y);
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    map.setCenter(markerPosition);

    searchDetailAddrFromCoords(markerPosition, function (result, status) {
         if (status === kakao.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                    detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                    var content = '<div class="bAddr">' +
                                    '<span class="title">법정동 주소정보</span>' +
                                    detailAddr +
                                '</div>';

                    marker.setPosition(markerPosition);
                    marker.setMap(map);
                    infowindow.setContent(content);
                    infowindow.open(map, marker);
         } else {
             // 에러 처리 로직 추가
             console.error("주소를 불러오는데 실패했습니다.");
         }
    });

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
        }
    }
}







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
