const script = document.createElement("script");
script.src = "//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing";
document.head.appendChild(script);

var map;
var markers = []; // 마커를 저장할 배열


script.onload = () => {
    kakao.maps.load(() => {
        const node = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(37.50802, 127.062835),
            level: 3
        };
        map = new kakao.maps.Map(node, options); // 지도 생성

//        var listEl = document.getElementById('placesList'),
//            fragment = document.createDocumentFragment(),
//            bounds = new kakao.maps.LatLngBounds();
//
//        removeAllChildNodes(listEl);
//        removeMarker();
//
//        postData.forEach(function(ele) {
//            var markerPosition = new kakao.maps.LatLng(ele.axis_x, ele.axis_y); // 마커 위치 설정
//            var marker = addMarker(markerPosition, ele.proposal_id - 1, ele.title);
//            var itemEl = getListItem(ele.proposal_id, ele); // 수정된 getListItem 함수를 사용
//            bounds.extend(markerPosition);
//            fragment.appendChild(itemEl);
//
//            markers.push(marker); // 마커 배열에 추가
//        });
//
//        listEl.appendChild(fragment);
//        map.setBounds(bounds);
        update(postData);
        //searchPlaces();
        // 지도에 컨트롤 추가
        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    });
};


/// 전역 위치
function searchPlaces()
{
    var keyword = document.getElementById('keyword').value;
    alert(keyword);
    if (!keyword.replace(/^\s+|\s+$/g, ''))
    {
        alert('키워드를 입력해주세요!');
        return false;
    }
    alert("ajax start");
    $.ajax({
        url: '/searchContent',
        type: 'GET',
        //dataType: 'json',
        data: { keyword : keyword },
        success: function(response)
        {
            console.log(response);
            if (response.length != 0)
            {
                update(response);
            }
            else
            {
                alert("검색 결과가 존재하지 않습니다.");
            }
        }
    });
}

function update(searchedDbData)
{
    alert("update function called");
    removeAllChildNodes(document.getElementById('placesList')); // 리스트 초기화
    removeMarker(); // 기존 마커 제거

    var bounds = new kakao.maps.LatLngBounds();
    var fragment = document.createDocumentFragment();

    searchedDbData.forEach(function(data) {
        var markerPosition = new kakao.maps.LatLng(data.axis_x, data.axis_y);
        var marker = addMarker(markerPosition, data.proposal_id - 1, data.title); // 마커 추가
        markers.push(marker); // 마커 배열에 추가

        var itemEl = getListItem(data.proposal_id, data); // 리스트 항목 생성
        fragment.appendChild(itemEl); // DOM에 리스트 항목 추가

        bounds.extend(markerPosition); // 지도 범위 확장
    });

    document.getElementById('placesList').appendChild(fragment);
    map.setBounds(bounds); // 지도 범위 조정
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
function getListItem(index, data)
{
    var el = document.createElement('li'),
        itemStr = `<span class="markerbg marker_${index}"></span>
                    <div class="info">
                        <h5>${data.title}</h5>
                        <span>${data.address}</span>`;

    if (data.content) {
        itemStr += `<span class="tel">${data.content}</span>`;
    }

    itemStr += '</div>';
    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}
