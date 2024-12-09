import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'form.dart';
class NewAddressCategories extends StatefulWidget {
  const NewAddressCategories({super.key});

  @override
  State<NewAddressCategories> createState() => _NewAddressCategoriesState();
}

class _NewAddressCategoriesState extends State<NewAddressCategories> {
  int index1 = 0;
  int index2 = 0;
  List<Color> myColors = [
    Color.fromRGBO(17, 17, 19, 0.3),
    Colors.green
  ];
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: getProportionateScreenHeight(190),
            ),
            InkWell(
              onTap: (){
                FormNewAddress.listValue[6] = 'Văn phòng';
                setState(() {
                  if(index1 == 0 && index2 == 0){
                    index1 = 1;
                  } else{
                    int temp = index1;
                    index1 = index2;
                    index2 = temp;
                  }
                });
              },
              child: Container(
                width: getProportionateScreenWidth(82),
                height: getProportionateScreenHeight(26),
                decoration: BoxDecoration(
                    color: myColors[index1],
                    borderRadius: BorderRadius.circular(4)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Văn phòng',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.006),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(30.5),
            ),
            InkWell(
              onTap: (){
                FormNewAddress.listValue[6] = 'Nhà riêng';
                setState(() {
                  if(index1 == 0 && index2 == 0){
                    index1 = 1;
                  } else{
                    int temp = index1;
                    index1 = index2;
                    index2 = temp;
                  }
                });
              },
              child: Container(
                width: getProportionateScreenWidth(86),
                height: getProportionateScreenHeight(26),
                decoration: BoxDecoration(
                    color: myColors[index2],
                    borderRadius: BorderRadius.circular(4)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Nhà riêng',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.006),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        Container(
          padding:
          EdgeInsets.only(bottom: getProportionateScreenHeight(7)),
          width: getProportionateScreenWidth(370),
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: Color(0x42111113)// Độ dày viền
                ),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đặt làm địa chỉ mặc định',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.006),
              ),
              CupertinoSwitch(
                value: isSwitched,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState((){
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
