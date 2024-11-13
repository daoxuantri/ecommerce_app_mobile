import 'package:ecommerce_app_mobile/screens/category/bloc/category_bloc.dart';
import 'package:ecommerce_app_mobile/screens/category/components/category.dart';
import 'package:ecommerce_app_mobile/screens/category/components/error.dart';
import 'package:ecommerce_app_mobile/screens/category/components/text_title.dart';
import 'package:ecommerce_app_mobile/screens/home/components/base_input.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static String routeName ="/category";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryBloc categoryBloc = CategoryBloc();

  @override
  void initState() {
    // TODO: implement initState
    categoryBloc.add(CategoryInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<CategoryBloc, CategoryState>(
      bloc: categoryBloc,
      listenWhen: (previous, current) => current is CategoryActionState,
      buildWhen: (previous, current) => current is! CategoryActionState,
      listener: (context, state) {
        if (state is CategoryErrorScreenToLoginState) {
          // Navigator.pushNamed(context, LoginScreen.routeName);
        }
        // if (state is HomeProductClickedState) {
        //   // Navigator.pushNamed(context, ProductScreen.routeName,
        //   //     arguments: state.productId);
        // }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CategoryLoadingState:
            return Center(child: const CircularProgressIndicator());
          case CategoryLoadedSuccessState:
            final successState = state as CategoryLoadedSuccessState;
            return Scaffold(
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextTitle(title: 'Danh mục sản phẩm'),
                    Category(
                      categories : successState.categoriesPropose,
                      categoryBloc : categoryBloc),
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                    )
                  ],
                ),
              ),
            );
          case CategoryErrorState:
            final errorState = state as CategoryErrorState;
            return ErrorStateScreen(
              message: errorState.errorMessage,
              categoryBloc: categoryBloc,
            );
          case CategoryErrorScreenToLoginState:
            return const SizedBox(
                child: Center(
              child: Text('CategoryErrorScreenToLoginState'),
            ));
          default:
            return const SizedBox();
        }
      },
    );
  }
  
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1.5,
      title: InputHome(),
      // actions: [
      //   GestureDetector(
      //     onTap: () {
              
      //     },
      //     child: CircleAvatar(
      //       backgroundColor: AppColor.colorF97616,
      //       child: SvgPicture.asset(
      //         'assets/images/IC_Bell.svg',
      //         color: AppColor.colorWhite,
      //       ),
      //     ),
      //   ),
      //   const SizedBox(
      //     width: 20,
      //   ),
      //   GestureDetector(
      //     onTap: () {
            
      //     },
      //     child: Image.asset(
      //       'assets/images/Facebook_Icon.png',
      //       width: 30,
      //     ),
      //   ),
      //   const SizedBox(
      //     width: 20,
      //   )
      // ],
    );
  }
}