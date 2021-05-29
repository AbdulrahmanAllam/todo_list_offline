import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_offline/model/category_model.dart';
import 'package:todo_list_offline/utils/app_color.dart';
import 'package:todo_list_offline/view_model/add_task_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_offline/widgets/custom_button.dart';
import 'package:todo_list_offline/widgets/custom_text_form_field.dart';

class AddTaskBody extends StatelessWidget {
  final fontSize = 15.sp;
  final iconSize = 14.sp;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddTaskViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Form(
            key: viewModel.formKey,
            child: CustomTextFormField(
              hintText: "I want to...",
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter your task";
                }
              },
              onChanged: (value) {
                viewModel.taskName = value;
              },
            ),
          ),
          categoriesList(viewModel),
          viewModel.categoreColor == null || viewModel.categoreName == null
              ? Container(
                  height: 5.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  color: AppColors.lightGray,
                  child: Center(
                      child: Text(
                    "You Don't Select Category!",
                    style:
                        TextStyle(color: AppColors.white, fontSize: fontSize),
                  )),
                )
              : Container(
                  height: 5.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  color: AppColors.lightGray,
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(viewModel.categoreColor),
                        size: iconSize,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "${viewModel.categoreName}",
                        style: TextStyle(
                            color: Color(viewModel.categoreColor),
                            fontSize: fontSize),
                      ),
                      Expanded(
                          child: SizedBox(
                        width: double.infinity,
                      )),
                      GestureDetector(
                        onTap: () {
                          viewModel.removeCategory();
                        },
                        child: Icon(
                          Icons.close,
                          color: AppColors.white,
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
          CustomButton(
            name: "add",
            onTap: () async {
              if (viewModel.formKey.currentState.validate()) {
                if (viewModel.categoreColor == null) {
                  viewModel.categoreColor = AppColors.white.value;
                }
                await viewModel.addTask();
                Navigator.pop(context, viewModel.categoreColor);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget categoriesList(AddTaskViewModel viewModel) {
    return FutureBuilder(
      future: viewModel.getCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 0),
            height: 50.h,
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                CategoryModel data =
                    CategoryModel.fromMap(snapshot.data[index]);
                if (data.name == "not categorized") {
                  return Container();
                }
                return categoryItem(data, viewModel);
              },
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget categoryItem(CategoryModel data, AddTaskViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.setCategoryColorAndName(data.name, data.color);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: Color(data.color),
              size: iconSize,
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              "${data.name}",
              style: TextStyle(color: Color(data.color), fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
