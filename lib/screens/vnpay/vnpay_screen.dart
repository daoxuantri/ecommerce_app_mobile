import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/screens/vnpay/bloc/vnpay_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VNPayScreen extends StatefulWidget {
  const VNPayScreen({super.key});
  static String routeName = "/vnpay";

  @override
  State<VNPayScreen> createState() => _VNPayScreenState();
}

class _VNPayScreenState extends State<VNPayScreen> {
  late WebViewController _controller;
  final VNPayBloc vnPayBloc = VNPayBloc();
  

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView(); 
  }

  @override
  Widget build(BuildContext context) {
    final int  amount = ModalRoute.of(context)!.settings.arguments as int;
    vnPayBloc.add(VNPayInitialEvent(amount: amount ));
    return BlocConsumer<VNPayBloc, VNPayState>(
      bloc: vnPayBloc,
      listenWhen: (previous, current) => current is VNPayActionState,
      buildWhen: (previous, current) => current is !VNPayActionState,
       listener: (context, state) {
       
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case VNPayLoadingState:
            return LoadingScreen();
          case VNPayLoadedSuccessState:
            final successState = state as VNPayLoadedSuccessState;
           return  Scaffold(
            appBar: AppBar(
              title: const Text('VNPay Payment', style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
              centerTitle: true,
            ),
            body: WebView(
              initialUrl: successState.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },
            ),
          );
          case VNPayErrorState:
            return const Center(child: Text('Lỗi'));
          default:
            return const SizedBox();
        }
      });
  }
}




// Scaffold(
//       appBar: AppBar(
//         title: const Text('VNPay Payment'),
//       ),
//       body: WebView(
//         initialUrl: '',
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController;
//         },
//       ),
//     );