import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../providers/index_controller.dart';
import '../../screens/cart/components/cart_item.dart';

class ModalBottom extends StatefulWidget {
  double? price;
  String? model;
  String? imgAddress;
  double? size;
  int? numOfItem;
  String? unit;
  Function()? onConfirm;

  ModalBottom({
    this.price,
    this.model,
    this.imgAddress,
    this.size,
    this.numOfItem,
    this.unit,
    this.onConfirm,
  });

  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    bool checkedData() {
      if (widget.imgAddress != null &&
          widget.model != null &&
          widget.price != null &&
          widget.numOfItem != null &&
          widget.size != null &&
          widget.unit != null) {
        return true;
      }
      return false;
    }

    return Container(
      height: height * 0.4,
      padding: const EdgeInsets.all(15),
      color: lightTextColor,
      alignment: Alignment.center,
      child: checkedData() == true
          ? Column(
              children: [
                CartItem(
                  imgAddress: widget.imgAddress!,
                  model: widget.model!,
                  price: widget.price!,
                  size: widget.size!,
                  unit: widget.unit!,
                  numOfItem: widget.numOfItem!,
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () => widget.onConfirm!(),
                  minWidth: width / 1.2,
                  height: height / 15,
                  color: materialButtonColor,
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(color: lightTextColor),
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Can't load data. try to refresh!",
                  style: TextStyle(fontSize: 18, color: darkTextColor),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("refresh"),
                ),
              ],
            ),
    );
  }
}
