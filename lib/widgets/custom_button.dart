import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  Function onTap;
  String name;

  CustomButton({this.onTap, @required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(vertical: 0.7.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.h),
          border: Border.all(color: AppColors.white, width: 1.w),
        ),
        child: Center(
            child: Text(
          this.name,
          style: TextStyle(color: AppColors.white, fontSize: 30.sp),
        )),
      ),
    );
  }
}
