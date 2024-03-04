import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'Login/login_main.dart';
import 'Home/home_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: 'b37g6fxls3',
      onAuthFailed: (ex) {
        print("********* 네이버맵 인증오류 : $ex *********");
      });
  KakaoSdk.init(nativeAppKey: 'b248c8d60ac3e422235ae6a0b0440545');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeMain(),
        '/login_main': (context) => LoginMain(),
      },
    );
  }
}
