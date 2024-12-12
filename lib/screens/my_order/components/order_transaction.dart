
import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/model/orders/order_data_model.dart';
import 'package:ecommerce_app_mobile/model/orders/order_detail_data_model.dart';
import 'package:ecommerce_app_mobile/screens/my_order/bloc/my_order_bloc.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../size_config.dart';

class OrderTransaction extends StatefulWidget {
  const OrderTransaction({Key? key, required this.myOrderBloc})
      : super(key: key);
  final MyOrderBloc myOrderBloc;

  @override
  _OrderTransactionState createState() => _OrderTransactionState();
}

class _OrderTransactionState extends State<OrderTransaction> {
  List<String> statusTabs = [
    "Tất cả",
    "Đang xử lý",
    "Đang giao",
    "Hoàn tất",
    "Đơn hủy",
  ];
  List<String> statusValues = [
    "", // Tất cả
    "PROGRESS", // Đang xử lý
    "DELIVERY", // Đang giao
    "COMPLETED", // Hoàn tất
    "CANCELED", // Đơn hủy
  ];

  int currentType = 0;
  int currentStatus = 0;

  var username;
  final MyOrderBloc orderTransactionBloc = MyOrderBloc();

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    username = await UserSecurityStorage.getId();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    orderTransactionBloc.add(TypeAndStatusChangedEvent(
      currentStatus == 0
          ? null
          : statusValues[currentStatus], // Truyền giá trị trạng thái tương ứng
    ));
    return Column(
      children: [
        // Horizontal status tab list
        Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(5)),
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: statusTabs.length,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentStatus = index;
                      orderTransactionBloc.add(TypeAndStatusChangedEvent(
                        statusValues[
                            currentStatus], // Truyền giá trị trạng thái tương ứng
                      ));
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          statusTabs[index],
                          style: TextStyle(
                            color: currentStatus == index
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: currentStatus == index
                              ? getProportionateScreenWidth(150)
                              : getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(2),
                          decoration: BoxDecoration(
                            color: currentStatus == index
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
    
        // Selected tab content
        Expanded(
          child: Container(
            color: const Color(0xfff4f4f4),
            child: BlocConsumer<MyOrderBloc, MyOrderState>(
              bloc: orderTransactionBloc,
              listenWhen: (previous, current) =>
                  current is MyOrderActionState,
              buildWhen: (previous, current) =>
                  current is! MyOrderActionState,
              listener: (context, state) {
                // ... (your listener logic)
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case MyOrderLoading:
                    return const Center(child: CircularProgressIndicator());
                  case OrderListLoaded:
                    final buyAndSellState = state as OrderListLoaded;
                    return _tabItem(size, buyAndSellState.orderrList);
                  case MyOrderError:
                    final errorState = state as MyOrderError;
                    return Center(
                      child: Text(errorState.message),
                    );
                  default:
                    return const Center(
                      child: Text("Demand Default"),
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabItem(Size size, List<OrderDataModel> orderList) {
    if (orderList.isEmpty) {
      return _emptyProduct();
    }
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        // Không cần Expanded ở đây
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.7,
            child: _buildListProduct(orderList),
          ),
        ),
      ],
    );
  }

  Widget _emptyProduct() {
    return Column(
      children: [
        Image.asset(
          'assets/images/empty.png',
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(300),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(8)),
          child: Center(
            child: Text(
              'Chưa có sản phẩm nào',
              style: TextStyle(
                  color: AppColor.darkGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildListProduct(List<OrderDataModel> orderList) {
    return ListView.separated(
      itemCount: orderList.length,
      separatorBuilder: (context, index) => Divider(
          height: getProportionateScreenHeight(15),
          color: const Color(0xFFE8E8E8)),
      itemBuilder: (context, index) {
        final order = orderList[index];
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColor.colorWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hiển thị thông tin đơn hàng
              Row(
                children: [
                  Text(
                    'TECH ZONE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${_getOrderStatusMessage(order.orderStatus!)}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: getProportionateScreenHeight(5)),
              // Lặp qua danh sách sản phẩm trong đơn hàng
              Column(
                children: order.productItem!.map((product) {
                  return Column(
                    children: [
                      _buildOrderItem(product), // Hiển thị thông tin sản phẩm
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      )
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              // Hiển thị tổng giá trị đơn hàng
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Tổng số tiền: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(order.total)}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.colorBlack,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    // Check if the order status is "PROGRESS" before showing the button
                    if (order.orderStatus == "PROGRESS")
                      SizedBox(
                        width: getProportionateScreenWidth(130),
                        height: getProportionateScreenHeight(40),
                        child: ElevatedButton(
                          onPressed: () {
                            widget.myOrderBloc.add(CancelOrderClickedEvent(orderId: order.sId!, statusOrder: order.orderStatus!));
                          },
                          child: Text(
                            'Hủy đơn',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: Size(0, 40),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getOrderStatusMessage(String status) {
    if (status == "PROGRESS") {
      return "Đang xử lý";
    } else if (status == "COMPLETED") {
      return "Đã giao";
    } else if (status == "CANCELED") {
      return "Đã hủy";
    } else if (status == "DELIVERY") {
      return "Đang giao";
    } else {
      return "Trạng thái không xác định";
    }
  }

  Widget _buildOrderItem(ProductItemDetailModel product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          // Hình ảnh sản phẩm
          Container(
            height: getProportionateScreenHeight(100),
            width: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.images!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(14),
          ),
          // Thông tin sản phẩm
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(2)),
                Row(
                  children: [
                    Text(
                      '${product.memory ?? ""}, ${product.color ?? ""}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "x${product.quantity}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(2)),
                Text(
                  "${NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(product.price)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
