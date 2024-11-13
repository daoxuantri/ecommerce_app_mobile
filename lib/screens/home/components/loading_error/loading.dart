import 'package:ecommerce_app_mobile/screens/home/components/loading_error/skelton.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

import '../base_input.dart';
import '../slider_home.dart';
import '../text_title.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    double x2 = SizeConfig.screenWidth * 0.44;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextTitle(title: 'Các sản phẩm nổi bật'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
              ],
            ),
            const TextTitle(title: 'Điện thoại'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
              ],
            ),
            const TextTitle(title: 'Lap Top'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
              ],
            ),
            const TextTitle(title: 'Đồng hồ thông minh'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
                Skeleton(
                  height: 180,
                  width: getProportionateScreenHeight(x2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      title: InputHome()
    );
  }

}






























///code cũ
///
///import 'package:ecommerce_app_mobile/screens/home/components/loading_error/skelton.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';

// import '../base_input.dart';
// import '../slider_home.dart';
// import '../text_title.dart';

// class Loading extends StatelessWidget {
//   const Loading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double x = 85;
//     double x2 = SizeConfig.screenWidth * 0.4;
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const InputHome(),
//             const SliderHome(),
//             const TextTitle(title: 'Danh mục'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Skeleton(
//                   height: getProportionateScreenHeight(x),
//                   width: getProportionateScreenHeight(x),
//                 ),
//                 Skeleton(
//                   height: getProportionateScreenHeight(x),
//                   width: getProportionateScreenHeight(x),
//                 ),
//                 Skeleton(
//                   height: getProportionateScreenHeight(x),
//                   width: getProportionateScreenHeight(x),
//                 ),
//                 Skeleton(
//                   height: getProportionateScreenHeight(x),
//                   width: getProportionateScreenHeight(x),
//                 ),
//               ],
//             ),
//             const TextTitle(title: 'Đề xuất'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Skeleton(
//                   height: SizeConfig.screenHeight*0.2,
//                   width: getProportionateScreenHeight(x2),
//                 ),
//                 Skeleton(
//                   height: SizeConfig.screenHeight*0.2,
//                   width: getProportionateScreenHeight(x2),
//                 ),
//               ],
//             ),
//             //ListPropose(products: successState.productsPropose),
//             const TextTitle(title: 'Hoa sỉ'),
//           ],
//         ),
//       ),
//     );
//   }
//   AppBar buildAppBar() {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       elevation: 1,
//       title: Image.asset(
//         'assets/images/anhchinh.png',
//         height: 70,
//         width: 151,
//       ),
//       actions: [
//         Image.asset(
//           'assets/images/IC_Bell.png',
//           height: 24,
//           width: 24,
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         const CircleAvatar(
//           child: Icon(Icons.add),
//         ),
//         const SizedBox(
//           width: 20,
//         )
//       ],
//     );
//   }

// }
