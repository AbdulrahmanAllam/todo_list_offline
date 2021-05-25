import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view/add_category/widgets/add_category_body.dart';
import 'package:todo_list_offline/view_model/add_category_view_model.dart';
import 'package:todo_list_offline/widgets/custom_app_bar.dart';

class AddCategoryView extends StatelessWidget {
  static const String route = "AddCategoryView";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCategoryViewModel>(
      create: (context) => AddCategoryViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.gray,
        appBar: customAppBar(
          title: "Add Category",
        ),
        body: AddCategoryBody(),
      ),
    );
  }
}
