import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/model/category_model.dart';
import 'package:todo_list_offline/view_model/categories_view_model.dart';

class CategoriesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategorieViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder(
          future: viewModel.getAllCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return categoriesList(snapshot);
            } else if (snapshot.hasError) {
              print("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget categoriesList(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        CategoryModel data = CategoryModel.fromMap(snapshot.data[index]);
        return categoryItem(data);
      },
    );
  }

  Widget categoryItem(CategoryModel data) {
    return Text("${data.name} + ${data.color}");
  }
}
