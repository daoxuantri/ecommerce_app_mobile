
import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/components/default_button.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/components/cart_item.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/components/list_product_cart.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/modelselected/selected_model.dart';
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
          Navigator.pushNamed(context, NavigatorBottomBarHome.routeName , arguments: 0);
        }
        if(state is RemoveProductClickedState){
          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarLoginSuccess('Cập nhật thành công'),);
          setState(() {
            cartBloc.add(CartInitialEvent(userId: id!));
          });
        }
        if(state is ConfirmOrderClickedState){
          Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => CheckoutScreen(),
    settings: RouteSettings(arguments: CartItem.selectedProducts),
  ),
);
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
      return LoadingScreen();
    case CartLoadedSuccessState:
      final successState = state as CartLoadedSuccessState;
      final String formattedPrice =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(successState.mycart.total ?? 0);
      if (successState.listproduct == null || successState.listproduct!.isEmpty) {
        return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, 
          elevation: 1.5,
          title: const Text("Giỏ hàng",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/cart_emtity.png'),
              Text('Bạn chưa có sản phẩm nào trong giỏ'),
              SizedBox(height: getProportionateScreenHeight(10),),
              Container(
                width: 200,
                height: 40,
                  child: DefaultButton(
                    text: 'Mua sắm ngay',
                    press: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const NavigatorBottomBarHome(currentIndex: 0),  
                        ),
                      );
                    },
                  )
                ), 

            ],
          ),
        ),
      );
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
                            "Bạn có chắc chắn muốn xóa tất cả sản phẩm này?",
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
                                    cartBloc.add(RemoveAllProductClickedEvent());
                                     Navigator.of(context).pop();
                                    
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
                  if (CartItem.selectedProducts.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vui lòng chọn ít nhất một sản phẩm để thanh toán.')),
                    );
                    return; // Không chuyển đến Checkout nếu không có sản phẩm nào được chọn
                  }
                  Navigator.of(context).pop();
                  cartBloc.add(ConfirmOrderClickedEvent(listproductcart: CartItem.selectedProducts));

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


