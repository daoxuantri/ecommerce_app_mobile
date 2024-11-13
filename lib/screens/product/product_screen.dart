// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart'; 
// import 'bloc/product_bloc.dart';

// class ProductScreen extends StatefulWidget {
//   static String routeName = "/product";

//   const ProductScreen({super.key});

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   final ProductBloc productBloc = ProductBloc();

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     final productId = ModalRoute.of(context)?.settings.arguments as String;
//     productBloc.add(ProductInitialEvent(productId: productId));
//     return BlocProvider(
//       create: (context) => ProductBloc(),
//       child: BlocConsumer<ProductBloc, ProductState>(
//         bloc: productBloc,
//         listenWhen: (previous, current) => current is ProductActionState,
//         buildWhen: (previous, current) => current is! ProductActionState,
//         listener: (context, state) {
//           if (state is ProductPostClickedActionState) {
//             // Navigator.pushNamed(context, DemandScreen.routeName,
//             //     arguments: state.product);
//           }
//         },
//         builder: (context, state) {
//           switch (state.runtimeType) {
//             case ProductLoadingState:
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             case ProductLoadedSuccessState:
//               final successState = state as ProductLoadedSuccessState;
//               return Scaffold(
//                 // body: BodySuccess(
//                 //   product: successState.product,
//                 //   listDemand0: successState.listDemand0,
//                 //   listDemand1: successState.listDemand1,
//                 // ),
//               );
//             case ProductErrorState:
//               final errorState = state as ProductErrorState;
//               return Scaffold(
//                 body: Center(child: Text(errorState.errorMessage)),
//               );
//             default:
//               return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
