var currentPage = 1;
var itemPerPage = 18;

//
function update(pageData) {
    var container = document.getElementById('postListContainer');
    removeAllChildNodes(container); // 기존의 게시물 목록을 제거

    pageData.forEach(function(post) {
        var div = document.createElement('div');
        var link = document.createElement('a');
        link.textContent = post.title; // 가정: post 객체에는 title 속성이 있다.
        link.href = `/post/${post.proposal_id}/post_detail_form.html`; // 여기에는 클릭 시 이동할 페이지의 URL을 입력합니다.
        link.addEventListener('click', function(event) {
            // 기본 동작인 링크 이동을 중지시킵니다.
            event.preventDefault();
            // 클릭한 링크의 href 속성 값으로 페이지 이동합니다.
            window.location.href = link.href;
        });
        div.appendChild(link);
        container.appendChild(div);
    });
    displayPagination(jsonPostData.length);
}

function displayPagination(totalItems) {
    var paginationEl = document.getElementById('pagination');
    removeAllChildNodes(paginationEl); // 페이지네이션 컨트롤 초기화

    var totalPages = Math.ceil(totalItems / itemPerPage); // 전체 페이지 수 계산

    for (var i = 1; i <= totalPages; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.textContent = i;
        console.log(currentPage);
        if (i === currentPage) {
            el.style.color = 'green';
            el.classList.add('active'); // 현재 페이지를 시각적으로 표시
        } else {
            el.addEventListener('click', (function(pageNumber) {
                return function(e) {
                    e.preventDefault();
                    currentPage = pageNumber; // 클릭된 페이지 번호로 현재 페이지 업데이트
                    var pageData = jsonPostData.slice((currentPage - 1) * itemPerPage, currentPage * itemPerPage);
                    update(pageData); // 페이지 업데이트 함수 호출
                };
            })(i));
        }
        paginationEl.appendChild(el);
    }
}

function removeAllChildNodes(parent) {
    while (parent.firstChild) {
        parent.removeChild(parent.firstChild);
    }
}

window.onload = function() {
    // 페이지 데이터와 페이지네이션 설정을 위한 초기 호출
    var initialPageData = jsonPostData.slice(0, itemPerPage);
    update(initialPageData); // 초기 페이지 데이터로 UI 업데이트
    displayPagination(jsonPostData.length); // 전체 아이템 수를 기반으로 페이지네이션 설정

};
