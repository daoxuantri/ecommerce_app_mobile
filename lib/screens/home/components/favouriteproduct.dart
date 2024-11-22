import 'package:flutter/material.dart';

class FavouriteProduct extends StatefulWidget {
  // final bool? isTap;
  const FavouriteProduct({super.key, });

  @override
  State<FavouriteProduct> createState() => _FavouriteProductState();
}

class _FavouriteProductState extends State<FavouriteProduct> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.favorite_outline, color: Colors.red, size: 20,);
  }
}