import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/screens/category/product_category/bloc/filter_bloc.dart';
import 'package:ecommerce_app_mobile/screens/category/product_category/components/body_filter.dart';
import 'package:ecommerce_app_mobile/screens/home/components/base_input.dart';
import 'package:ecommerce_app_mobile/screens/product/product_screen.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListAllProductCategoryScreen extends StatefulWidget {
  const ListAllProductCategoryScreen({super.key});
  static String routeName ="/listproduct_cate";

  @override
  State<ListAllProductCategoryScreen> createState() => _ListAllProductCategoryScreenState();
}

class _ListAllProductCategoryScreenState extends State<ListAllProductCategoryScreen> {
  final FilterBloc filterBloc = FilterBloc();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final categoryId = ModalRoute.of(context)?.settings.arguments as String;
    filterBloc.add(FilterInitialEvent(categoryId: categoryId));
    return BlocConsumer(
      bloc: filterBloc,
      buildWhen: (previous, current) => current is !FilterActionState,
      listenWhen: (previous, current) => current is FilterActionState,
      listener: (context, state)  {
          if (state is FilterClickProductDetailState) {
             Navigator.pushNamed(context, ProductScreen.routeName,
              arguments: state.productId);
          }
        },
      builder: (context, state) {
          switch (state.runtimeType) {
            case FilterLoadingState:
              return const Center(
                child: LoadingScreen(),
              );
            case FilterLoadedSuccessState:
              final loadedState = state as FilterLoadedSuccessState;
              return Scaffold(
                  appBar: buildAppBar(),
                  body: SingleChildScrollView(
                    child: BodyFilter(
                      listProduct: loadedState.filtersProduct,
                      filterBloc: filterBloc,
                      isvisible: loadedState.isvisible,
                    ),
                  ),
                  
                );
            case FilterErrorState:
              final errorState = state as FilterErrorState;
              return Scaffold(
                body: Center(child: Text(errorState.errorMessage)),
              );
            default:
              return SizedBox();
          }
        },
      );
    
  }

   AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1.5,
      title: InputHome(),
    );
  }
}