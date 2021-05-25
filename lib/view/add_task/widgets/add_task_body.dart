import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/view_model/add_task_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/widgets/custom_button.dart';
import 'package:todo_list_offline/widgets/custom_text_form_field.dart';

class AddTaskBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddTaskViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Form(
            key: viewModel.formKey,
            child: CustomTextFormField(
              hintText: "task",
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter your task";
                }
              },
              onChanged: (value) {
                viewModel.taskName = value;
              },
            ),
          ),
          SizedBox(height: 50.h),
          CustomButton(
            name: "add task",
            onTap: () async {
              if (viewModel.formKey.currentState.validate()) {
                await viewModel.addTask();
                Navigator.pop(context, viewModel.taskName);
              }
            },
          ),
        ],
      ),
    );
  }
}
