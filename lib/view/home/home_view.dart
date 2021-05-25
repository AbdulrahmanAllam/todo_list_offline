import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view/home/widgets/adding_new_task_button.dart';
import 'package:todo_list_offline/view/home/widgets/home_body.dart';
import 'package:todo_list_offline/view/home/widgets/popup_menu.dart';
import 'package:todo_list_offline/view_model/home_view_model.dart';
import 'package:todo_list_offline/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  static const String route = "HomeView";

  final provider = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.gray,
        appBar: customAppBar(
          title: "All Tasks",
          action: [
            PopupMenu(),
          ],
        ),
        body: HomeBody(),
        floatingActionButton: AddingNewTaskButton(),
       ),
    );
  }
}
