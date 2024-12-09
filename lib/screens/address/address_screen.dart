import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/screens/add_address/add_address_screen.dart';
import 'package:ecommerce_app_mobile/screens/address/components/body.dart';
import 'package:ecommerce_app_mobile/screens/address/components/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'bloc/address_bloc.dart';
import 'bloc/address_event.dart';
import 'bloc/address_state.dart';

class AddressScreen extends StatefulWidget {
  static String routeName = "/address";

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final AddressBloc addressBloc = AddressBloc();
  late bool isvisible;

  List<AddressDataModel> listAddressInf = [];

  @override
  void initState() {
    addressBloc.add(AddressInitialEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      bloc: addressBloc,
      listenWhen: (previous, current) => current is AddressActionState,
      buildWhen: (previous, current) => current is! AddressActionState,
      listener: (context, state) async {
        if (state is AddressButtonClickState) {
          AddressDataModel? returnedData =
          await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAddressScreen()),);
          if (returnedData != null) {
            setState(() {
              addressBloc.add(AddressInitialEvent());
            });
          }
        }else if (state is AddressRemoveClickState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginSuccess('Cập nhật thành công'),
          );
          setState(() {
            addressBloc.add(AddressInitialEvent());
          });

        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AddressLoading:
            return const Center(
              child: LoadingScreen(),
            );
          case AddressLoaded:
            final successState = state as AddressLoaded;
            listAddressInf = successState.listAddressInf;
            isvisible = successState.isvisible;
            return Scaffold(
              appBar: AddressHeader(),
              body: AddressBody(
                addressBloc: addressBloc,
                listAddressInf: listAddressInf,
                isvisible: isvisible,
              ),
            );
          case AddressError:
            final errorState = state as AddressError;
            return Scaffold(
              body: Center(
                child: Text(errorState.errMessage),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
