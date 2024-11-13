import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';
import 'package:ecommerce_app_mobile/screens/home/bloc/home_bloc.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

import 'category_card.dart';

// class Category extends StatelessWidget {
//   const Category({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Scrollbar(
//         thickness: 1,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               // NavigationUtil.pushNamed(
//               //   ProductByCategoryPage.route,
//               //   arguments: {
//               //     "categoryId": state.categories[index].id,
//               //     "categoryName": state.categories[index].name!
//               //   },
//               // );
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: CategoryCard(
//                 name: 'Hoa sỉ',
//                 srcImg: 'assets/images/c1.png',
//                 press: () {
//                   // NavigationUtil.pushNamed(
//                   //   ProductByCategoryPage.route,
//                   //   arguments: {
//                   //     "categoryId": state.categories[index].id,
//                   //     "categoryName": state.categories[index].name!
//                   //   },
//                   // );
//                 },
//                 color: const Color(0xFFADC8EB), // màu nền cho category
//               ),
//             ),
//           ),
//           separatorBuilder: (context, index) => const SizedBox(),
//           itemCount: 4, // số lượng category
//         ),
//       ),
//     );
//   }
// }


class Category extends StatelessWidget {
  final List<ProductCategoryDataModel> categories;
  final HomeBloc homeBloc;

  const Category({super.key, required this.categories, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 105,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // Nếu index dưới 3, hiển thị các danh mục bình thường
            if (index < 3) {
              return InkWell(
                onTap: () {
                  // Chuyển đến trang sản phẩm theo danh mục
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CategoryCard(
                    name: categories[index].name.toString(),
                    images: categories[index].images.toString(),
                    id: categories[index].sId.toString(),
                    press: () {
                      // Chuyển đến trang sản phẩm theo danh mục
                    },
                  ),
                ),
              );
            } else if (index == 3) {
              // Nếu là mục thứ 4, hiển thị nút "Xem tất cả"
              return InkWell(
                onTap: () {
                  // Chuyển đến trang xem tất cả danh mục
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CategoryCard(
                    name: 'Xem tất cả',
                    images: 'path_to_your_icon_for_view_all', // Đặt hình ảnh đại diện cho "Xem tất cả"
                    id: 'all',
                    press: () {
                      // Chuyển đến trang xem tất cả danh mục
                    },
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
          separatorBuilder: (context, index) => const SizedBox(),
          // Giới hạn itemCount là 4 (3 mục đầu + nút Xem tất cả)
          itemCount: categories.length < 3 ? categories.length : 4,
        ),
      ),
    );
  }
}




















// class Category extends StatelessWidget {
//   const Category({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CategoryCard(
//             name: 'Hoa sỉ',
//             srcImg: 'assets/images/c1.png',
//             press: () {},
//             color: const Color(0xFFADC8EB),
//           ),
//           CategoryCard(
//             name: 'Hoa lẻ',
//             srcImg: 'assets/images/c2.png',
//             press: () {},
//             color: const Color(0xFFFFCADD),
//           ),
//           CategoryCard(
//             name: 'Hoa thiết kế',
//             srcImg: 'assets/images/c3.png',
//             press: () {},
//             color: const Color(0xFFD9B9DA),
//           ),
//           CategoryCard(
//             name: 'Tất cả',
//             srcImg: 'assets/images/c4.png',
//             press: () {},
//             color: const Color(0xFFE3B98F),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class Category extends StatelessWidget {
//   const Category({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Scrollbar(
//         thickness: 1,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               // NavigationUtil.pushNamed(
//               //   ProductByCategoryPage.route,
//               //   arguments: {
//               //     "categoryId": state.categories[index].id,
//               //     "categoryName": state.categories[index].name!
//               //   },
//               // );
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: CategoryCard(
//                 name: 'Hoa sỉ',
//                 srcImg: 'assets/images/c1.png',
//                 press: () {
//                   // NavigationUtil.pushNamed(
//                   //   ProductByCategoryPage.route,
//                   //   arguments: {
//                   //     "categoryId": state.categories[index].id,
//                   //     "categoryName": state.categories[index].name!
//                   //   },
//                   // );
//                 },
//                 color: const Color(0xFFADC8EB), // màu nền cho category
//               ),
//             ),
//           ),
//           separatorBuilder: (context, index) => const SizedBox(),
//           itemCount: 4, // số lượng category
//         ),
//       ),
//     );
//   }
// }
