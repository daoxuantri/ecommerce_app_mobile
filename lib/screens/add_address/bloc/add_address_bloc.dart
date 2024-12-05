import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/address.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart'; 
import '../add_address_screen.dart';
import 'add_address_event.dart';
import 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(AddAddressInitial()) {
    on<AddAddressInitialEvent>(addAddressInitialEvent);
    on<AddAddressButtonClickEvent>(addAddressButtonClickEvent);
    on<AddAddressCheckInputEvent>(addAddressCheckInputEvent);
    on<AddAddressAfterSeclectedCityEvent>(addAddressAfterSeclectedCityEvent);
    on<AddAddressAfterSeclectedDistrictEvent>(
        addAddressAfterSeclectedDistrictEvent);
    on<AddAddressButtonClickErrorEvent>(addAddressButtonClickErrorEvent);
    on<ChooseAddressEvent>(chooseAddressEvent);
  }

  Future<FutureOr<void>> addAddressInitialEvent(
      AddAddressInitialEvent event, Emitter<AddAddressState> emit) async {
    emit(AddAddressLoading());
    try {
      //get city
      List<CitiData> cityDataResponse = await ApiServiceAddress.getCities();
      emit(AddAddressLoaded(listCity: cityDataResponse));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddAddressError(errMessage: failToken));
    }
  }

  Future<FutureOr<void>> addAddressButtonClickEvent(
      AddAddressButtonClickEvent event, Emitter<AddAddressState> emit) async {
    try {
      // AddVendorAddressResponse response =
      //     await ApiServiceVendors.addVendorAddress(
      //         event.name,
      //         event.phone,
      //         event.addressCountryId,
      //         event.addressCityId,
      //         event.addressDistrictId,
      //         event.addressWardId,
      //         event.addressStreet);
      // Map<String, VendorShippingAddressData> addressInf = {event.category.toString():response.data!};
      // if (response.success == true) {
      //   emit(AddAddressButtonClickActionState(addressInf: addressInf));
      // }
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddAddressError(errMessage: failToken));
    }
  }

  FutureOr<void> addAddressCheckInputEvent(
      AddAddressCheckInputEvent event, Emitter<AddAddressState> emit) {
    if (event.position == 0) {
      if (AddAddressScreen.cityName.provinceId == '0') {
        event.checkErr[0] = 1;
      } else
        event.checkErr[0] = 2;
    }
    if (event.position == 1) {
      if (AddAddressScreen.districtName.districtId == '0') {
        event.checkErr[1] = 1;
      } else
        event.checkErr[1] = 2;
    }
    if (event.position == 2) {
      if (AddAddressScreen.wardName.wardId == '0') {
        event.checkErr[2] = 1;
      } else
        event.checkErr[2] = 2;
    }
    if (event.position == 3) {
      if (AddAddressScreen.address.length <= 0) {
        event.checkErr[3] = 1;
      } else
        event.checkErr[3] = 2;
    }
    if (event.position == 4) {
      if (AddAddressScreen.receiverName.length <= 0) {
        event.checkErr[4] = 1;
      } else
        event.checkErr[4] = 2;
    }
    if (event.position == 5) {
      if (AddAddressScreen.phoneNumber.length <= 0 ||
          AddAddressScreen.phoneNumber.length > 11) {
        event.checkErr[5] = 1;
      } else
        event.checkErr[5] = 2;
    }


    emit(AddAddressCheckInputActionState(event.checkErr));
  }

  Future<FutureOr<void>> addAddressAfterSeclectedCityEvent(
      AddAddressAfterSeclectedCityEvent event,
      Emitter<AddAddressState> emit) async {
    //Get Dicstrict
    try {
      List<DistrictData> districtsDataResponse =
          await ApiServiceAddress.getDistricts(event.cityID);

      emit(AddAddressAfterSelectedCityState(
          listDistrict: districtsDataResponse));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddAddressError(errMessage: failToken));
    }
  }

  Future<FutureOr<void>> addAddressAfterSeclectedDistrictEvent(
      AddAddressAfterSeclectedDistrictEvent event,
      Emitter<AddAddressState> emit) async {
    //Get Ward
    try {
      List<WardData> wardsDataResponse =
          await ApiServiceAddress.getWards(event.districtID);

      emit(AddAddressAfterSelectedDistrictState(listWard: wardsDataResponse));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddAddressError(errMessage: failToken));
    }
  }

  FutureOr<void> addAddressButtonClickErrorEvent(
      AddAddressButtonClickErrorEvent event, Emitter<AddAddressState> emit) {
    emit(AddAddressButtonClickErrorActionState());
  }

  FutureOr<void> chooseAddressEvent(
      ChooseAddressEvent event, Emitter<AddAddressState> emit) {
    try{
      emit(ChooseAddressActionState());
    }catch(e){
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddAddressError(errMessage: failToken));
    }

  }
}
