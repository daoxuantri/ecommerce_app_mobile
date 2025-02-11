import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/shipping_address_model.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_bloc.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_event.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
  const AddressCard(
      {super.key,
      required this.child,
      required this.addressInf,
      required this.addressBloc});

  final String child;

  final AddressDataModel addressInf;
  final AddressBloc addressBloc;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 5),
      child: Container(
        height: getProportionateScreenHeight(150),
        child: Card(
          //color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
                color: Color(0xff8E8E93),
                width: getProportionateScreenWidth(1)),
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
                      Row(
                        children: [
                          Text(
                            'Địa chỉ: ',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          if (widget.addressInf.status ==
                              true) // Kiểm tra trạng thái
                            Text(
                              'MẶC ĐỊNH',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                        ],
                      ),
                      Container(
                        width: getProportionateScreenWidth(36),
                        height: getProportionateScreenHeight(36),
                        child: IconButton(
                          onPressed: () {
                            _showDeleteConfirmationDialog(context);
                          },
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
                    Icons.person_outline,
                    color: Color(0xffff9500),
                  ),
                  text: widget.addressInf.name.toString(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                CustomIconTextRow(
                  icon: Icon(
                    Icons.phone_outlined,
                    color: Color(0xffff9500),
                  ),
                  text: widget.addressInf.phone.toString(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                CustomIconTextRow(
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xffff9500),
                    ),
                    text: widget.addressInf.address.toString()),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa'),
          content: Text('Bạn có chắc chắn muốn xóa địa chỉ này không?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                print(widget.addressInf.sId);
                widget.addressBloc
                    .add(AddressRemoveClickEvent(widget.addressInf.sId));
                Navigator.of(context).pop();
              },
              child: Text('Xóa'),
            ),
          ],
        );
      },
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
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }
}
