import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/view/add_category/add_category_view.dart';
import 'package:todo_list_offline/view/categories/categories_view.dart';
import 'package:todo_list_offline/view_model/home_view_model.dart';

class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    final popupList = viewModel.popupMenuList;
    return PopupMenuButton(
      initialValue: 2,
      icon: Icon(Icons.more_vert),
      onSelected: (index) {
        if (index == 0) {
          print("deleted");
          viewModel.deleteSelectedTasks();
        } else {
          print("navigated");
          Navigator.pushNamed(context, CategoriesView.route);
        }
      },
      itemBuilder: (context) {
        return List.generate(popupList.length, (index) {
          return PopupMenuItem(
            value: index,
            child: Text("${popupList[index]}"),
          );
        });
      },
    );
  }
}
