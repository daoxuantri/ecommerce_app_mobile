import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';
import 'package:ecommerce_app_mobile/screens/category/bloc/category_bloc.dart';
import 'package:ecommerce_app_mobile/screens/category/components/category_card.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final List<ProductCategoryDataModel> categories;
  final CategoryBloc categoryBloc;

  const Category({super.key, required this.categories, required this.categoryBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: getFullHeight(), // Chiều cao tổng thể của grid view
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            mainAxisSpacing: 10, 
            crossAxisSpacing: 10, 
            childAspectRatio: 1, 
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                categoryBloc.add(CategoryProductClickedEvent(categoryId: categories[index].sId.toString()));
              },
              child: CategoryCard(
                name: categories[index].name.toString(),
                images: categories[index].images.toString(),
                id: categories[index].sId.toString(),
              ),
            );
          },
        ),
      ),
    );
  }
}