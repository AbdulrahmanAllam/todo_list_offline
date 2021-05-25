import 'package:flutter/material.dart';
import 'package:todo_list_offline/utils/app_color.dart';

class CustomFloatingActionButton extends StatelessWidget {
  Function onPressed;
  CustomFloatingActionButton({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.white,
      child: Icon(
        Icons.add,
        color: AppColors.gray,
      ),
    );
  }
}
