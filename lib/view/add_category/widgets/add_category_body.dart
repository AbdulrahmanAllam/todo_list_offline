import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view_model/add_category_view_model.dart';
import 'package:todo_list_offline/widgets/custom_button.dart';
import 'package:todo_list_offline/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class AddCategoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddCategoryViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          //1
          Form(
            key: viewModel.formKey,
            child: CustomTextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter your category";
                }
              },
              onSaved: (value) {
                print(value);
                viewModel.categoryName = value;
              },
              hintText: "category",
              maxLines: 1,
              maxLength: 15,
            ),
          ),
          //2
          SizedBox(
            height: 5.h,
            width: double.infinity,
          ),
          //3
          // CustomButton(
          //   name: "color",
          //   onTap: () {
          //     return showDialog(
          //         context: context,
          //         builder: (context) {
          //           return colorDialog(viewModel);
          //         });
          //   },
          // ),

          ColorPicker(
            pickerColor: AppColors.white,
            onColorChanged: (color) {
              viewModel.categoryColor = color.value;
            },
            labelTextStyle: TextStyle(color: AppColors.white),
          ),
          //4
          CustomButton(
            name: "add",
            onTap: () async {
              if (viewModel.formKey.currentState.validate()) {
                viewModel.formKey.currentState.save();
                bool available = await viewModel.addCategory();
                if (available) {
                  Navigator.pop(context, viewModel.categoryName);
                } else {
                  Fluttertoast.showToast(
                    msg: "name or color is already used",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: AppColors.lightGray,
                    textColor: AppColors.white,
                    fontSize: 12.sp,
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  // Widget colorDialog(viewModel) {
  //   return Dialog(
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
  //       child: ColorPicker(
  //         onChanged: (color) {
  //           viewModel.categoryColor = color.value;
  //           print(color.value);
  //         },
  //       ),
  //     ),
  //   );
  // }
}
