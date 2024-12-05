
import 'dart:async';

import 'package:ecommerce_app_mobile/screens/my_cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/modelselected/selected_model.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class CartItem extends StatefulWidget {
  final String? idObject;
  final String? idProduct;
  final String? productName;
  final int? price;
  final String? imageUrl;
  final String? color;
  final String? memory;
  final int? initialQuantity;
  final CartBloc cartBloc;

  const CartItem({
    super.key,
    this.idProduct,
    this.productName,
    this.price,
    this.imageUrl,
    this.initialQuantity = 1,
    this.color,
    this.memory, required this.cartBloc, required this.idObject,
  });


  static List<SelectedProduct> selectedProducts = [];

  @override
  State<CartItem> createState() => _CartItemState();
}


class _CartItemState extends State<CartItem> {
  bool isChecked = false; 
  late ValueNotifier<int> quantityNotifier;
  Timer? debounce; 


  


  @override
  void initState() {
    super.initState();
    quantityNotifier = ValueNotifier(widget.initialQuantity ?? 1);
  }

  void incrementQuantity() {
    quantityNotifier.value++;
    debounceEvent(1);
  }

  void decrementQuantity() {
    if (quantityNotifier.value > 1) {
      quantityNotifier.value--;
      debounceEvent(-1);
    }
  }
  void debounceEvent(int change) {
    // Hủy debounce trước đó nếu có
    debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      // Gửi sự kiện sau 500ms
      widget.cartBloc.add(UpdateProductQuantityEvent(
        productId: widget.idProduct,
        newQuantity: change,
        memory: widget.memory,
        color: widget.color,
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    // Định dạng giá
    String formattedPrice =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(widget.price ?? 0);

    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      width: SizeConfig.screenWidth * 0.5,
      height: SizeConfig.screenHeight * 0.2,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Checkbox
          Positioned(
            left: -5,
            top: 35,
            child: Checkbox(
              value: isChecked,
              side: const BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2), // Màu viền nhạt hơn
                width: 1, // Độ dày của viền
              ),
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                  if (isChecked) {
                   CartItem.selectedProducts.add(SelectedProduct(
                      id: widget.idProduct!,
                      name: widget.productName!,
                      price: widget.price!,
                      quantity: quantityNotifier.value,
                      color: widget.color,
                      memory: widget.memory,
                      images: widget.imageUrl
                    )); 
                  } else {
                   CartItem.selectedProducts.removeWhere((product) => product.id == widget.idProduct); 
                  }
                });
              },
              activeColor: Colors.red, // Màu khi được chọn
              checkColor: Colors.white, // Màu dấu tick
            ),
          ),
          Positioned(
            right: 20,
            top: 15,
            child: GestureDetector(
              onTap: () {
                BuildContext? dialogContext = navigatorKey.currentContext ?? context;
                showDialog(
                  context: dialogContext,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Bo góc cho hộp thoại
                      ),
                      contentPadding: const EdgeInsets.all(16), // Căn chỉnh padding
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "Bạn có chắc chắn muốn xóa sản phẩm này?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey.shade300)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Nút "Hủy"
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop(); // Đóng hộp thoại
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all( // Thêm viền màu đen
                                        color: Colors.grey,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: const Text(
                                      "Hủy",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Nút "Đồng ý"
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {

                                    Navigator.of(context).pop(); 
                                    widget.cartBloc.add(RemoveProductClickedEvent(productId: widget.idObject));
                                    
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.red, // Màu đỏ cho nút Đồng ý
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      "Đồng ý",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/images/x_product.png',
                width: 10,
                height: 10,
              ),
            ),
          ),

          // Hình ảnh sản phẩm
          Positioned(
            left: 35,
            top: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: const Color(0xFFF2F2F2),
                child: Image.network(
                  widget.imageUrl ?? 'assets/images/notfoundimages.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Thông tin sản phẩm
          Positioned(
            left: 135,
            top: 15,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName ?? 'null',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.memory ?? ""}, ${widget.color ?? ""}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                // Text(
                //   '$formattedPrice',
                //   style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 13,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
              ],
            ),
          ),
           Positioned(
            left: 135,
            top: 80,
            child: SizedBox(
              width: 600,
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      '$formattedPrice',
                      style: TextStyle(
                       color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          // Nút tăng giảm số lượng
           Positioned(
            right: 20,
            top: 75,
            child: ValueListenableBuilder<int>(
              valueListenable: quantityNotifier,
              builder: (context, value, child) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      if (value > 1)
                        GestureDetector(
                          onTap: decrementQuantity,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '$value',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: incrementQuantity,
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    debounce?.cancel();
    quantityNotifier.dispose();
    super.dispose();
  }
}







