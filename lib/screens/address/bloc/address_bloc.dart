import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/user_signin.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart'; 
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitialState()) {
    on<AddressInitialEvent>(addressInitialEvent);
    on<AddressButtonClickEvent>(addressButtonClickEvent);
    on<AddressRemoveClickEvent>(addressRemoveClickEvent);
    on<AddressSetDefaultClickedEvent>(addressSetDefaultClickedEvent);
   
  }

  Future<FutureOr<void>> addressInitialEvent(
      AddressInitialEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoading());
    try {
      List<AddressDataModel> response = await ApiServiceUsers().getAllAddressShipping();
      bool isvisible;
      if(response.length == 0){
        isvisible = true;
      }
      else{
        isvisible = false;
      }
      emit(AddressLoaded(listAddressInf: response, isvisible: isvisible));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddressError(errMessage: failToken));
    }
  }

  FutureOr<void> addressButtonClickEvent(
      AddressButtonClickEvent event, Emitter<AddressState> emit) {
    emit(AddressButtonClickState());
  }

  Future<FutureOr<void>> addressSetDefaultClickedEvent(
      AddressSetDefaultClickedEvent event, Emitter<AddressState> emit) async {
        try {
      String? response = await ApiServiceUsers().setDefaultAddressShiping(event.idAddress);
      emit(AddressRemoveClickState(errMessage: response!));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddressError(errMessage: failToken));
    }
    
  }

  Future<FutureOr<void>> addressRemoveClickEvent(
      AddressRemoveClickEvent event, Emitter<AddressState> emit) async {
        try {
      String? response = await ApiServiceUsers().addressRemoveAddressByUser(event.idAddress);
      emit(AddressRemoveClickState(errMessage: response!));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(AddressError(errMessage: failToken));
    }
    
  }


   


  

}
