/*
  * 로그인 페이지 
  * 로그인 방법은 구글, 게스트 두 가지만 
  * 게스트는 저장소가 디바이스 로컬 저장소, 구글은 firebase를 사용 
  * 한 페이지에서 폰, 패드를 사용해야하기 때문에 반응형으로 제작 할 것 

*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_plus/constants/colors.dart';
import 'package:todo_plus/services/auth_service.dart';
import 'package:todo_plus/widgets/square_tile.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorz.cMain,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AspectRatio(
            // 가로 비율 / 세로 비율
            aspectRatio: 4 / 1,
            child: FlutterLogo(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // * 구글 로그인
              // * todo list를 firebase에 저장
              SquareTile(
                backgound: Colors.white,
                onTap: () {
                  try {
                    AuthService().signInWithGoogle();
                  } catch (e) {
                    print('error');
                  }
                },
                child: const Icon(Icons.abc),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
