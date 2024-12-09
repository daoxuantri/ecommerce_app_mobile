import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/screens/checkout/components/payment_method_selection.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/modelselected/selected_model.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({
    super.key,
    required this.listSelectedProduct,
    this.addressDataModel,
  });
  final List<SelectedProduct> listSelectedProduct;
  final AddressDataModel? addressDataModel;
  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
   String selectedPaymentMethod = 'COD'; // Khởi tạo giá trị mặc định

  void _onPaymentMethodChanged(String method) {
    if (mounted) {
      setState(() {
        selectedPaymentMethod = method; // Cập nhật phương thức thanh toán
      });
      print('Selected payment method: $selectedPaymentMethod'); // Debug
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(5),
            getProportionateScreenHeight(0),
            getProportionateScreenWidth(5),
            getProportionateScreenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(15),
                  getProportionateScreenHeight(10),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(5)),
              child: Text(
                'ĐỊA CHỈ NHẬN HÀNG',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Container(
              width: getFullWidth(),
              decoration: BoxDecoration(
                color: Colors.white, // Đưa màu nền vào đây
                borderRadius: BorderRadius.circular(15), // Bo tròn 4 góc
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    getProportionateScreenHeight(10),
                    getProportionateScreenWidth(0),
                    getProportionateScreenHeight(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.addressDataModel != null) ...[
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${widget.addressDataModel!.name ?? 'null'}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                    Text(
                                      widget.addressDataModel!.status == true
                                          ? 'MẶC ĐỊNH'
                                          : '',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      softWrap: true, // Cho phép xuống dòng
                                      maxLines: 3, 
                                    ),
                                  ],
                                ),
                                Text(
                                  '${widget.addressDataModel!.phone ?? 'null'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: true, // Cho phép xuống dòng
                                  maxLines: 2, // Giới hạn tối đa 2 dòng
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị "..." nếu vượt quá 2 dòng
                                ),
                                Text(
                                  '${widget.addressDataModel!.address ?? 'null'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: true, // Cho phép xuống dòng
                                  maxLines: 3, // Giới hạn tối đa 2 dòng
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị "..." nếu vượt quá 2 dòng
                                ),
                            
                                SizedBox(height: getProportionateScreenHeight(30),)
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Chuyển màn hình sang thay đổi địa chỉ
                            },
                          ),
                        ],
                      ),
                    ] else ...[
                      Text(
                        'Bạn chưa có địa chỉ nhận hàng.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      ElevatedButton(
                        onPressed: () {
                          // Chuyển đến màn hình thêm địa chỉ
                        },
                        child: Text('Thêm địa chỉ'),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(15),
                  getProportionateScreenHeight(10),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(5)),
              child: Text(
                'PHƯƠNG THỨC GIAO HÀNG',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Container(
              width: getFullWidth(),
              decoration: BoxDecoration(
                color: Colors.white, // Đưa màu nền vào đây
                borderRadius: BorderRadius.circular(15), // Bo tròn 4 góc
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(15),
                      getProportionateScreenHeight(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(15)),
                  child: Row(
                    children: [
                      Text(
                        'Phí giao tiêu chuẩn',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Miễn phí',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.green
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(15),
                  getProportionateScreenHeight(10),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(5)),
              child: Text(
                'PHƯƠNG THỨC THANH TOÁN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Container(
              width: getFullWidth(),
              decoration: BoxDecoration(
                color: Colors.white, // Đưa màu nền vào đây
                borderRadius: BorderRadius.circular(15), // Bo tròn 4 góc
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(15),
                      getProportionateScreenHeight(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(15)),
                  child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => PaymentMethodSelection(
  onPaymentMethodSelected: _onPaymentMethodChanged,
),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedPaymentMethod == 'VNPay'
                          ? 'Thanh toán qua VNPay'
                          : 'Thanh toán khi nhận hàng (COD)',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  ],
                ),
              ),
            ),
            // Các thành phần khác của màn hình
                  
                  ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(15),
                  getProportionateScreenHeight(10),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(5)),
              child: Text(
                'SẢN PHẨM',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Container(
              width: getFullWidth(),
              decoration: BoxDecoration(
                color: Colors.white, // Đưa màu nền vào đây
                borderRadius: BorderRadius.circular(15), // Bo tròn 4 góc
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(15),
                      getProportionateScreenHeight(10),
                      getProportionateScreenWidth(5),
                      getProportionateScreenHeight(15)),
                  child: Column(
                    children: [
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
                            _calculateTotalPrice()
                                .toString(), // Gọi hàm tính tổng giá
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(7),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                      // Danh sách sản phẩm
                      Column(
                        children: List.generate(
                            widget.listSelectedProduct.length, (index) {
                          final product = widget.listSelectedProduct[index];
                          return Column(
                            children: [
                              // Mặt hàng
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  getProportionateScreenWidth(0),
                                  getProportionateScreenHeight(15),
                                  getProportionateScreenWidth(5),
                                  getProportionateScreenHeight(15),
                                ),
                                width: getFullWidth(),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      product.images ??
                                          'assets/images/notfoundimages.jpg',
                                      fit: BoxFit.cover,
                                      width: getProportionateScreenWidth(100),
                                      height: getProportionateScreenHeight(100),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ), // Khoảng cách giữa hình ảnh và nội dung
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      2)),
                                          Text(
                                            [
                                              if (product.memory != null)
                                                '${product.memory}',
                                              if (product.color != null)
                                                '${product.color}'
                                            ].join(
                                                ', '), // Gộp các phần tử bằng dấu phẩy
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      5)),
                                          Row(
                                            children: [
                                              Text(
                                                formatPrice(product.price),
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                'x${product.quantity}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Divider
                              if (index !=
                                  widget.listSelectedProduct.length - 1)
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey[300],
                                ),
                            ],
                          );
                        }),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              width: getFullWidth(),
              decoration: BoxDecoration(
                color: Colors.white, // Đưa màu nền vào đây
                borderRadius: BorderRadius.circular(15), // Bo tròn 4 góc
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(15)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Phí vận chuyển',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'Miễn phí',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.green
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        children: [
                          Text(
                            'Tổng thanh toán',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            _calculateTotalPrice()
                                .toString(), // Gọi hàm tính tổng giá
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(10),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(5)),
              child: Text(
                'Nhấn "Thanh toán" đồng nghĩa với việc bạn đã đọc và đồng ý tuân theo Điều khoản và Điều kiện',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _calculateTotalPrice() {
    double total = 0;
    for (var product in widget.listSelectedProduct) {
      total += product.price * product.quantity;
    }
    return NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(total);
  }
}

String formatPrice(num? price) {
  return NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(price ?? 0);
}
