import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ProjectListScreen extends StatefulWidget {
  final bool isPhone;
  const ProjectListScreen({super.key, required this.isPhone});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: PullDownButton(
        itemBuilder: (context) => [
          PullDownMenuItem(
            onTap: () {},
            title: 'Pin',
            icon: CupertinoIcons.pin,
          ),
          PullDownMenuItem(
            title: 'Forward',
            subtitle: 'Share in different channel',
            onTap: () {},
            icon: CupertinoIcons.arrowshape_turn_up_right,
          ),
          PullDownMenuItem(
            onTap: () {},
            title: 'Delete',
            isDestructive: true,
            icon: CupertinoIcons.delete,
          ),
        ],
        buttonBuilder: (context, showMenu) => CupertinoButton(
          onPressed: showMenu,
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.ellipsis_circle),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AdaptiveTheme.of(context).setLight();
            },
            icon: const Icon(
              Icons.light_mode,
            ),
          ),
          IconButton(
            onPressed: () {
              AdaptiveTheme.of(context).setDark();
            },
            icon: const Icon(
              Icons.dark_mode,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
