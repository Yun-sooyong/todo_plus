part of dialog;

Future showAlertDialog({
  required BuildContext context,
  required String title,
  required String defaultActionText,
  Function()? onPressed,
  Widget? content,
  String? cancelActionText,
}) async {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actions: [
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            onPressed: onPressed,
            child: Text(defaultActionText),
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: [
        if (cancelActionText != null)
          TextButton(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        TextButton(
          onPressed: onPressed,
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}
