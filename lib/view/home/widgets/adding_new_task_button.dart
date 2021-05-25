import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/view/add_task/add_task_view.dart';
import 'package:todo_list_offline/view_model/home_view_model.dart';
import 'package:todo_list_offline/widgets/custom_floating_action_button.dart';

class AddingNewTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("allam test");
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return CustomFloatingActionButton(
      onPressed: () async {
        var result = await Navigator.pushNamed(context, AddTaskView.route);
        if (result != null) {
          viewModel.updateView();
        }
      },
    );
  }
}
