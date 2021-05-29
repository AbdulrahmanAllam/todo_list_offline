import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/view/add_category/add_category_view.dart';
import 'package:todo_list_offline/view/add_task/add_task_view.dart';
import 'package:todo_list_offline/view/categories/categories_view.dart';
import 'package:todo_list_offline/view/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: HomeView.route,
          routes: routes,
        );
      },
    );
  }
}

final routes = {
  HomeView.route: (context) => HomeView(),
  AddTaskView.route: (context) => AddTaskView(),
  AddCategoryView.route: (context) => AddCategoryView(),
  CategoriesView.route: (context) => CategoriesView(),
};
