import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/model/task_model.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view_model/home_view_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel data;
  TaskItem(this.data);
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        viewModel.checkTask(data.id, data.done);
      },
      child: Text(
        "${data.name} + ${data.done} + ${data.category} + ${data.id}",
        style: TextStyle(
          color: AppColors.white,
        ),
      ),
    );
  }
}
