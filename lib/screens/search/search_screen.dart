import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/product/product_screen.dart';
import 'package:ecommerce_app_mobile/screens/search/components/list_all_search_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';

class SearchScreen extends StatelessWidget {
  final String keyword;

  const SearchScreen({Key? key, required this.keyword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchBloc = SearchBloc();
    searchBloc.add(SearchInitialEvent(keyword: keyword));

    return Scaffold(
      appBar: buildAppBar(keyword, context),
      body: BlocListener<SearchBloc, SearchState>(
        bloc: searchBloc,
        listener: (context, state) {
          if (state is DetailProductClickedState) {
            // Chuyển hướng đến màn hình chi tiết sản phẩm
             Navigator.pushNamed(context, ProductScreen.routeName,
              arguments: state.productId);
          }
        },
        child: BlocBuilder<SearchBloc, SearchState>(
          bloc: searchBloc,
          builder: (context, state) {
            if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchLoaded) {
              final products = state.listProducts;
              return ListAllSearchProduct(
                ratingProducts: products,
                searchBloc: searchBloc,
              );
            }
            return Center(child: Text('Không có sản phẩm nào.'));
          },
        ),
      ),
    );
  }
}

AppBar buildAppBar(String keyword, BuildContext context) {
  return AppBar(
    title: Text(
      'Kết quả tìm kiếm cho: $keyword',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Image.asset('assets/images/shopping-cart.png', width: 20, scale: 20),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const NavigatorBottomBarHome(currentIndex: 2),
            ),
          );
        },
      ),
    ],
  );
}