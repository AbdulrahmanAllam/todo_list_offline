import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/view/add_category/add_category_view.dart';
import 'package:todo_list_offline/view_model/categories_view_model.dart';
import 'package:todo_list_offline/widgets/custom_floating_action_button.dart';

class AddingNewCategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategorieViewModel>(context);
    return CustomFloatingActionButton(
      onPressed: () async {
        var result = await Navigator.pushNamed(context, AddCategoryView.route);
        if (result != null) {
          viewModel.notifyListeners();
        }
      },
    );
  }
}
