/// * splash 페이지

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
   

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'orientation : ${data.orientation.toString()}',
            ),
            Text(
              'shortiestSide : ${data.size.shortestSide}\nwidth : ${data.size.width}',
            ),
            ElevatedButton(
                onPressed: () async {
              
                },
                child: const Text('회전'))
          ],
        ),
      ),
    );
  }
}
