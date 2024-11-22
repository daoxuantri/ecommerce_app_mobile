import 'package:flutter/material.dart';
import 'package:ecommerce_app_mobile/model/products/specifications/specification_data_model.dart';
class SpecificationScreen extends StatelessWidget {
  final List<DetailDataModel>? details;

  const SpecificationScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Chi tiết sản phẩm",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (var detailCategory in details ?? [])
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề danh mục
                  Text(
                    detailCategory.category,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Danh sách các thông tin chi tiết
                  for (var detail in detailCategory.details)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              detail.key,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Text(
                              detail.value,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Divider(color: Colors.grey.shade300), // Đường phân cách
                ],
              ),
          ],
        ),
      ),
    );
  }
}




// import 'package:ecommerce_app_mobile/model/products/specifications/specification_data_model.dart';
// import 'package:flutter/material.dart';

// class SpecificationScreen extends StatelessWidget {
//   final List<DetailDataModel>? details;
  
//   const SpecificationScreen({super.key, required this.details});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Chi tiết sản phẩm", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500 ),)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             for (var detailCategory in details ?? [])
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     detailCategory.category,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   for (var detail in detailCategory.details)
//                     Text(
//                       '${detail.key}: ${detail.value}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }



// }