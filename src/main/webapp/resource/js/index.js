const script = document.createElement("script");
script.src = "//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing";
document.head.appendChild(script);
script.onload = () => {
kakao.maps.load(() => {
    const node = document.getElementById('map');
    const center = new kakao.maps.LatLng(37.50802, 127.062835);
    const options =
    {
        center,
        level: 3
    };

  const map = new kakao.maps.Map(node, options); // 지도 생성
  var markers = []; // 마커를 저장할 배열

  postData.forEach(function (ele) {
      var markerPosition = new kakao.maps.LatLng(ele.axis_x, ele.axis_y); // 마커 위치 설정
      var marker = new kakao.maps.Marker({ position: markerPosition }); // 마커 생성
      marker.setMap(map); // 마커를 지도에 표시
      markers.push(marker); // 마커 배열에 추가

      var infowindow = new kakao.maps.InfoWindow({
          content: `<div style="padding:5px;">${ele.title}</div>`, // 인포윈도우에 표시될 내용
          removable: true // 인포윈도우를 닫을 수 있는 x버튼 표시 여부
      });
      infowindow.open(map, marker); // 인포윈도우 표시

      // 마커에 클릭 이벤트를 등록합니다.
      kakao.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker); // 마커 클릭 시 인포윈도우를 표시합니다.
      });
  });

  // 지도에 컨트롤 추가
  var mapTypeControl = new kakao.maps.MapTypeControl();
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 지도 타입 변경 컨트롤을 지도에 추가

  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 줌 컨트롤을 지도에 추가


    });
};
