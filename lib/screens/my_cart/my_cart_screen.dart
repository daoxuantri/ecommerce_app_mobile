// import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
// import 'package:ecommerce_app_mobile/screens/my_cart/bloc/cart_bloc.dart';
// import 'package:ecommerce_app_mobile/screens/my_cart/components/cart_item.dart';
// import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// class MyCartScreen extends StatefulWidget {
//   const MyCartScreen({super.key});
//   static String routeName ="/my_cart";

//   @override
//   State<MyCartScreen> createState() => _MyCartScreenState();
// }

// class _MyCartScreenState extends State<MyCartScreen> {
//   late final String? id;
//   final CartBloc cartBloc = CartBloc();

//   @override
//   void initState() {
//     loadDataAndInitializeBloc();
//     super.initState();
    
//   }

//   Future<void> loadDataAndInitializeBloc() async {
//     id = await UserSecurityStorage.getId();
//     setState(() {
//       cartBloc.add(CartInitialEvent(userId: id!));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return BlocConsumer<CartBloc, CartState>(
//       bloc: cartBloc,
//       listenWhen: (previous, current) => current is CartActionState,
//       buildWhen: (previous, current) => current is! CartActionState,
//       listener: (context, state) {
//         if (state is RemoveAllProductClickedState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBarLoginSuccess('Xóa thành công'),);
//           initState();
//         }
//       },
//       builder: (context, state) {
//         switch (state.runtimeType) {
//           case CartLoadingState:
//             return Center(child: const CircularProgressIndicator());
//           case CartLoadedSuccessState:
//             final successState = state as CartLoadedSuccessState; 
//             return Scaffold(
//               appBar: buildAppBar(),
//               bottomNavigationBar: buildBottomAppBar(),
//               body: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: successState.listproduct?.length,
//                       itemBuilder: (context, index) { 
//                         return CartItem(
//                           productName: successState.listproduct?[index].name,
//                           price: successState.listproduct?[index].price,
//                           imageUrl: (successState.listproduct?[index].images?.isNotEmpty ?? false)
//                                     ? successState.listproduct![index].images!
//                                     : 'assets/images/notfoundimages.jpg',
//                           initialQuantity: successState.listproduct?[index].quantity,
//                         );
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Tổng tiền:",
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             "${successState.mycart.total}₫",
//                             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // cartBloc.add(CartCheckoutEvent());
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
//                       ),
//                       child: const Text("Tiếp tục"),
//                     ),
//                   ],
//                 ),
//               ),
//             );

//             case  CartErrorState:
//               return Center(child: Text('looix'));
//             default:
//               return const SizedBox();
//       }
//       }
//     );
//   }



//   AppBar buildAppBar() {
//   return AppBar(
//     automaticallyImplyLeading: false, // Tắt tự động hiển thị nút quay lại của AppBar
//     elevation: 1.5,
//     title: const Text("Giỏ hàng",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
//     centerTitle: true,
//     actions: [
//       Row(
//         children: [
//           IconButton(
//             icon: Image.asset('assets/images/recycle_bin.png',width: 20,scale: 20,), // Biểu tượng Home
//             onPressed: () {
//               // Gọi hộp thoại xác nhận
//               showDialog(
//                 context: navigatorKey.currentContext!,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: const Text("Xác nhận"),
//                     content: const Text("Bạn có chắc chắn muốn xóa tất cả sản phẩm trong giỏ hàng không?"),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Text("Hủy"),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(); 
//                           //them su kien vao
//                           cartBloc.add(RemoveAllProductClickedEvent(userId: id));

//                         },
//                         child: const Text("Đồng ý"),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
          
//         ],
//       ),
//     ],
//   );
// }
// Widget buildBottomAppBar() {
//     return BottomAppBar(
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Add to cart action
//                 cartBloc.add(RemoveAllProductClickedEvent(userId: id));
//               },
//               child: Text('Tổng tiền: '),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Buy now action
//               },
//               child: Text('Tiếp tục'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),
     
//     );
//   }
// }




import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/components/list_product_cart.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});
  static String routeName ="/my_cart";

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late final String? id;
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    loadDataAndInitializeBloc();
    super.initState();
    
  }

  Future<void> loadDataAndInitializeBloc() async {
    id = await UserSecurityStorage.getId();
    setState(() {
      cartBloc.add(CartInitialEvent(userId: id!));
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is RemoveAllProductClickedState) {
          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarLoginSuccess('Xóa thành công'),);
          setState(() {
            cartBloc.add(CartInitialEvent(userId: id!));
          });
        }
        if(state is RemoveProductClickedState){
          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarLoginSuccess('Cập nhật thành công'),);
          setState(() {
            cartBloc.add(CartInitialEvent(userId: id!));
          });
        }
        if(state is UpdateProductQuantityState){
          setState(() {
            cartBloc.add(CartInitialEvent(userId: id!));
          });
        }
      },
      builder: (context, state) {
  switch (state.runtimeType) {
    case CartLoadingState:
      return const Center(child: CircularProgressIndicator());
    case CartLoadedSuccessState:
      final successState = state as CartLoadedSuccessState;
      final String formattedPrice =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(successState.mycart.total ?? 0);
      if (successState.listproduct == null || successState.listproduct!.isEmpty) {
      return const Center(child: Text('Mua hàng đi'));
      }
      return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomAppBar(formattedPrice),
        body: ListProductCart(
          cartBloc: cartBloc,
          listproduct: successState.listproduct,
          total: successState.mycart.total,
        ),
      );
    case CartErrorState:
      return const Center(child: Text('Lỗi'));
    default:
      return const SizedBox();
  }
}
    );
  }



  AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false, // Tắt tự động hiển thị nút quay lại của AppBar
    elevation: 1.5,
    title: const Text("Giỏ hàng",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
    centerTitle: true,
    actions: [
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/images/recycle_bin.png',width: 20,scale: 20,), // Biểu tượng Home
            onPressed: () {
              // Gọi hộp thoại xác nhận
              showDialog(
                context: navigatorKey.currentContext!,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Xác nhận"),
                    content: const Text("Bạn có chắc chắn muốn xóa tất cả sản phẩm trong giỏ hàng không?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Hủy"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); 
                          //them su kien vao
                          cartBloc.add(RemoveAllProductClickedEvent(userId: id));

                        },
                        child: const Text("Đồng ý"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          
        ],
      ),
    ],
  );
}
Widget buildBottomAppBar(String formattedPrice) {
    return BottomAppBar(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$formattedPrice',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.red),),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  },
                  child: Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(150),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                    color: Colors.red, // Màu đỏ cho nút Đồng ý
                    borderRadius: BorderRadius.circular(8),
                   ),
                   child: const Text(
                    "Tiếp tục",
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    ),
                    ),),),
          ],
        ),
      ),
     
    );
  }
}


