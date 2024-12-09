import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class PaymentMethodSelection extends StatefulWidget {
  const PaymentMethodSelection({
    Key? key,
    required this.onPaymentMethodSelected,
  }) : super(key: key);

  final Function(String) onPaymentMethodSelected;

  @override
  State<PaymentMethodSelection> createState() => _PaymentMethodSelectionState();
}

class _PaymentMethodSelectionState extends State<PaymentMethodSelection> {
  String selectedPaymentMethod = 'COD'; // Giá trị mặc định

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chọn phương thức thanh toán',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: selectedPaymentMethod == 'VNPay' ? Colors.blue : Colors.grey,
              ),
              title: const Text('VNPay'),
              subtitle: const Text('Thanh toán qua cổng VNPay'),
              trailing: Radio<String>(
                value: 'VNPay',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!; // Cập nhật phương thức thanh toán
                  });
                  print('PaymentMethodSelection selected: $value'); // Debug
                  widget.onPaymentMethodSelected(value!); // Gửi giá trị ra ngoài
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.local_shipping,
                color: selectedPaymentMethod == 'COD' ? Colors.blue : Colors.grey,
              ),
              title: const Text('Thanh toán khi nhận hàng (COD)'),
              subtitle: const Text('Thanh toán bằng tiền mặt khi nhận hàng'),
              trailing: Radio<String>(
                value: 'COD',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!; // Cập nhật phương thức thanh toán
                  });
                  print('PaymentMethodSelection selected: $value'); // Debug
                  widget.onPaymentMethodSelected(value!); // Gửi giá trị ra ngoài
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}