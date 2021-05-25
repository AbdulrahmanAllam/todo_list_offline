import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/model/task_model.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view/home/widgets/task.dart';
import 'package:todo_list_offline/view_model/home_view_model.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder(
          future: viewModel.getTasks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext contex, int index) {
                  TaskModel task = TaskModel.fromMap(snapshot.data[index]);
                  return TaskItem(task);
                },
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
            }
            return CircularProgressIndicator(
              backgroundColor: AppColors.white,
            );
          },
        );
      },
    );
  }
}
