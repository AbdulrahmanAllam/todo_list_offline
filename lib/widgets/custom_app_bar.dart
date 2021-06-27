import 'package:flutter/material.dart';
import 'package:todo_list_offline/utils/app_color.dart';

Widget customAppBar({String title = "", List<Widget> action}) {
  return AppBar(
    title: Text(title),
    backgroundColor: AppColors.gray,
    elevation: 0,
    actions: action,
  );
}
