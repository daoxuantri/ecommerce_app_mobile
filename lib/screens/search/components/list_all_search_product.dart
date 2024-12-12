import 'package:ecommerce_app_mobile/model/filters/product_filter_data_model.dart';
import 'package:ecommerce_app_mobile/screens/search/bloc/search_bloc.dart';
import 'package:ecommerce_app_mobile/screens/search/bloc/search_event.dart';
import 'package:ecommerce_app_mobile/screens/search/components/product_card.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class ListAllSearchProduct extends StatelessWidget {
  final List<ProductsFilterDataModel>? ratingProducts;
  final SearchBloc searchBloc;

  const ListAllSearchProduct({
    super.key,
    required this.ratingProducts,
    required this.searchBloc,
  });

  @override
  Widget build(BuildContext context) {
    if (ratingProducts == null || ratingProducts!.isEmpty) {
      return Center(child: Text('Không có sản phẩm nào.'));
    }
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenHeight(25),),
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
            itemCount: ratingProducts!.length,
            itemBuilder: (context, index) {
              final product = ratingProducts![index]; // Lấy sản phẩm hiện tại

              return GestureDetector(
                onTap: () {
                
                  searchBloc.add(DetailProductClickedEvent(productId: product.sId));
                },
                child: ProductFilterCard(
                  images: (product.images != null && product.images!.isNotEmpty)
                      ? product.images![0]
                      : 'assets/images/notfoundimages.jpg',
                  name: product.name ?? 'Không có tên sản phẩm',
                  price: (product.initPrice != null && product.discPrice != null)
                      ? product.discPrice
                      : 0,
                  rating: product.rating,
                  initialprice: product.initPrice ?? 0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}