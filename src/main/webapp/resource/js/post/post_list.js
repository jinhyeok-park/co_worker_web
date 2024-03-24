var currentPage = 1;
var itemPerPage = 15;

var container = $("#postListContainer");

var
    init = function() {
        $('#detailLink').on('click', function (event) {
            // 기본 동작인 링크 이동을 중지시킵니다.
            event.preventDefault();
            // 클릭한 링크의 href 속성 값으로 페이지 이동합니다.
            window.location.href = event.target.href;
        })
    },

    update = function (pageData) {
        container.children().remove(); // 기존의 게시물 목록을 제거

        pageData.forEach(function(post) {

            var containerSubDiv = $('<div>').prop({
                                        className: 'pointer-events-auto w-[21rem] rounded-lg bg-white p-4 text-[0.8125rem] leading-5 shadow-xl shadow-black/5 hover:bg-slate-50 ring-1 ring-slate-700/10'
                                    }),

                titleDiv = $('<div>').prop({
                                className: 'flex justify-between'
                            }).append(
                                $('<a>').prop({
                                    id: 'detailLink',
                                    href: '/post/'+ post.proposal_id +'/post_detail_form.html',
                                    className: 'text-lg text-blue-500 hover:text-blue-700 font-semibold truncate',
                                    innerHTML: post.title
                                })
                            ),

                contentDiv = $('<div>').prop({
                                    className: 'post-content text-base font-medium text-slate-900 dark:text-slate-200',
                                    innerHTML: post.content
                            }),
                addressDiv = $('<div>').prop({
                    className: 'text-sm font-medium text-gray-600 text-slate-900 dark:text-slate-200 truncate',
                    innerHTML: post.address == '' ? 'Online Community' : post.address
                }).css({
                    "margin-top": "5px",
                    "font-size": "12px"
                });

            containerSubDiv.append(titleDiv);
            containerSubDiv.append('<div>').append('<hr>');
            containerSubDiv.append(contentDiv);
            containerSubDiv.append(addressDiv);

            container.append(containerSubDiv);

        });

        displayPagination(jsonPostData.length);

    };

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
            el.style.color = '#0ea5e9';
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

    init();
};

function logout() {
    var f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/login/logout.do');
    document.body.appendChild(f);
    f.submit();
}

function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
    if(!container.hasClass('active')){
        container.addClass('active');
        evt.preventDefault();
    }
    else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
        container.removeClass('active');
        // clear input
        container.find('.search-input').val('');
    }
}

function searchPlaces()
{
    var keyword = document.getElementById('keyword').value;
    if (!keyword.replace(/^\s+|\s+$/g, ''))
    {
        alert('키워드를 입력해주세요!');
        return false;
    }
    $.ajax({
        url: '/post/search_content.do',
        type: 'GET',
        //dataType: 'json',
        data: { keyword : keyword },
        success: function(response)
        {
            if (response.length != 0)
            {
                searchedDbData = response; // 전역 변수에 검색 결과 저장
                update(response);
            }
            else
            {
                alert("검색 결과가 존재하지 않습니다.");
            }
        }
    });
}
