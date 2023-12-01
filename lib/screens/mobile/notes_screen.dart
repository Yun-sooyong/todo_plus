import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: '할일',
                  height: 50,
                ),
                Tab(
                  text: '하는 중',
                  height: 50,
                ),
                Tab(
                  text: '완료',
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
