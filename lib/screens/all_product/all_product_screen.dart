import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/screens/all_product/bloc/all_product_bloc.dart';
import 'package:ecommerce_app_mobile/screens/all_product/components/body.dart';
import 'package:ecommerce_app_mobile/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

class AllProductScreen extends StatefulWidget {
  static String routeName = "/allproduct";

  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final AllProductBloc allProductBloc = AllProductBloc();
  List<ProductDataModel> listProductShow = [];
  List<ProductDataModel> listAllProduct = [];
  Color colorWhenClick = Colors.white;

  Future<void> _navigateToProductDetail(String product) async {
    // Gọi màn hình chi tiết sản phẩm và chờ kết quả trả về
    // var i = Navigator.pushNamed<dynamic>(
    //   context,
    //   ProductScreen.routeName,
    //   arguments: product,
    // );
    // Nếu kết quả trả về từ màn hình chi tiết là true (đã bỏ yêu thích), cập nhật danh sách yêu thích
    // if (await i == true) {
    //   allProductBloc.add(AllProductInitialEvent());
    // }
  }

  @override
  void initState() {
    allProductBloc.add(AllProductInitialEvent());
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AllProductBloc, AllProductState>(
      bloc: allProductBloc,
      listenWhen: (previous, current) => current is AllProductActionState,
      buildWhen: (previous, current) => current is! AllProductActionState,
      listener: (context, state) {
        if (state is AllProductClickedState) {
          // print("AllProductClickedState");
          // _navigateToProductDetail(state.productId);
          // Navigator.pushNamed(context, ProductScreen.routeName,
          //     arguments: state.productId);
        }
        // if (state is ProductClickedUnFavoriteEvent) {
        //   print("ProductClickedUnFavoriteState");
        //   setState(() {});
        // }
        if (state is AllProductSearchState) {
          setState(() {
            listProductShow = state.matchQuery;
          });
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AllProductLoadingState:
            return const Center(
              child: LoadingScreen(),
            );
          case AllProductLoadedState:
            final successState = state as AllProductLoadedState;
            if (listProductShow.isEmpty) {
              listProductShow = successState.listAllProduct;
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Tất cả sản phẩm',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
              ),
              body: AllProductBody(
                listAllProduct: successState.listAllProduct,
                allProductBloc: allProductBloc,
                filter: successState.filter,
                listProductShow: listProductShow,
              ),
            );
          case AllProductErrorState:
            final errorState = state as AllProductErrorState;
            return Scaffold(
              body: Center(child: Text(errorState.message)),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
