import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/home/bloc/home_bloc.dart';
import 'package:ecommerce_app_mobile/screens/home/components/base_input.dart';
import 'package:ecommerce_app_mobile/screens/home/components/category.dart';
import 'package:ecommerce_app_mobile/screens/home/components/list_product.dart';
import 'package:ecommerce_app_mobile/screens/home/components/loading_error/error.dart';
import 'package:ecommerce_app_mobile/screens/home/components/slider_home.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../login_register/login/login_screen.dart';
import 'components/list-propose.dart';
import 'components/loading_error/loading.dart';
import 'components/text_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName ="/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeErrorScreenToLoginState) {
          Navigator.pushNamed(context, LoginScreen.routeName);
        }
        if (state is HomeProductClickedState) {
          // Navigator.pushNamed(context, ProductScreen.routeName,
          //     arguments: state.productId);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Loading();
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    SliderHome(banner: successState.bannersPropose , homeBloc: homeBloc),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(25),
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(15)),
                      child: const Text(
                        "Các sản phẩm nổi bật",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //Dựa theo đánh giá số sao
                    ListPropose(
                      ratingProducts: successState.ratingPropose,
                      homeBloc: homeBloc,
                    ),
                    const TextTitle(title: 'Điện thoại'),
                    ProductList(products: successState.categoriesPropose[0].products ?? []),
                    const TextTitle(title: 'Lap Top'),
                    ProductList(products: successState.categoriesPropose[1].products ?? []),
                    const TextTitle(title: 'Smart Watch'),
                    ProductList(products: successState.categoriesPropose[2].products ?? []),

                   
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                    )
                  ],
                ),
              ),
            );
            //xemlai
          case HomeErrorState:
            final errorState = state as HomeErrorState;
            return ErrorStateScreen(
              message: errorState.errorMessage,
              homeBloc: homeBloc,
            );
          case HomeErrorScreenToLoginState:
            return const SizedBox(
                child: Center(
              child: Text('HomeErrorScreenToLoginState'),
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





