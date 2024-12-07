import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:ecommerce_app_mobile/screens/add_address/bloc/add_address_bloc.dart';
import 'package:ecommerce_app_mobile/screens/add_address/bloc/add_address_state.dart';
import 'package:ecommerce_app_mobile/screens/add_address/components/body.dart';
import 'package:ecommerce_app_mobile/screens/address/address_screen.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/add_address_event.dart';

class AddAddressScreen extends StatefulWidget {
  static String routeName = "/addAddress";

  const AddAddressScreen({super.key});

  static CitiData cityName = CitiData();
  static DistrictData districtName = DistrictData();
  static WardData wardName = WardData();
  static String address = '';
  static String receiverName = '';
  static String phoneNumber = '';

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final AddAddressBloc addAddressBloc = AddAddressBloc();

  List<int> checkErr = [0, 0, 0, 0, 0, 0];
  List<DistrictData> listDistrict = [DistrictData(districtId: '0', districtName: 'Chọn huyện')];
  List<WardData> listWard = [WardData(wardId: '0', wardName: 'Chọn xã')];

  @override
  void initState() {
    addAddressBloc.add(AddAddressInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AddAddressBloc, AddAddressState>(
      bloc: addAddressBloc,
      listenWhen: (previous, current) => current is AddAddressActionState,
      buildWhen: (previous, current) => current is! AddAddressActionState,
      listener: (context, state) {
        if (state is AddAddressButtonClickActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thêm thêm địa chỉ thành công!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const NavigatorBottomBarHome(currentIndex: 4),  
                        ),
                      );
        } else if (state is AddAddressCheckInputActionState) {
          setState(() {
            checkErr = state.err;
          });
        } else if (state is AddAddressAfterSelectedCityState) {
          var firstElement = listDistrict[0]; // Lưu giữ phần tử đầu
          listDistrict.clear(); // Xóa toàn bộ phần tử trong danh sách
          listDistrict.add(firstElement);
          setState(() {
            listDistrict.addAll(state.listDistrict);
          });
        } else if (state is AddAddressAfterSelectedDistrictState) {
          var firstElement = listWard[0]; // Lưu giữ phần tử đầu
          listWard.clear(); // Xóa toàn bộ phần tử trong danh sách
          listWard.add(firstElement);
          setState(() {
            listWard.addAll(state.listWard);
          });
        } else if (state is AddAddressButtonClickErrorActionState) {
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
          case AddAddressLoading:
            return const Center(
              child: LoadingScreen(),
            );
          case AddAddressLoaded:
            final successState = state as AddAddressLoaded;
            return Scaffold(
                appBar: AppBar(
                  title:  Text(
                      "Thêm địa chỉ mới",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  centerTitle: true,
                ),
                body: AddAddressBody(
                  addAddressBloc: addAddressBloc,
                  checkErr: checkErr,
                  listCity: successState.listCity,
                  listDistrict: listDistrict,
                  listWard: listWard,
                ),
              );
          case AddAddressError:
            final errorState = state as AddAddressError;
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
