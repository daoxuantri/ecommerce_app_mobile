import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/shipping_address_model.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 

class AddressCard extends StatefulWidget {
  const AddressCard({super.key, required this.child, required this.addressInf});

  final String child;

  final AddressDataModel addressInf;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: getProportionateScreenHeight(150),
        child: Card(
          //color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Color(0xff8E8E93), width: getProportionateScreenWidth(1)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(17)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: getProportionateScreenWidth(5),
                    left: getProportionateScreenWidth(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cửa hàng',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(36),
                        height: getProportionateScreenHeight(36),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                CustomIconTextRow(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Color(0xffff9500),
                  ),
                  text: widget.addressInf.address.toString() 
                ),
                SizedBox(
                  height: getProportionateScreenHeight(7),
                ),
                CustomIconTextRow(
                  icon: Icon(
                    Icons.person_outline,
                    color: Color(0xffff9500),
                  ),
                  text: widget.addressInf.name.toString(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(7),
                ),
                CustomIconTextRow(
                  icon: Icon(
                    Icons.phone_outlined,
                    color: Color(0xffff9500),
                  ),
                  text: widget.addressInf.phone.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconTextRow extends StatelessWidget {
  final Icon icon;
  final String text;

  const CustomIconTextRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: getProportionateScreenWidth(15)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.0,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.01,
            ),
          ),
        ),
      ],
    );
  }
}
