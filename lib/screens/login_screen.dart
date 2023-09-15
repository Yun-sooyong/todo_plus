/*
  * 로그인 페이지 
  * 로그인 방법은 구글, 게스트 두 가지만 
  * 게스트는 저장소가 디바이스 로컬 저장소, 구글은 firebase를 사용 
  * 한 페이지에서 폰, 패드를 사용해야하기 때문에 반응형으로 제작 할 것 
*/

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}