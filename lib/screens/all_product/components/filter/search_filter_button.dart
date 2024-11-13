import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/screens/all_product/components/filter/search_filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../../size_config.dart';
import '../../bloc/all_product_bloc.dart';

class SearchFilterButton extends StatefulWidget {
  const SearchFilterButton(
      {super.key,
      required this.filter,
      required this.allProductBloc,
      required this.listProductShow, required this.listAllProduct});

  final List<Map<String, List<dynamic>>> filter;
  final AllProductBloc allProductBloc;
  final List<ProductDataModel> listProductShow;
  final List<ProductDataModel> listAllProduct;

  @override
  State<SearchFilterButton> createState() => _SearchFilterButtonState();
}

class _SearchFilterButtonState extends State<SearchFilterButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenHeight(20),
      right: getProportionateScreenWidth(32),
      child: GestureDetector(
        onTap: () {
          _searchFilterBottomSheet(
              context, widget.filter, widget.allProductBloc, widget.listProductShow, widget.listAllProduct);
        },
        child: Container(
            width: getProportionateScreenWidth(100),
            height: getProportionateScreenHeight(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColor.color35A5F1),
            child: Row(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(17),
                ),
                Image.asset(
                  "assets/images/filter_svgrepo.com.png",
                ),
                SizedBox(
                  width: getProportionateScreenWidth(9),
                ),
                Text(
                  'Lọc',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.051,
                      color: Colors.white),
                )
              ],
            )),
      ),
    );
  }
}

Future _searchFilterBottomSheet(BuildContext context,
    List<Map<String, List<dynamic>>> filter, AllProductBloc allProductBloc, List<ProductDataModel> listProductShow, List<ProductDataModel> listAllProduct) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => SearchFilterBody(
      filter: filter,
      allProductBloc: allProductBloc,
      listProductShow: listProductShow, listAllProduct: listAllProduct,
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
  );
}
