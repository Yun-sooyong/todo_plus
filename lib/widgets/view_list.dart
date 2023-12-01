import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_plus/constants/colors.dart';
import 'package:todo_plus/constants/sizes.dart';
import 'package:todo_plus/utils/dialog.dart';

// class viewList extends StatefulWidget {
//   final Stream stream;
//   final Function() onTap;
//   final Color textColor;
//   Color tileColor;
//   Color selectedTileColor;
//   Widget trailing;

//   viewList({
//     super.key,
//     required this.stream,
//     required this.onTap,
//     required this.textColor,
//     Color? tileColor,
//     Color? selectedTileColor,
//     Widget? trailing,
//   });

//   @override
//   State<viewList> createState() => _viewListState();
// }

// class _viewListState extends State<viewList> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: widget.stream,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           showExceptionDialog(
//               context: context,
//               title: 'Error',
//               exception: snapshot.error.toString());
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         List list = snapshot.data.docs;

//         // long press multi select
//         bool isSelected = false;
//         Map<int, bool> selectedItem = {};

//         return ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot document = list[index];
//             String docId = document.id;

//             selectedItem[index] = selectedItem[index] ?? false;
//             bool? isSelectedData = selectedItem[index];

//             return Padding(
//               padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
//               child: ListTile(
//                 contentPadding: const EdgeInsets.fromLTRB(40, 5, 20, 5),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: Sizes.borderR,
//                 ),
//                 // TODOS Theme 지정 할 것
//                 textColor: widget.textColor,
//                 title: Text(
//                   docId,
//                   style: const TextStyle(
//                     fontSize: Sizes.s16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 tileColor: widget.tileColor,
//                 selectedColor: Colorz.cMainLight,
//                 selectedTileColor: widget.selectedTileColor,
//                 selected: false,
//                 trailing: widget.trailing,
//                 onTap: widget.onTap,
//                 onLongPress: () {},
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

StreamBuilder viewList({
  required Stream stream,
  required Function() onTap,
  required Color textColor,
  Color? tileColor,
  Color? selectedTileColor,
  Widget? trailing,
}) {
  return StreamBuilder(
    stream: stream,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        showExceptionDialog(
            context: context,
            title: 'Error',
            exception: snapshot.error.toString());
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      List list = snapshot.data.docs;

      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          DocumentSnapshot document = list[index];
          String docId = document.id;

          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(40, 5, 20, 5),
              shape: RoundedRectangleBorder(
                borderRadius: Sizes.borderR,
              ),
              // TODOS Theme 지정 할 것
              textColor: textColor,
              title: Text(
                docId,
                style: const TextStyle(
                  fontSize: Sizes.s16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              tileColor: tileColor,
              selectedColor: Colorz.cMainLight,
              selectedTileColor: selectedTileColor,
              selected: false,
              trailing: trailing,
              onTap: onTap,
              onLongPress: () {},
            ),
          );
        },
      );
    },
  );
}
