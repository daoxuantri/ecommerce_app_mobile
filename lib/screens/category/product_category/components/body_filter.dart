
import 'package:ecommerce_app_mobile/model/product_category/detail_product_cate/product_cate_data_model.dart';
import 'package:ecommerce_app_mobile/screens/category/product_category/bloc/filter_bloc.dart';
import 'package:ecommerce_app_mobile/screens/category/product_category/components/No_product_filter.dart';
import 'package:ecommerce_app_mobile/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

class BodyFilter extends StatelessWidget {
  final List<ProductCateDataModel> listProduct ; 
  final FilterBloc filterBloc ;
  final bool isvisible ; 
  const BodyFilter({super.key, required this.listProduct, required this.filterBloc, required this.isvisible});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: isvisible, child: NoProductFilter(),),
        Container(
          padding: const EdgeInsets.only(right: 15),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Hiển thị 2 sản phẩm trên một hàng
              mainAxisSpacing: 10, // Khoảng cách giữa các hàng
              crossAxisSpacing: 5, // Khoảng cách giữa các cột
              childAspectRatio: 0.65, // Tỉ lệ giữa chiều cao và chiều rộng của item
            ),
            itemCount: listProduct.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // print(listProduct[index].sId.toString());
                  filterBloc.add(FilterClickProductDetailEvent(productId: listProduct[index].sId.toString()));
                },
                child: ProductCard(
                  images: (listProduct[index].images != null && listProduct[index].images!.isNotEmpty) 
                        ? listProduct[index].images![0] 
                        : 'assets/images/notfoundimages.jpg',
                  name: listProduct[index].name,
                  price: listProduct[index].discPrice ?? listProduct[index].initPrice,
                  rating: listProduct[index].rating,
                  initialprice: listProduct[index].initPrice,
                ),


              );
            },
          ),
        ),
      ],
    );
  }
}