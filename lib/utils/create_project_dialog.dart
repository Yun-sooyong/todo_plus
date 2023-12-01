part of dialog;

Future<dynamic> addProjectDialog(
    BuildContext context, TextEditingController controller) {
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
