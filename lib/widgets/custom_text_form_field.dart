import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  Function(String) validator;
  Function(String) onSaved;
  String hintText;
  int maxLines;
  int maxLength;

  CustomTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.maxLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      child: TextFormField(
        maxLength: maxLength,
        maxLines: maxLines,
        validator: validator,
        onSaved: onSaved,
        cursorColor: AppColors.white,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 17.sp,
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
            color: AppColors.lightGray,
            fontSize: 17.sp,
          ),
          errorStyle: TextStyle(fontSize: 12.sp),
          counterStyle: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
