import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/my_order/bloc/my_order_bloc.dart';
import 'package:ecommerce_app_mobile/screens/my_order/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyOrdersScreen extends StatefulWidget {
  static String routeName = "/my_orders";

  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreensState();
}

class _MyOrdersScreensState extends State<MyOrdersScreen> {
  final MyOrderBloc myOrderBloc = MyOrderBloc();
  @override
  void initState() {
    myOrderBloc.add(MyOrderInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrderBloc,MyOrderState>(
      bloc: myOrderBloc,
      listenWhen: (previous, current) => current is MyOrderActionState,
      buildWhen: (previous, current) => current is! MyOrderActionState,
      listener: (context, state) {
        if (state is CancelOrderClickedState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginSuccess(state.message!),
          );
          setState(() {
            myOrderBloc.add(MyOrderInitialEvent());
          });
        }
      },
      builder: (context, state) {
        switch (state.runtimeType){
          case MyOrderLoading:
            return const Center(child: CircularProgressIndicator());
          case MyOrderLoaded:
            final loadedState = state as MyOrderLoaded;
            return MyOrderBody(
              //orderList: loadedState.orderList,
              myOrderBloc: myOrderBloc,
            );
          case MyOrderError:
            final errorState = state as MyOrderError;
            return Center(
              child: Text(errorState.message),
            );
          default:
            return const Center(
              child: Text("My Order Default"),
            );
        }
      },
    );
  }
}
