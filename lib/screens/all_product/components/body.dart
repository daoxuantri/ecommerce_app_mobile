import 'dart:ui';

import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/screens/all_product/components/MyProduct.dart';
import 'package:ecommerce_app_mobile/screens/all_product/components/filter/search_filter_button.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/all_product_bloc.dart';

class AllProductBody extends StatelessWidget {
  const AllProductBody(
      {super.key,
      required this.listAllProduct,
      required this.allProductBloc,
      required this.filter,
      required this.listProductShow});

  final List<ProductDataModel> listAllProduct;
  final List<ProductDataModel> listProductShow;
  final AllProductBloc allProductBloc;
  final List<Map<String, List<dynamic>>> filter;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(20),
                getProportionateScreenHeight(38),
                getProportionateScreenWidth(20),
                getProportionateScreenHeight(30)),
            child: Stack(
              children: [
                TextFormField(
                  onFieldSubmitted: (value) {
                    print("Hoan Tat CLICk");
                    allProductBloc.add(AllProductSearchEvent(
                        listAllProduct: listAllProduct,
                        query: _controller.text));
                  },
                  onTap: () {
                    //allProductBloc.add(AllProductSearchBarClickEvent());
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 18),
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.colorD1D1D6,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColor.color8E8E93),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      // borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
                Positioned(
                  right: 0,
                  top: 1,
                  child: Container(
                    width: getProportionateScreenWidth(60),
                    height: getProportionateScreenHeight(48),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      //color: Colors.black
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: AppColor.color35A5F1,
                          size: 30,
                        ),
                        onPressed: () {
                          print(_controller.text);
                          allProductBloc.add(AllProductSearchEvent(
                              listAllProduct: listAllProduct,
                              query: _controller.text));
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(10),
                  right: getProportionateScreenWidth(15),
                  left: getProportionateScreenWidth(15)),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: getProportionateScreenWidth(80) /
                      getProportionateScreenHeight(95),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                ),
                itemCount: listProductShow.length,
                itemBuilder: (context, index) {
                  return Container(
                    // padding: EdgeInsets.fromLTRB(
                    //     getProportionateScreenWidth(20),
                    //     getProportionateScreenHeight(10),
                    //     getProportionateScreenWidth(20),
                    //     getProportionateScreenHeight(30)),
                    child: GestureDetector(
                      onTap: () {
                        // allProductBloc.add(AllProductClickedEvent(
                        //     productId: listProductShow[index].sId.toString()));
                      },
                      child: MyProduct(
                        id: listProductShow[index].sId.toString(),
                        name: listProductShow[index].name.toString(),
                        // images: listProductShow[index].images![0],
                        images: (listProductShow[index].images != null && listProductShow[index].images!.isNotEmpty) 
                      ? listProductShow[index].images![0] 
                      : 'assets/images/notfoundimages.jpg',
                        allProductBloc: allProductBloc,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      SearchFilterButton(
        filter: filter,
        allProductBloc: allProductBloc,
        listProductShow: listProductShow,
        listAllProduct: listAllProduct,
      )
    ]);
  }
}
