import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class SearchMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchMain'),
      ),

      body: NaverMap(
        options: const NaverMapViewOptions(
          mapType: NMapType.navi,
          nightModeEnable: true, //야간모드 on off
          initialCameraPosition: NCameraPosition(
              //로딩시 첫 카메라 위치
              target: NLatLng(35.116637, 128.9684964),
              zoom: 15,
              bearing: 0,
              tilt: 0),
        ), // 지도 옵션을 설정할 수 있습니다.

        forceGesture: false, // 지도에 전달되는 제스처 이벤트의 우선순위를 가장 높게 설정할지 여부를 지정합니다.

        onMapReady: (controller) {
          final marker = NMarker(
              id: 'test',
              position: const NLatLng(35.116637, 128.9684964)); //마커 추가
          final marker1 = NMarker(
              id: 'test1',
              position: const NLatLng(35.10339591777645, 128.97306756123058));
          controller.addOverlayAll({marker, marker1});

          final hyeongjun =
              NInfoWindow.onMarker(id: marker.info.id, text: "형준이가 혼자 밥 먹는 곳");
          marker.openInfoWindow(hyeongjun);
        },
        onMapTapped: (point, latLng) {},
        onSymbolTapped: (symbol) {},
        onCameraChange: (position, reason) {},
        onCameraIdle: () {},
        onSelectedIndoorChanged: (indoor) {},
      ),

      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
