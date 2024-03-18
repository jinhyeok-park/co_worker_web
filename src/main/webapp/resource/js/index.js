const script = document.createElement("script");
script.src = "//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing";
document.head.appendChild(script);

var map;
var markers = []; // 마커를 저장할 배열
var currentPage = 1;
var itemPerPage = 15;
var searchedDbData = []; // 검색 결과 데이터 저장용 (검색 결과가 있을 경우 여기에 저장)

script.onload = () => {
    kakao.maps.load(() => {
        const node = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(37.50802, 127.062835),
            level: 3
        };
        map = new kakao.maps.Map(node, options);
        searchedDbData = postData;
        var pageData = postData.slice((currentPage - 1) * itemPerPage, currentPage * itemPerPage);
        update(pageData);
        //searchPlaces();
        // 지도에 컨트롤 추가
        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        displayPagination(searchedDbData.length);
    });
};

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

function update(dbData)
{
    removeAllChildNodes(document.getElementById('placesList')); // 리스트 초기화
    removeMarker(); // 기존 마커 제거

    var bounds = new kakao.maps.LatLngBounds();
    var fragment = document.createDocumentFragment();
    if (dbData)
    {

    dbData.forEach(function(data, index) {

        var markerPosition = new kakao.maps.LatLng(data.axis_x, data.axis_y);
        var marker = addMarker(markerPosition, index + 1, data.title); // 마커 추가
        markers.push(marker); // 마커 배열에 추가
        var infowindow;
        var itemEl = getListItem(index + 1, data); // 리스트 항목 생성
        itemEl.addEventListener('mouseover', function () {
            infowindow = new kakao.maps.InfoWindow({zIndex:1});
            var content =
            infowindow.setContent(data.title);
            infowindow.open(map, marker);
        })
        itemEl.addEventListener('mouseout', function()
        {
            infowindow.close();
        })
        itemEl.addEventListener('click', function()
        {
            var url = "/post/" + data.proposal_id + "/post_detail_form.html";
            window.location.href = url;
        })

        fragment.appendChild(itemEl); // DOM에 리스트 항목 추가

        bounds.extend(markerPosition); // 지도 범위 확장
    });
    }

    document.getElementById('placesList').appendChild(fragment);
    map.setBounds(bounds); // 지도 범위 조정
    displayPagination(searchedDbData.length);
}

// 마커를 추가하는 함수
function addMarker(position, idx, title)
{
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
        imageSize = new kakao.maps.Size(36, 37),
        imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691),
            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
            offset: new kakao.maps.Point(13, 37)
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
            position: position,
            image: markerImage
        });

    var infowindow = new kakao.maps.InfoWindow({
        content: `<div style="padding:5px;">${title}</div>`
    });

    // 마커에 마우스 오버 이벤트 추가
    kakao.maps.event.addListener(marker, 'mouseover', function() {
        infowindow.open(map, marker);
    });
    // 마커에 마우스 아웃 이벤트 추가
    kakao.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
    });

    marker.setMap(map);
    return marker;
}

// DOM 요소의 모든 자식 노드를 제거하는 함수
function removeAllChildNodes(el)
{
    while (el.hasChildNodes()) {
        el.removeChild(el.lastChild);
    }
}

// 모든 마커를 제거하는 함수
function removeMarker()
{
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

// 리스트 아이템을 생성하는 함수
function getListItem(index, data) {
    var el = document.createElement('li'),
        itemStr = `<span class="markerbg marker_${index} w-4 h-4 rounded-full bg-blue-500"></span>
                    <div class="info p-5 rounded-xl shadow-lg bg-gray-50 w-[250px] overflow-auto">
                        <h5 class="text-xl font-bold text-gray-800">${data.title}</h5>
                        <span class="text-sm text-gray-700">${data.address}</span>`;

    if (data.content) {
        itemStr += `<div class="mt-2 text-sm text-gray-600">${data.content}</div>`;
    }

    itemStr += '</div>';
    el.innerHTML = itemStr;
    el.className = 'item flex items-center gap-3 p-3';

    return el;
}

function displayPagination(totalItems) {
    var paginationEl = document.getElementById('pagination');
    removeAllChildNodes(paginationEl); // 페이지네이션 컨트롤 초기화

    var totalPages = Math.ceil(totalItems / itemPerPage); // 전체 페이지 수 계산

    for (var i = 1; i <= totalPages; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.textContent = i;
        if (i === currentPage) {
            el.classList.add('on');
        } else {
            el.addEventListener('click', (function(pageNumber) {
                return function(e) {
                    e.preventDefault();
                    currentPage = pageNumber; // 클릭된 페이지 번호로 현재 페이지 업데이트
                    var pageData = searchedDbData.slice((currentPage - 1) * itemPerPage, currentPage * itemPerPage);
                    update(pageData); // 전역 변수 `searchedDbData`를 사용하여 페이지 업데이트 함수 호출
                }
            })(i));
        }
        paginationEl.appendChild(el);
    }
}

