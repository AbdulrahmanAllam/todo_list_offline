import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/services/const_names.dart';
import 'package:todo_list_offline/view_model/add_task_view_model.dart';
import 'package:todo_list_offline/widgets/custom_button.dart';
import 'package:todo_list_offline/widgets/custom_text_form_field.dart';

class AddTaskBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddTaskViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1
          SizedBox(width: double.infinity),
          //2
          Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "I want to...",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter your task";
                    }
                  },
                  onSaved: (value) {
                    viewModel.taskName = value;
                  },
                  maxLength: 20,
                ),
                CustomTextFormField(
                  hintText: "Description",
                  onSaved: (description) {
                    viewModel.taskDescription = description;
                  },
                  maxLines: 5,
                ),
              ],
            ),
          ),
          //3
          dropdownCategoriesButton(viewModel),
          //4
          CustomButton(
            name: "add",
            onTap: () async {
              if (viewModel.formKey.currentState.validate()) {
                viewModel.formKey.currentState.save();
                await viewModel.addTask();
                Navigator.pop(context, viewModel.categoryId);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget dropdownCategoriesButton(AddTaskViewModel viewModel) {
    return FutureBuilder<List>(
      future: viewModel.getCategories(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            width: 85.w,
            child: DropdownButton(
              items: snapshot.data.map(
                (data) {
                  print(data);
                  return DropdownMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 16.sp,
                          color:
                              Color(data["${ConstNames.categoryColorColumn}"]),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "${data[ConstNames.categoryNameColumn]}",
                          style: TextStyle(
                              color: Color(
                                  data["${ConstNames.categoryColorColumn}"]),
                              fontSize: 17.sp),
                        ),
                      ],
                    ),
                    value: data["${ConstNames.categoryIdColumn}"],
                  );
                },
              ).toList(),
              value: viewModel.categoryId,
              onChanged: (value) {
                viewModel.categoryId = value;
              },
              isExpanded: true,
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("${snapshot.error}");
        }
        return Container();
      },
    );
  }
}