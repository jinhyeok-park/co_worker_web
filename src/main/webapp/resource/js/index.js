const script = document.createElement("script");
script.src = "//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing";
document.head.appendChild(script);

script.onload = () => {
    kakao.maps.load(() => {
        const node = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(37.50802, 127.062835),
            level: 3
        };

        const map = new kakao.maps.Map(node, options); // 지도 생성
        var markers = []; // 마커를 저장할 배열

        var listEl = document.getElementById('placesList'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds();

        removeAllChildNodes(listEl);
        removeMarker();

        postData.forEach(function(ele) {
            var markerPosition = new kakao.maps.LatLng(ele.axis_x, ele.axis_y); // 마커 위치 설정
            var marker = addMarker(markerPosition, ele.proposal_id - 1, ele.title);
            var itemEl = getListItem(ele.proposal_id, ele); // 수정된 getListItem 함수를 사용
            bounds.extend(markerPosition);
            fragment.appendChild(itemEl);

            markers.push(marker); // 마커 배열에 추가
        });

        listEl.appendChild(fragment);
        map.setBounds(bounds);

        // 지도에 컨트롤 추가
        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        function addMarker(position, idx, title) {
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

            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            marker.setMap(map);
            return marker;
        }

        function removeAllChildNodes(el) {
            while (el.hasChildNodes()) {
                el.removeChild(el.lastChild);
            }
        }

        function removeMarker() {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }
            markers = [];
        }

        function getListItem(index, data) {
            var el = document.createElement('li'),
                itemStr = `<span class="markerbg marker_${index}"></span>
                            <div class="info">
                                <h5>${data.title}</h5>
                                <span>${data.address}</span>`;

            if (data.tel) {
                itemStr += `<span class="tel">${data.tel}</span>`;
            }

            itemStr += '</div>';
            el.innerHTML = itemStr;
            el.className = 'item';

            return el;
        }
    });
};
