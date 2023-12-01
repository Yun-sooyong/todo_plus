part of dialog;

Future createAlertDialog({
  required BuildContext context,
}) async {
  late String title;
  late int index;

  // Android
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('노트 작성'),
        content: Container(
          child: Column(
            children: [],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('취소'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('저장'),
            onPressed: () {
              //DataService.addNote(title: title, description: , index: )
            },
          ),
        ],
      ),
    );
  }
  // IOS
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(),
  );
}
