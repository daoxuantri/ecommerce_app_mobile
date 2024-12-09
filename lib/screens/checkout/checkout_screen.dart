import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/screens/checkout/bloc/checkout_bloc.dart';
import 'package:ecommerce_app_mobile/screens/checkout/components/body.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/components/cart_item.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/modelselected/selected_model.dart';
import 'package:ecommerce_app_mobile/screens/vnpay/vnpay_screen.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  static String routeName = "/check_out";

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CheckoutBloc checkoutBloc = CheckoutBloc();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final listSelectedProduct =
        ModalRoute.of(context)?.settings.arguments as List<SelectedProduct>;
    checkoutBloc.add(CheckoutInitialEvent());
    return BlocProvider(
      create: (context) => CheckoutBloc(),
      child: BlocConsumer<CheckoutBloc, CheckoutState>(
        bloc: checkoutBloc,
        listenWhen: (previous, current) => current is CheckoutActionState,
        buildWhen: (previous, current) => current is! CheckoutActionState,
        listener: (context, state) {
          if (state is VnPaymentClickedState) {
            Navigator.pushNamed(context, VNPayScreen.routeName,
                arguments: state.amount);
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CheckoutLoading:
              return const Center(
                child: LoadingScreen(),
              );
            case CheckoutLoaded:
              final loadedState = state as CheckoutLoaded;
              return Scaffold(
                appBar: buildAppBar(),
                body: CheckoutBody(
                  listSelectedProduct: listSelectedProduct,
                  addressDataModel: loadedState.address,
                ),
                bottomNavigationBar: buildBottomAppBar(),
              );
            case CheckoutError:
              final errorState = state as CheckoutError;
              return Scaffold(
                body: Center(child: Text(errorState.message)),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1.5,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded, size: 20),
        onPressed: () {
          CartItem.selectedProducts.clear();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const NavigatorBottomBarHome(
                  currentIndex: 2), // Giả sử giỏ hàng là chỉ số 2
            ),
          );
        },
      ),
      title: Text(
        'Xác nhận đơn hàng',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _calculateTotalPrice().toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  checkoutBloc.add(VnPaymentClickedEvent(
                      amount: _calculateTotalPricePayment()));
                },
                child: Text(
                  'Thanh toán',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(0, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _calculateTotalPrice() {
    double total = 0;
    for (var product in CartItem.selectedProducts) {
      total += product.price * product.quantity;
    }
    return NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(total);
  }

  int _calculateTotalPricePayment() {
    int total = 0;
    for (var product in CartItem.selectedProducts) {
      total += product.price * product.quantity;
    }
    return total; // Trả về giá trị tổng
  }
}
