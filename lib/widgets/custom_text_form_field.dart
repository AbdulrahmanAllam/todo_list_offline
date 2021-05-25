import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  Function(String) validator;
  Function(String) onChanged;
  String hintText;

  CustomTextFormField({
    @required this.validator,
    @required this.onChanged,
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.gray,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.white,
          )),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.red,
          )),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.white,
          )),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
