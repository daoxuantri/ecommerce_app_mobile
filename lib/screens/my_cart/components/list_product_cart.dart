
import 'package:ecommerce_app_mobile/model/cart/product_item_model.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListProductCart extends StatefulWidget {

  final CartBloc cartBloc;
  final int? total;
  final List<ProductItemModel>? listproduct;
  const ListProductCart({super.key, required this.cartBloc, required this.total, this.listproduct});

  @override
  State<ListProductCart> createState() => _ListProductCartState();
}

class _ListProductCartState extends State<ListProductCart> {

  
  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(widget.total!);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.listproduct?.length ?? 0,
            itemBuilder: (context, index) {
              return CartItem(
                idProduct: widget.listproduct?[index].product,
                idObject: widget.listproduct?[index].sId,
                productName: widget.listproduct?[index].name,
                price: widget.listproduct?[index].price,
                imageUrl: (widget.listproduct?[index].images?.isNotEmpty ?? false)
                    ? widget.listproduct![index].images!
                    : 'assets/images/notfoundimages.jpg',
                initialQuantity: widget.listproduct?[index].quantity,
                memory: widget.listproduct?[index].memory,
                color: widget.listproduct?[index].color,
                cartBloc: widget.cartBloc,
              );
            },
          ),
        ],
      ),
    );
  }
}


