// import 'package:ecommerce_app_mobile/model/products/data_details_product.dart';
// import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
// import 'package:ecommerce_app_mobile/model/products/specifications/specification_data_model.dart';
// import 'package:ecommerce_app_mobile/model/products/variants/variant_data_model.dart';
// import 'package:ecommerce_app_mobile/screens/product/bloc/product_bloc.dart';
// import 'package:ecommerce_app_mobile/screens/product/components/images_product.dart';
// import 'package:ecommerce_app_mobile/screens/product/components/productdetail/policy_sales.dart';
// import 'package:ecommerce_app_mobile/screens/product/components/productdetail/specification_screen.dart';
// import 'package:ecommerce_app_mobile/screens/product/related_products/list_product.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class BodySuccess extends StatefulWidget {
//   final DataDetailProduct productDetail;
//   // final List<ProductDataModel> listallproduct;
  
//   // const BodySuccess({super.key, required this.productDetail, required this.listallproduct});

// const BodySuccess({super.key, required this.productDetail});
//   @override
//   State<BodySuccess> createState() => _BodySuccessState();
// }

// class _BodySuccessState extends State<BodySuccess> {
//   late ProductDataModel? product;
//   late List<DetailDataModel>? details;
//   late List<VariantDataModel>? variants;

//   String? selectedMemory; // Trạng thái cho lựa chọn memory
//   String? selectedColor; // Trạng thái cho lựa chọn màu sắc
//   int? selectedPrice;
//   int? selectedOldPrice;

  

  
//   @override
//   void initState() {
//     // TODO: implement initState
   
//     super.initState();
//     product = widget.productDetail.product;
//     details = widget.productDetail.details ?? [];
//     variants = widget.productDetail.variants;

//     // Gán giá trị mặc định cho memory và màu sắc nếu có
//     if (variants != null && variants!.isNotEmpty) {
//       selectedMemory = variants!.first.memory;
//       selectedColor = variants!.first.variants?[0].color;
//       selectedPrice = variants!.first.variants?[0].price?.discount; // Giá mặc định
//       selectedOldPrice = variants!.first.variants?[0].price?.initial; // Giá mặc định
//     }

//   }

