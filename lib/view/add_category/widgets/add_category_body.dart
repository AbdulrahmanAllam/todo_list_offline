import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:provider/provider.dart';
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
          Form(
            key: viewModel.formKey,
            child: CustomTextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter your category";
                }
              },
              onChanged: (value) {
                viewModel.categoryName = value;
              },
              hintText: "category",
            ),
          ),
          SizedBox(
            height: 5.h,
            width: double.infinity,
          ),
          CustomButton(
            name: "color",
            onTap: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return colorDialog(viewModel);
                  });
            },
          ),
          CustomButton(
            name: "add category",
            onTap: () async {
              if (viewModel.formKey.currentState.validate()) {
                await viewModel.addCategory();
                Navigator.pop(context, viewModel.categoryName);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget colorDialog(viewModel) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        child: ColorPicker(
          onChanged: (color) {
            viewModel.categoryColor = color.toString();
          },
        ),
      ),
    );
  }
}
