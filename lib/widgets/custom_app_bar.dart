import 'package:flutter/material.dart';
import 'package:todo_list_offline/utils/app_color.dart';

// class CustomAppBar extends StatelessWidget {
//   String title;
//   List<Widget> action;

//   CustomAppBar({this.title, this.action});
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(this.title),
//       backgroundColor: AppColors.gray,
//       elevation: 0,
//       actions: action,
//     );
//   }
// }

Widget customAppBar({String title = "", List<Widget> action}) {
  return AppBar(
    title: Text(title),
    backgroundColor: AppColors.gray,
    elevation: 0,
    actions: action,
  );
}
