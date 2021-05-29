import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/model/task_model.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view_model/home_view_model.dart';
import 'package:sizer/sizer.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder(
          future: viewModel.getTasks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return taskList(snapshot, viewModel);
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

  Widget taskList(AsyncSnapshot snapshot, HomeViewModel viewModel) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext contex, int index) {
        TaskModel data = TaskModel.fromMap(snapshot.data[index]);
        return taskItem(data, viewModel);
      },
    );
  }

  Widget taskItem(TaskModel data, HomeViewModel viewModel) {
    if (data.done == true) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Icon(
              Icons.circle,
              color: AppColors.lightGray,
              size: 15.sp,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            "${data.name}",
            style: TextStyle(
                color: AppColors.lightGray,
                fontSize: 15.sp,
                decoration: TextDecoration.lineThrough),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          Checkbox(
            value: data.done,
            onChanged: (value) {
              viewModel.checkTask(data.id, value);
            },
            activeColor: AppColors.lightGray,
          )
        ],
      );
    } else {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Icon(
              Icons.circle,
              color: Color(data.categoryColor),
              size: 15.sp,
            ),
          ),
          Text(
            "${data.name}",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15.sp,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),
          Theme(
            child: Checkbox(
              value: data.done,
              onChanged: (value) {
                viewModel.checkTask(data.id, value);
              },
              activeColor: AppColors.white,
            ),
            data: ThemeData(
              unselectedWidgetColor: AppColors.white,
            ),
          )
        ],
      );
    }
  }
}
