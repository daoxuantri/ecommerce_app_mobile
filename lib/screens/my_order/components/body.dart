import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/my_order/bloc/my_order_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_order/components/order_transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyOrderBody extends StatelessWidget {
  const MyOrderBody({Key? key, required this.myOrderBloc}) : super(key: key);

  final MyOrderBloc myOrderBloc;

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
        // ],
      ),
      body: OrderTransaction(
        myOrderBloc: myOrderBloc,
      ), // Đây là nơi bọc widget OrderTransaction
    );
  }
}
