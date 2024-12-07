import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/user_signin.dart';  
import 'package:flutter/material.dart';

part 'vnpay_event.dart';
part 'vnpay_state.dart';

class VNPayBloc extends Bloc<VNPayEvent, VNPayState> {
  VNPayBloc() : super(VNPayInitial()) {
    on<VNPayInitialEvent>(vnPayInitialEvent);
  }

  Future<FutureOr<void>> vnPayInitialEvent(
      VNPayInitialEvent event, Emitter<VNPayState> emit) async {
    emit(VNPayLoadingState());
    try {
      String? url = await ApiServiceUsers().getVNPay(event.amount);
      emit(VNPayLoadedSuccessState(url: url));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(VNPayErrorState(errorMessage: failToken));
    }
  }
}