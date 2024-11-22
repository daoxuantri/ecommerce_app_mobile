import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class PolicySales extends StatelessWidget {
  const PolicySales({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.white,
              width: getFullWidth(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(10),
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chính sách bán hàng',
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                  
                      ),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Row(
                        children: [
                          Image.asset('assets/images/free-delivery.png', width: 30,height: 30,),
                          SizedBox( width: getProportionateScreenWidth(10), ),
                          Text(
                            'Miễn phí giao hàng cho đơn từ 5 triệu',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13
                            )
                          ),
                          SizedBox( width: getProportionateScreenWidth(10), ),
                          GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: Colors.red,
                          fontWeight: FontWeight.w300,
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ),
                        ],
                      ),
                      SizedBox( height: getProportionateScreenHeight(5), ),
                      Row(
                        children: [
                          Image.asset('assets/images/protect_product.png', width: 30,height: 30,),
                          SizedBox(
                        width: getProportionateScreenWidth(10),
                          ),
                          Text(
                            'Cam kết hàng chính hãng 100%',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                                            
                          ),
                        ],
                      ),
                      SizedBox( height: getProportionateScreenHeight(5), ),
                      Row(
                        children: [
                          Image.asset('assets/images/return_product.png', width: 30,height: 30,),
                          SizedBox(
                        width: getProportionateScreenWidth(10),
                          ),
                          Text(
                            'Đổi trả trong vòng 10 ngày',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                                            
                          ),
                          SizedBox(
                        width: getProportionateScreenWidth(10),
                          ),
                          GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: Colors.red,
                          fontWeight: FontWeight.w300,
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ),
                        ],
                      ),
                      SizedBox( height: getProportionateScreenHeight(10), ),
                      Center(
                        child: Text(
                          '-------------------------------------',
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),),
                      ),
                      Text(
                        'Dịch vụ khác',
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                  
                      ),
                      SizedBox(height: getProportionateScreenHeight(10),),
                    Row(
                        children: [
                          Image.asset('assets/images/settings.png', width: 25,height: 25,),
                          SizedBox(
                        width: getProportionateScreenWidth(10),
                          ),
                          Text(
                            'Gói dịch vụ bảo hành/ Sửa chữa tận nơi',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                                            
                          ),
                          SizedBox(
                        width: getProportionateScreenWidth(10),
                          ),
                          GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: Colors.red,
                          fontWeight: FontWeight.w300,
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ),
                        ],
                      )
                    ],
                  ),
                ),
            );
  }
}