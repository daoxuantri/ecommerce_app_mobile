// import 'dart:async';

// import 'package:bloc/bloc.dart';

// part 'product_event.dart';

// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc() : super(ProductInitial()) {
//     on<ProductInitialEvent>(productInitialEvent);
//     on<ProductPostClickedEvent>(productPostClickedEvent);
//     on<ProductTab1ClickedEvent>(productTab1ClickedEvent);
//     on<ProductTab2ClickedEvent>(productTab2ClickedEvent);
//     on<ProductSubInitialEvent>(productSubInitialEvent);
//     on<ProductClickedFavoriteEvent>(productClickedFavoriteEvent);
//     on<CreateOrderEvent>(createOrderEvent);
//     on<InitialOrderEvent>(initialOrderEvent);
//   }

//   Future<FutureOr<void>> productInitialEvent(
//       ProductInitialEvent event, Emitter<ProductState> emit) async {
//     emit(ProductLoadingState());
//     try {
//       ProductDataModel product =
//           await ApiServiceProducts().getDetailProduct(event.productId);

//       List<DemandDataModel> listDemand0 = await ApiServiceDemand()
//           .getListDemands(
//               type: 0,
//               status: 1,
//               vendorId: null,
//               productId: event.productId,
//               date: DateTime.now(),
//               needProductQuantity: 100,
//               ranks: RanksMoDel(ranks: [100, 90, 80, 70]),
//               sortPriceAsc: false);

//       List<DemandDataModel> listDemand1 = await ApiServiceDemand()
//           .getListDemands(
//               type: 1,
//               status: 1,
//               vendorId: null,
//               productId: event.productId,
//               date: DateTime.now(),
//               needProductQuantity: 100,
//               ranks: RanksMoDel(ranks: [100, 90, 80, 70]),
//               sortPriceAsc: false);

//       emit(ProductLoadedSuccessState(
//           product: product,
//           listDemand0: listDemand0,
//           listDemand1: listDemand1));
//     } catch (e) {
//       String failToken = e.toString();
//       if (failToken.startsWith('Exception: ')) {
//         failToken = failToken.substring('Exception: '.length);
//       }
//       emit(ProductErrorState(errorMessage: failToken));
//     }
//   }

//   FutureOr<void> productPostClickedEvent(
//       ProductPostClickedEvent event, Emitter<ProductState> emit) {
//     emit(ProductPostClickedActionState(product: event.product));
//   }

//   FutureOr<void> productTab1ClickedEvent(
//       ProductTab1ClickedEvent event, Emitter<ProductState> emit) {
//     emit(ProductTab1ClickedActionState());
//   }

//   FutureOr<void> productTab2ClickedEvent(
//       ProductTab2ClickedEvent event, Emitter<ProductState> emit) {
//     emit(ProductTab2ClickedActionState());
//   }

//   Future<FutureOr<void>> productSubInitialEvent(
//       ProductSubInitialEvent event, Emitter<ProductState> emit) async {
//     try {
//       bool check = await CheckSubscribe().checkSubscribe(event.productId);
//       emit(ProductSubSuccess(check: check));
//     } catch (e) {
//       print(e);
//       emit(ProductSubSuccess(check: false));
//     }
//   }

//   Future<FutureOr<void>> productClickedFavoriteEvent(
//       ProductClickedFavoriteEvent event, Emitter<ProductState> emit) async {
//     if (event.check) {
//       try {
//         await ApiServiceProducts().unsubscribeProduct(event.productId);
//         emit(ProductSubSuccess(check: false));
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       try {
//         await ApiServiceProducts().subscribeProduct(event.productId);
//         emit(ProductSubSuccess(check: true));
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   Future<FutureOr<void>> createOrderEvent(
//       CreateOrderEvent event, Emitter<ProductState> emit) async {
//     try {
//       await ApiServiceOrders().createOrder(
//           event.demandId,
//           event.productQuantity,
//           event.transportMethod,
//           event.requireDeliveryTimeTo);
//       emit(CreateOrderActionState());
//     } catch (e) {
//       print(e);
//       emit(CreateOrderErrorActionState(message: e.toString()));
//     }
//   }

//   Future<FutureOr<void>> initialOrderEvent(
//       InitialOrderEvent event, Emitter<ProductState> emit) async {
//     try {
//       List<VendorShippingAddressData> response =
//           await ApiServiceVendors().getVendorShippingAddress();
//       VendorShippingAddressData? address = null;
//       if (response.isNotEmpty) {
//         address = response.firstWhere((element) => element.isDefault == true);
//       }

//       emit(InitialOrderActionState(address: address));
//     } catch (e) {
//       print(e);
//       emit(ProductErrorState(errorMessage: "Tạo đơn hàng không thành công!"));
//     }
//   }
// }
