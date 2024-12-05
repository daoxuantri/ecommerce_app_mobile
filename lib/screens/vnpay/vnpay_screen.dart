import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VNPayScreen extends StatefulWidget {
  const VNPayScreen({super.key});
  static String routeName = "/vnpay";

  @override
  State<VNPayScreen> createState() => _VNPayScreenState();
}

class _VNPayScreenState extends State<VNPayScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the WebView if needed
    // Ensure that the WebView is initialized properly
    WebView.platform = SurfaceAndroidWebView(); // This line can be removed if not needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VNPay Payment'),
      ),
      body: WebView(
        initialUrl: 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=10000000&vnp_Command=pay&vnp_CreateDate=20241204210356&vnp_CurrCode=VND&vnp_IpAddr=%3A%3Affff%3A127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh+toan+cho+ma+GD%3A04210356&vnp_OrderType=other&vnp_ReturnUrl=http%3A%2F%2F127.0.0.1%3A8888%2Forder%2Fvnpay_return&vnp_TmnCode=R1AXOU2T&vnp_TxnRef=04210356&vnp_Version=2.1.0&vnp_SecureHash=5444a0578d88e08cdbb95324fc1c3c4c8691e86b378b977ee6d55108a7e7b61ece9781c82544db5d515a405fb7681ade6e8e70b93da5f57c3b5aa01bf1c53a7e',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}