//   @override
//   Widget build(BuildContext context) {
//     String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(selectedPrice ?? 0);
//     String formattedOldPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(selectedOldPrice ?? 0);
//     SizeConfig().init(context);
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(
//           getProportionateScreenWidth(0),
//           getProportionateScreenHeight(0),
//           getProportionateScreenWidth(0),
//           getProportionateScreenHeight(15)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: getFullWidth(),
//               color: Colors.white,
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(
//                   getProportionateScreenWidth(20),
//                   getProportionateScreenHeight(15),
//                   getProportionateScreenWidth(20),
//                   getProportionateScreenHeight(15)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ImagesCreen(images : product?.images),
//                     SizedBox(
//                       height: getProportionateScreenHeight(10),
//                     ),
//                     Text(
//                       'Dung lượng: $selectedMemory',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     SizedBox(height: getProportionateScreenHeight(5)),
//                     Wrap(
//                       spacing: 5,
//                       children: variants?.map<Widget>((variant) {
//                         return ChoiceChip(
//                           label: Text(
//                             '${variant.memory}',
//                             style: TextStyle(
//                               color: selectedMemory == variant.memory ? Colors.red : Colors.black,
//                             ),
//                           ),
//                           selected: selectedMemory == variant.memory,
//                           onSelected: (selected) {
//                             setState(() {
//                               selectedMemory = variant.memory;

//                               // Cập nhật giá dựa trên bộ nhớ được chọn
//                               var selectedVariant = variants?.firstWhere(
//                                 (v) => v.memory == selectedMemory,
//                               );
//                               if (selectedVariant != null && selectedVariant.variants != null) {
//                                 selectedPrice = selectedVariant.variants?.first.price?.discount;
//                                 selectedOldPrice = selectedVariant.variants?.first.price?.initial;
//                                 selectedColor = selectedVariant.variants?.first.color; // Cập nhật màu mặc định
//                               }
//                             });
//                           },
//                           selectedColor: Colors.white,
//                           backgroundColor: Colors.white,
//                           side: BorderSide(
//                             color: selectedMemory == variant.memory ? Colors.red : Colors.grey, // Màu viền
//                             width: 1, // Độ dày viền
//                           ),
//                         );
//                       }).toList() ??
//                           [],
//                     ),
//                     SizedBox(height: getProportionateScreenHeight(10)),

//                     // Lựa chọn Màu sắc
//                     Text(
//                       'Màu sắc : $selectedColor',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     SizedBox(height: getProportionateScreenHeight(5)),
//                     Wrap(
//                       spacing: 5,
//                       children: variants!
//                           .firstWhere((v) => v.memory == selectedMemory)
//                           .variants
//                           ?.map<Widget>((colorVariant) {
//                         return ChoiceChip(
//                           label: Text(
//                             '${colorVariant.color}', // Hiển thị tên màu sắc
//                             style: TextStyle(
//                               color: selectedColor == colorVariant.color ? Colors.red : Colors.black,
//                             ),
//                           ),
//                           selected: selectedColor == colorVariant.color,
//                           onSelected: (selected) {
//                             setState(() {
//                               selectedColor = colorVariant.color;

//                               // Cập nhật giá dựa trên màu sắc được chọn
//                               var selectedVariant = variants!
//                                   .firstWhere((v) => v.memory == selectedMemory)
//                                   .variants
//                                   ?.firstWhere((cv) => cv.color == selectedColor);
//                               selectedPrice = selectedVariant?.price?.discount;
//                               selectedOldPrice = selectedVariant?.price?.initial;
//                             });
//                           },
//                           selectedColor: Colors.white,
//                           backgroundColor: Colors.white,
//                           side: BorderSide(
//                             color: selectedColor == colorVariant.color ? Colors.red : Colors.grey, // Màu viền
//                             width: 1, // Độ dày viền
//                           ),
//                         );
//                       }).toList() ??
//                           [],
//                     ),
//                     SizedBox(
//                       height: getProportionateScreenHeight(10),
//                     ),
//                     Text(
//                       '$formattedPrice',
//                       style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                      Text(
//                       '$formattedOldPrice',
//                       style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w700,
//                       decoration: TextDecoration.lineThrough, // Gạch ngang
//                       ),
//                     ),
//                     SizedBox(
//                       height: getProportionateScreenHeight(5),
//                     ),
//                     //thuonghieu
//                     Text(
//                         product?.name ?? 'null',
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //policy sales
//             SizedBox(
//               height: getProportionateScreenHeight(10),
//             ),
//             PolicySales(),
//             SizedBox(
//               height: getProportionateScreenHeight(10),
//             ),
//             //product details -> sẽ làm tại này 
//             Container(
//               width: getFullWidth(),
//               color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(
//                     getProportionateScreenWidth(20),
//                     getProportionateScreenHeight(10),
//                     getProportionateScreenWidth(20),
//                     getProportionateScreenHeight(15)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Chi tiết sản phẩm',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15
//                         )
//                       ),
//                       const Divider(),
//                       SizedBox(
//                         height: getProportionateScreenHeight(5),
//                       ),
//                       if (details != null && details!.isNotEmpty)
//                         for (var detailCategory in details!.take(1)) // Lặp qua từng danh mục chi tiết
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Hiển thị tên danh mục
//                               Text(
//                                 detailCategory.category ?? 'Không có danh mục',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               SizedBox(height: getProportionateScreenHeight(5)),

//                               // Lặp qua từng chi tiết trong danh mục
//                               if (detailCategory.details != null &&
//                                   detailCategory.details!.isNotEmpty)
//                                 for (var detail in detailCategory.details!)
//                                   Text(
//                                     '${detail.key ?? 'Không có key'}: ${detail.value ?? 'Không có giá trị'}',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   ),
//                               SizedBox(height: getProportionateScreenHeight(10)),
//                             ],
//                           )
//                       else
//                         // Hiển thị thông báo nếu không có dữ liệu
//                         Text(
//                           'Không có chi tiết sản phẩm',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                     SizedBox(
//                         height: getProportionateScreenHeight(5),
//                       ),
//                     const Divider(),
//                     GestureDetector(
//                       onTap: () =>{
//                         Navigator.push(context,MaterialPageRoute(builder: (context) =>
//                                     SpecificationScreen(details: details),
//                               ),
//                             )
//                       },
//                       child: Center(
//                         child: Text(
//                           'Xem thêm',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.grey,
//                           ),), ),
//                     ),
//                       // Lặp qua danh sách details
//                       // for (var detailCategory in details ?? [])
//                       //   Column(
//                       //     crossAxisAlignment: CrossAxisAlignment.start,
//                       //     children: [
//                       //       Text(
//                       //         detailCategory.category,
//                       //         style: TextStyle(
//                       //           fontWeight: FontWeight.bold,
//                       //           fontSize: 14,
//                       //         ),
//                       //       ),
//                       //       SizedBox(height: getProportionateScreenHeight(5)),
//                       //       for (var detail in detailCategory.details)
//                       //         Text(
//                       //           '${detail.key}: ${detail.value}',
//                       //           style: TextStyle(
//                       //             color: Colors.black,
//                       //             fontSize: 13,
//                       //             fontWeight: FontWeight.w300,
//                       //           ),
//                       //         ),
//                       //       SizedBox(height: getProportionateScreenHeight(10)),
//                       //     ],
//                       //   ),

//                     ],
//                   ),
//                 ),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(10),
//             ),
//             Container(
//               width: getFullWidth(),
//               color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(
//                     getProportionateScreenWidth(20),
//                     getProportionateScreenHeight(10),
//                     getProportionateScreenWidth(20),
//                     getProportionateScreenHeight(15)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Mô tả sản phẩm',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15
//                         )
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(5),
//                       ),
//                       Text(
//                         product?.description ?? 'null',
//                         style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w300,
//                       ),
                  
//                       )
//                     ],
//                   ),
//                 ),
//             ),

//             SizedBox(
//               height: getProportionateScreenHeight(10),
//             ),
//             Container(
//               width: getFullWidth(),
//               color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(
//                     getProportionateScreenWidth(5),
//                     getProportionateScreenHeight(10),
//                     getProportionateScreenWidth(20),
//                     getProportionateScreenHeight(15)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(
//                               getProportionateScreenWidth(15),
//                               getProportionateScreenHeight(0),
//                               getProportionateScreenWidth(0),
//                               getProportionateScreenHeight(0)),
//                             child: Text(
//                               'Một số sản phẩm liên quan',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                           Spacer(),
//                           GestureDetector(
//                             onTap: () => {},
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Xem tất cả",
//                                   style: TextStyle(
//                                     fontSize: getProportionateScreenWidth(14),
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w300,
//                                     decorationThickness: 2.0,
//                                   ),
//                                   textAlign: TextAlign.end,
                                
//                                 ),

//                                 Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 13,)
//                               ],
//                             ),
                            
//                           ),

//                         ],
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(13),
//                       ),
//                       // ProductList(products: widget.listallproduct)
//                     ],
//                   ),
//                 ),
//             ),
 
//           ],
//         ),
//       ),
//     );
//   }
// }


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
  final Function(String)? onMemorySelected;
  final Function(String)? onColorSelected;
  // final List<ProductDataModel> listallproduct;
  
  // const BodySuccess({super.key, required this.productDetail, required this.listallproduct});

const BodySuccess({super.key, required this.productDetail, this.onMemorySelected,  this.onColorSelected});
  @override
  State<BodySuccess> createState() => _BodySuccessState();
}

class _BodySuccessState extends State<BodySuccess> {
  late ProductDataModel? product;
  late List<DetailDataModel>? details;
  late List<VariantDataModel>? variants;

  String? selectedMemory; // Trạng thái cho lựa chọn memory
  String? selectedColor; // Trạng thái cho lựa chọn màu sắc
  int? selectedPrice;
  int? selectedOldPrice;

  

  
  @override
  void initState() {
    super.initState();
    product = widget.productDetail.product;
    details = widget.productDetail.details ?? [];
    variants = widget.productDetail.variants;

    // Gán giá trị mặc định cho memory và màu sắc nếu có
    if (variants != null && variants!.isNotEmpty) {
      selectedMemory = variants!.first.memory;
      selectedColor = variants!.first.variants?[0].color;
      
    // Sử dụng addPostFrameCallback để gọi hàm sau khi widget đã được xây dựng
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onMemorySelected!(selectedMemory!); // Gọi hàm với giá trị đã gán
      widget.onColorSelected!(selectedColor!);   // Gọi hàm với giá trị đã gán
    });

      // Cập nhật giá dựa trên variant đầu tiên
      var firstVariant = variants!.first.variants?.first;
      if (firstVariant != null) {
        selectedPrice = firstVariant.price?.discount ?? firstVariant.price?.initial; // Nếu discount là null, sử dụng giá initial
        selectedOldPrice = firstVariant.price?.initial; // Giá ban đầu
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(selectedPrice ?? 0);
    String formattedOldPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(selectedOldPrice ?? 0);
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
                      'Dung lượng: $selectedMemory',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Wrap(
                    spacing: 5,
                    children: variants?.map<Widget>((variant) {
                      return ChoiceChip(
                        label: Text(
                          '${variant.memory}',
                          style: TextStyle(
                            color: selectedMemory == variant.memory ? Colors.red : Colors.black,
                          ),
                        ),
                        selected: selectedMemory == variant.memory,
                        onSelected: (selected) {
                          setState(() {
                            selectedMemory = variant.memory;

                            // Cập nhật giá dựa trên bộ nhớ được chọn
                            var selectedVariant = variants?.firstWhere(
                              (v) => v.memory == selectedMemory,
                            );
                            if (selectedVariant != null && selectedVariant.variants != null) {
                              var firstVariant = selectedVariant.variants?.first;
                              selectedPrice = firstVariant?.price?.discount ?? firstVariant?.price?.initial; // Nếu discount là null, sử dụng giá initial
                              selectedOldPrice = firstVariant?.price?.initial; // Giá ban đầu
                              selectedColor = firstVariant?.color; // Cập nhật màu mặc định
                            }

                            widget.onMemorySelected!(selectedMemory ?? 'null');
                          });
                        },
                        selectedColor: Colors.white,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: selectedMemory == variant.memory ? Colors.red : Colors.grey,
                          width: 1,
                        ),
                      );
                    }).toList() ?? [],
                  ),
                    SizedBox(height: getProportionateScreenHeight(10)),

                    // Lựa chọn Màu sắc
                    Text(
                      'Màu sắc : $selectedColor',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Wrap(
                    spacing: 5,
                    children: variants!
                        .firstWhere((v) => v.memory == selectedMemory)
                        .variants
                        ?.map<Widget>((colorVariant) {
                      return ChoiceChip(
                        label: Text(
                          '${colorVariant.color}', // Hiển thị tên màu sắc
                          style: TextStyle(
                            color: selectedColor == colorVariant.color ? Colors.red : Colors.black,
                          ),
                        ),
                        selected: selectedColor == colorVariant.color,
                        onSelected: (selected) {
                          setState(() {
                            selectedColor = colorVariant.color;
                            // Cập nhật giá dựa trên màu sắc được chọn
                            var selectedVariant = variants!
                                .firstWhere((v) => v.memory == selectedMemory)
                                .variants
                                ?.firstWhere((cv) => cv.color == selectedColor);
                            selectedPrice = selectedVariant?.price?.discount ?? selectedVariant?.price?.initial; // Nếu discount là null, sử dụng giá initial
                            selectedOldPrice = selectedVariant?.price?.initial; // Giá ban đầu

                            widget.onColorSelected!(selectedColor ?? 'null');
                          });
                        },
                        selectedColor: Colors.white,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: selectedColor == colorVariant.color ? Colors.red : Colors.grey,
                          width: 1,
                        ),
                      );
                    }).toList() ?? [],
                  ),
                 
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
                     if (selectedOldPrice != null && selectedOldPrice! > 0) // Chỉ hiển thị giá cũ nếu có
                    if (selectedOldPrice != null && selectedOldPrice! > 0 && selectedPrice! < selectedOldPrice!) 
                    Text(
                      '$formattedOldPrice',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.lineThrough, // Gạch ngang
                      ),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    //thuonghieu
                    Text(
                        product?.name ?? 'null',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
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
                      // ProductList(products: widget.listallproduct)
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

