/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_vendor/screens/profile/components/drawer.dart';
import 'package:fmp_vendor/screens/profile/components/post.dart';

import '../../../size_config.dart';
import 'avatar.dart';
import 'background_image.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: const MyEndDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: getProportionateScreenHeight(330),
                ),
                const BackgroundImage(),
                Positioned(
                  right: 8,
                  top: 30,
                  child: SizedBox(
                    //width: getProportionateScreenWidth(44),
                    height: getProportionateScreenHeight(44),
                    child: IconButton(
                      onPressed: () {
                        _globalKey.currentState?.openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const ProfileAvatar(),
                // const Post(),
              ],
            ),
            // SizedBox(height: getProportionateScreenHeight(50),),
            const Post(),
          ],
        ),
      ),
    );
  }
}
*/
