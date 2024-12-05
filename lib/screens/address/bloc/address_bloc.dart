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
       print('Da thanh cong toi day');
       print(isvisible);
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
}
