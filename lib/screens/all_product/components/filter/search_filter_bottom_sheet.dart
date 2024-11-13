import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/screens/all_product/components/filter/categories.dart';
import 'package:flutter/material.dart';
import '../../../../size_config.dart';
import '../../bloc/all_product_bloc.dart';

class SearchFilterBody extends StatefulWidget {
  const SearchFilterBody(
      {super.key,
      required this.filter,
      required this.allProductBloc,
      required this.listProductShow,
      required this.listAllProduct});

  final List<Map<String, List<dynamic>>> filter;
  final AllProductBloc allProductBloc;
  final List<ProductDataModel> listProductShow;
  final List<ProductDataModel> listAllProduct;

  @override
  State<SearchFilterBody> createState() => _SearchFilterBodyState();
}

class _SearchFilterBodyState extends State<SearchFilterBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(740),
      child: Column(
        children: [
          Container(
            height: getProportionateScreenWidth(55),
            width: getFullWidth(),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black),
              ),
            ),
            child: Center(
              child: Text(
                'Lọc',
                textScaleFactor: 1,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.077,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Categories(
                list: widget.filter[index].values.first,
                title: widget.filter[index].keys.first,
                allProductBloc: widget.allProductBloc,
                listProductShow: widget.listProductShow,
                listAllProduct: widget.listAllProduct,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
