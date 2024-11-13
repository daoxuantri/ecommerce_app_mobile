import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import '../bloc/all_product_bloc.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({
    super.key,
    required this.name,
    required this.images,
    required this.allProductBloc,
    required this.id,
  });

  final String id;
  final String name;
  final String images;
  final AllProductBloc allProductBloc;

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.colorWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            // Màu shadow và độ mờ
            offset: Offset(0, 5),
            // Độ lệch tọa độ theo chiều dọc và ngang
            blurRadius: 5,
            // Độ mờ của shadow
            spreadRadius:
                0, // Độ lệch của shadow, có thể đặt khác 0 để tạo hiệu ứng lệch shadow
          ),
        ],
      ),
      child: Stack(children: [
        Column(children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                widget.images,
                fit: BoxFit.fitWidth,
                width: getProportionateScreenWidth(200),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.colorWhite,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Đơn vị tính:',
                            style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            'Sản phẩm',
                            style: const TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        // Positioned(
        //   right: getProportionateScreenWidth(15),
        //   bottom: getProportionateScreenHeight(15),
        //   child: GestureDetector(
        //     onTap: _onTap(),
        //     child: const Icon(
        //       Icons.favorite_outline_rounded,
        //       size: 30,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   right: getProportionateScreenWidth(15),
        //   bottom: getProportionateScreenHeight(70),
        //   child: Icon(
        //     Icons.circle,
        //     color: widget.productColor,
        //     size: 30,
        //   ),
        // ),
      ]),
    );
  }

  _onTap() {
    return () {
      widget.allProductBloc
          .add(ProductClickedUnFavoriteEvent(productId: widget.id.toString()));
    };
  }
}
