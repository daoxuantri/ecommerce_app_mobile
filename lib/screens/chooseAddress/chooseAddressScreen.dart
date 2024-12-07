import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/choose_address_bloc.dart';
import 'bloc/choose_address_event.dart';
import 'bloc/choose_address_state.dart';
import 'components/chooseAddressBody.dart';

class ChooseAddressScreen extends StatefulWidget {
  const ChooseAddressScreen({super.key});

  static CitiData cityName = CitiData();
  static DistrictData districtName = DistrictData();
  static WardData wardName = WardData();
  static String address = '';
  static String receiverName = '';
  static String phoneNumber = '';

  @override
  State<ChooseAddressScreen> createState() => _ChooseAddressScreenState();
}

class _ChooseAddressScreenState extends State<ChooseAddressScreen> {
  final ChooseAddressBloc chooseAddressBloc = ChooseAddressBloc();

  List<int> checkErr = [0, 0, 0];
  List<DistrictData> listDistrict = [DistrictData(districtId: '0' , districtName: 'Chọn huyện')];
  List<WardData> listWard = [WardData(wardId: '0', wardName: 'Chọn xã')];

  @override
  void initState() {
    chooseAddressBloc.add(ChooseAddressInitialEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<ChooseAddressBloc, ChooseAddressState>(
      bloc: chooseAddressBloc,
      listenWhen: (previous, current) => current is ChooseAddressActionState,
      buildWhen: (previous, current) => current is! ChooseAddressActionState,
      listener: (context, state) {
        if (state is ChooseAddressButtonClickActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Chọn địa chỉ thành công!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, state.listAddress);
        }
        else if (state is ChooseAddressAfterSelectedCityState) {
          var firstElement = listDistrict[0]; // Lưu giữ phần tử đầu
          listDistrict.clear(); // Xóa toàn bộ phần tử trong danh sách
          listDistrict.add(firstElement);
          setState(() {
            listDistrict.addAll(state.listDistrict);
          });
        } else if (state is ChooseAddressAfterSelectedDistrictState) {
          var firstElement = listWard[0]; // Lưu giữ phần tử đầu
          listWard.clear(); // Xóa toàn bộ phần tử trong danh sách
          listWard.add(firstElement);
          setState(() {
            listWard.addAll(state.listWard);
          });
        } else if (state is ChooseAddressButtonClickErrorActionState) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Thêm địa chỉ thất bại! Vui lòng kiểm tra lại thông tin!'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ChooseAddressLoading:
            return const Center(
              child: LoadingScreen(),
            );
          case ChooseAddressLoaded:
            final successState = state as ChooseAddressLoaded;
            return SafeArea(
              child: Scaffold(
                body: ChooseAddressBody(
                  chooseAddressBloc: chooseAddressBloc,
                  listCity: successState.listCity,
                  listDistrict: listDistrict,
                  listWard: listWard,
                ),
              ),
            );
          case ChooseAddressError:
            final errorState = state as ChooseAddressError;
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
