import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/product/components/body_success.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = "/product";

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductBloc productBloc = ProductBloc();
  String? selectedMemory; 
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    productBloc.add(ProductInitialEvent(productId: productId));
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: BlocConsumer<ProductBloc, ProductState>(
        bloc: productBloc,
        listenWhen: (previous, current) => current is ProductActionState,
        buildWhen: (previous, current) => current is! ProductActionState,
        listener: (context, state)  {
          if (state is ProductPostClickedActionState) {
            // Navigator.pushNamed(context, DemandScreen.routeName,
            //     arguments: state.product);
          }
          if(state is AddProductToCartState){
              ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarLoginSuccess('Đã thêm vào giỏ hàng'),);
                          setState(() {
            productBloc.add(ProductInitialEvent(productId: productId));
            
          });
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductLoadingState:
              return const Center(
                child: LoadingScreen(),
              );
            case ProductLoadedSuccessState:
              final successState = state as ProductLoadedSuccessState;
              return Scaffold(
                appBar: buildAppBar(),
                body: BodySuccess(
                  productDetail: successState.product,
                  // listallproduct: successState.listproduct
                  onMemorySelected: (memory) {
                    setState(() {
                      selectedMemory = memory; 
                    });
                  },
                  onColorSelected: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
                bottomNavigationBar: buildBottomAppBar(productId),
              );
            case ProductErrorState:
              final errorState = state as ProductErrorState;
              return Scaffold(
                body: Center(child: Text(errorState.errorMessage)),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }

  AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false, // Tắt tự động hiển thị nút quay lại của AppBar
    elevation: 1.5,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded, size: 25), // Nút quay lại
      onPressed: () {
        Navigator.pop(context); // Quay lại trang trước
      },
    ),
    actions: [
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/images/home_cart.png',width: 20,scale: 20,), // Biểu tượng Home
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NavigatorBottomBarHome(currentIndex: 0), // Giả sử giỏ hàng là chỉ số 2
                ),
              ); // Điều hướng về trang Home
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/shopping-cart.png', width: 20, scale: 20), // Biểu tượng giỏ hàng
            onPressed: () {
              // Cập nhật currentIndex để hiển thị màn hình giỏ hàng
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NavigatorBottomBarHome(currentIndex: 2), // Giả sử giỏ hàng là chỉ số 2
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

Widget buildBottomAppBar(String productId) {
  return BottomAppBar(
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                productBloc.add(AddProductToCartEvent(productId: productId, quantity: 1, color: selectedColor, memory: selectedMemory ));
              },
              child: Text(
                'Thêm vào giỏ hàng',
                style: TextStyle(color: Colors.red), // Chữ màu đỏ
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Nền trắng
                side: BorderSide(color: Colors.red), // Viền đỏ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bo góc nhẹ
                ),
                minimumSize: Size(0, 40), // Chiều cao tối thiểu
              ),
            ),
          ),
          SizedBox(width: 10), // Khoảng cách giữa hai nút
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Buy now action
              },
              child: Text(
                'Mua ngay',
                style: TextStyle(color: Colors.white), // Chữ trắng
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Nền đỏ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bo góc nhẹ
                ),
                minimumSize: Size(0, 40), // Chiều cao tối thiểu
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}




