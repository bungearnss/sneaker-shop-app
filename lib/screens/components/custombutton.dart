import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../screens/cart/components/cart_item.dart';
import '../../providers/index_controller.dart';
import '../../screens/components/modalbottom.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  String title;
  double? price;
  String? model;
  String? imgAddress;
  double? size;
  int? numOfItem;
  String? unit;

  CustomButton({
    required this.onPressed,
    required this.title,
    this.price,
    this.model,
    this.imgAddress,
    this.size,
    this.numOfItem,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialButton(
      onPressed: onPressed,
      minWidth: width / 1.2,
      height: height / 15,
      color: materialButtonColor,
      child: Text(
        title,
        style: TextStyle(color: lightTextColor),
      ),
    );
  }
}
