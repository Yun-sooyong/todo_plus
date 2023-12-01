import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_plus/constants/colors.dart';
import 'package:todo_plus/screens/mobile/notes_screen.dart';
import 'package:todo_plus/services/auth_service.dart';
import 'package:todo_plus/services/data_service.dart';
import 'package:todo_plus/utils/dialog.dart';
import 'package:todo_plus/widgets/view_list.dart';

class ViewProjectsScreen extends StatefulWidget {
  const ViewProjectsScreen({super.key});

  @override
  State<ViewProjectsScreen> createState() => _ViewProjectsScreenState();
}

class _ViewProjectsScreenState extends State<ViewProjectsScreen> {
  // firebase data service
  //final DataService dataService = DataService();

  // text controller
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colorz.cMain,

      // AppBar
      appBar: AppBar(
        title: const Text('내 프로젝트'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            //onPressed: () => addProjectDialog(context),
            onPressed: () => showAlertDialog(
              context: context,
              title: '프로젝트 생성',
              defaultActionText: '저장',
              cancelActionText: '취소',
              content: TextField(
                controller: controller,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: viewList(
          stream: DataService.getProject(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotesScreen(),
              ),
            );
          },
          textColor: Colorz.cMainLight,
          selectedTileColor: Colorz.selectedItem,
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical_circle,
              color: Colorz.cMainLight,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addProjectDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '프로젝트 이름을 입력해주세요',
            style: TextStyle(
              color: Colorz.cMain,
            ),
          ),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '취소',
                style: TextStyle(
                  color: Colorz.cMain,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // add new project
                DataService.createProject(projectTitle: controller.text);

                // clear controller
                controller.clear();

                // close dialog
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colorz.cMain,
              ),
              child: const Text(
                '저장',
                style: TextStyle(
                  color: Colorz.cMainLight,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    super.key,
    required this.projectName,
  });

  final String projectName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textColor: Colorz.cMain,
      tileColor: Colorz.cMainLight,
      title: Text(
        projectName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        BootstrapIcons.chevron_right,
        color: Colorz.cMain,
        opticalSize: 10,
      ),
      // 프로젝트 상세 페이지로 이동
      //onTap: () => Navigator.push(context, DetailScreen()),
      // 길게 눌러 수정, 삭제, 다중선택
      onLongPress: () {},
    );
  }
}
