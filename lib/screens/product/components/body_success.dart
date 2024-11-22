import 'package:ecommerce_app_mobile/model/products/data_details_product.dart';
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/model/products/specifications/specification_data_model.dart';
import 'package:ecommerce_app_mobile/model/products/variants/variant_data_model.dart';
import 'package:ecommerce_app_mobile/screens/product/bloc/product_bloc.dart';
import 'package:ecommerce_app_mobile/screens/product/components/images_product.dart';
import 'package:ecommerce_app_mobile/screens/product/components/productdetail/policy_sales.dart';
import 'package:ecommerce_app_mobile/screens/product/components/productdetail/specification_screen.dart';
import 'package:ecommerce_app_mobile/screens/product/related_products/list_product.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BodySuccess extends StatefulWidget {
  final DataDetailProduct productDetail;
  final List<ProductDataModel> listallproduct;
  
  const BodySuccess({super.key, required this.productDetail, required this.listallproduct});

  @override
  State<BodySuccess> createState() => _BodySuccessState();
}

class _BodySuccessState extends State<BodySuccess> {
  late ProductDataModel? product;
  late List<DetailDataModel>? details;
  late List<VariantDataModel>? variants;
  @override
  void initState() {
    // TODO: implement initState
    product = widget.productDetail.product;
    details = widget.productDetail.details ?? [];
    variants = widget.productDetail.variants;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(product?.price);
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(0),
          getProportionateScreenHeight(0),
          getProportionateScreenWidth(0),
          getProportionateScreenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getFullWidth(),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(15),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesCreen(images : product?.images),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      '$formattedPrice',
                      style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    //thuonghieu
                    Text(
                        product?.name ?? 'null',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                  ],
                ),
              ),
            ),
            //policy sales
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            PolicySales(),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            //product details -> sẽ làm tại này 
            Container(
              width: getFullWidth(),
              color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(10),
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chi tiết sản phẩm',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        )
                      ),
                      const Divider(),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      if (details != null && details!.isNotEmpty)
                        for (var detailCategory in details!.take(1)) // Lặp qua từng danh mục chi tiết
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Hiển thị tên danh mục
                              Text(
                                detailCategory.category ?? 'Không có danh mục',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),

                              // Lặp qua từng chi tiết trong danh mục
                              if (detailCategory.details != null &&
                                  detailCategory.details!.isNotEmpty)
                                for (var detail in detailCategory.details!)
                                  Text(
                                    '${detail.key ?? 'Không có key'}: ${detail.value ?? 'Không có giá trị'}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                              SizedBox(height: getProportionateScreenHeight(10)),
                            ],
                          )
                      else
                        // Hiển thị thông báo nếu không có dữ liệu
                        Text(
                          'Không có chi tiết sản phẩm',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                    const Divider(),
                    GestureDetector(
                      onTap: () =>{
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                    SpecificationScreen(details: details),
                              ),
                            )
                      },
                      child: Center(
                        child: Text(
                          'Xem thêm',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),), ),
                    ),
                      // Lặp qua danh sách details
                      // for (var detailCategory in details ?? [])
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         detailCategory.category,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //       SizedBox(height: getProportionateScreenHeight(5)),
                      //       for (var detail in detailCategory.details)
                      //         Text(
                      //           '${detail.key}: ${detail.value}',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         ),
                      //       SizedBox(height: getProportionateScreenHeight(10)),
                      //     ],
                      //   ),

                    ],
                  ),
                ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              width: getFullWidth(),
              color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(10),
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mô tả sản phẩm',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        )
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Text(
                        product?.description ?? 'null',
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                  
                      )
                    ],
                  ),
                ),
            ),

            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              width: getFullWidth(),
              color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(5),
                    getProportionateScreenHeight(10),
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(15),
                              getProportionateScreenHeight(0),
                              getProportionateScreenWidth(0),
                              getProportionateScreenHeight(0)),
                            child: Text(
                              'Một số sản phẩm liên quan',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => {},
                            child: Row(
                              children: [
                                Text(
                                  "Xem tất cả",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                    decorationThickness: 2.0,
                                  ),
                                  textAlign: TextAlign.end,
                                
                                ),

                                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 13,)
                              ],
                            ),
                            
                          ),

                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(13),
                      ),
                      ProductList(products: widget.listallproduct)
                    ],
                  ),
                ),
            ),
 
          ],
        ),
      ),
    );
  }
}


