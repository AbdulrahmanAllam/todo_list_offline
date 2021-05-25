import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/view/categories/widgets/adding_new_category_button.dart';
import 'package:todo_list_offline/view/categories/widgets/categories_body.dart';
import 'package:todo_list_offline/view_model/categories_view_model.dart';
import 'package:todo_list_offline/widgets/custom_app_bar.dart';

class CategoriesView extends StatelessWidget {
  static const String route = "CategoriesView";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategorieViewModel>(
      create: (context) => CategorieViewModel(),
      child: Scaffold(
        appBar: customAppBar(),
        body: CategoriesBody(),
        floatingActionButton: AddingNewCategoryButton(),
      ),
    );
  }
}
