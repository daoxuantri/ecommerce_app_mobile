import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/address.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import '../chooseAddressScreen.dart';
import 'choose_address_event.dart';
import 'choose_address_state.dart';

class ChooseAddressBloc extends Bloc<ChooseAddressEvent, ChooseAddressState> {
  ChooseAddressBloc() : super(ChooseAddressInitial()) {
    on<ChooseAddressInitialEvent>(chooseAddressInitialEvent);
    on<ChooseAddressAfterSeclectedCityEvent>(
        chooseAddressAfterSeclectedCityEvent);
    on<ChooseAddressAfterSeclectedDistrictEvent>(
        chooseAddressAfterSeclectedDistrictEvent);
    on<ChooseAddressButtonClickErrorEvent>(chooseAddressButtonClickErrorEvent);
    on<ChooseAddressCheckInputEvent>(chooseAddressCheckInputEvent);
    on<ChooseAddressButtonClickEvent>(chooseAddressButtonClickEvent);
  }

  Future<FutureOr<void>> chooseAddressInitialEvent(
      ChooseAddressInitialEvent event, Emitter<ChooseAddressState> emit) async {
    emit(ChooseAddressLoading());
    try {
      //get City
      List<CitiData> cityDataResponse = await ApiServiceAddress.getCities();
      emit(ChooseAddressLoaded(listCity: cityDataResponse));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ChooseAddressError(errMessage: failToken));
    }
  }

  Future<FutureOr<void>> chooseAddressAfterSeclectedCityEvent(
      ChooseAddressAfterSeclectedCityEvent event,
      Emitter<ChooseAddressState> emit) async {
    //Get Dicstrict
    try {
      List<DistrictData> districtsDataResponse =
          await ApiServiceAddress.getDistricts(event.cityID);

      // districtsDataResponse.forEach((element) {
      //   print(element.name);
      // });
      emit(ChooseAddressAfterSelectedCityState(
          listDistrict: districtsDataResponse));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ChooseAddressError(errMessage: failToken));
    }
  }

  Future<FutureOr<void>> chooseAddressAfterSeclectedDistrictEvent(
      ChooseAddressAfterSeclectedDistrictEvent event,
      Emitter<ChooseAddressState> emit) async {
    //Get Ward
    try {
      List<WardData> wardsDataResponse =
          await ApiServiceAddress.getWards(event.districtID);

      emit(
          ChooseAddressAfterSelectedDistrictState(listWard: wardsDataResponse));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ChooseAddressError(errMessage: failToken));
    }
  }

  FutureOr<void> chooseAddressButtonClickErrorEvent(
      ChooseAddressButtonClickErrorEvent event,
      Emitter<ChooseAddressState> emit) {
    try {
      emit(ChooseAddressButtonClickErrorActionState());
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ChooseAddressError(errMessage: failToken));
    }
  }

  FutureOr<void> chooseAddressCheckInputEvent(
      ChooseAddressCheckInputEvent event, Emitter<ChooseAddressState> emit) {
    try {
      if (event.position == 0) {
        if (ChooseAddressScreen.cityName.provinceId == '0') {
          event.checkErr[0] = 1;
        } else
          event.checkErr[0] = 2;
      }
      if (event.position == 1) {
        if (ChooseAddressScreen.districtName.districtId == '0') {
          event.checkErr[1] = 1;
        } else
          event.checkErr[1] = 2;
      }
      if (event.position == 2) {
        if (ChooseAddressScreen.wardName.wardId == '0') {
          event.checkErr[2] = 1;
        } else
          event.checkErr[2] = 2;
      }
      emit(ChooseAddressCheckInputActionState(event.checkErr));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ChooseAddressError(errMessage: failToken));
    }
  }

  FutureOr<void> chooseAddressButtonClickEvent(
      ChooseAddressButtonClickEvent event, Emitter<ChooseAddressState> emit) {
    try {
      List<String> listAddress = [
        event.addressCityId,
        event.addressDistrictId,
        event.addressWardId,
        event.addressCityName,
        event.addressDistrictName,
        event.addressWardName
      ];
      emit(ChooseAddressButtonClickActionState(listAddress: listAddress));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ChooseAddressError(errMessage: failToken));
    }
  }
}
