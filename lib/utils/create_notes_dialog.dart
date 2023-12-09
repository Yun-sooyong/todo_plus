part of dialog;

Future createAlertDialog(
    {required BuildContext context,
    required TextEditingController titleCon,
    required TextEditingController desCon,
    required String proejctTitle}) async {
  int index = 0;

  /// TODO widget 폴더에 dialog form 파일을 만들어서
  ///

  // Android
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: const Text('노트 작성'),
        backgroundColor: Colorz.cMainLight,
        iconColor: Colorz.cMain,
        titleTextStyle: const TextStyle(color: Colorz.cMain),
        contentTextStyle: const TextStyle(color: Colorz.cMain),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCon,
            ),
            TextField(
              controller: desCon,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('취소'),
            onPressed: () {
              titleCon.clear();
              desCon.clear();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('저장'),
            onPressed: () {
              DataService.addNote(
                title: titleCon.text,
                project: proejctTitle,
                description: desCon.text,
                index: index,
              );
              titleCon.clear();
              desCon.clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
  // IOS
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text('노트 작성'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoTextField(
            controller: titleCon,
            placeholder: '할일',
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colorz.cMain,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            controller: desCon,
            placeholder: '내용',
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colorz.cMain,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('취소'),
          onPressed: () {
            titleCon.clear();
            desCon.clear();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('저장'),
          onPressed: () {
            DataService.addNote(
              title: titleCon.text,
              project: proejctTitle,
              description: desCon.text,
              index: index,
            );
            titleCon.clear();
            desCon.clear();
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
