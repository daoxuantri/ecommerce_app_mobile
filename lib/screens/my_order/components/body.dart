import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/my_order/bloc/my_order_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_order/components/order_transaction.dart';
import 'package:flutter/material.dart';

class MyOrderBody extends StatefulWidget {
  const MyOrderBody({Key? key, required this.myOrderBloc}) : super(key: key);

  final MyOrderBloc myOrderBloc;

  @override
  _MyOrderBodyState createState() => _MyOrderBodyState();
}

class _MyOrderBodyState extends State<MyOrderBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colorWhite,
        title: Text(
          'Đơn hàng của tôi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: OrderTransaction(
              myOrderBloc: widget.myOrderBloc, // Sử dụng widget.myOrderBloc
            ),
          ),
        ],
      ),
    );
  }
}