import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view/add_task/widgets/add_task_body.dart';
import 'package:todo_list_offline/view_model/add_task_view_model.dart';
import 'package:todo_list_offline/widgets/custom_app_bar.dart';

class AddTaskView extends StatelessWidget {
  static const String route = "AddTaskView";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTaskViewModel>(
      create: (context) => AddTaskViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.gray,
        appBar: customAppBar(),
        body: AddTaskBody(),
      ),
    );
  }
}
