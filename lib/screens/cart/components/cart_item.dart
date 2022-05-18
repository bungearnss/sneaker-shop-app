import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';
import '../../../providers/index_controller.dart';
import '../../../models/modelindex.dart';
import '../../../animation/FadeAnimation.dart';
import '../../components/custombutton.dart';

class CartItem extends StatefulWidget {
  final String? productId;
  final String imgAddress;
  final String model;
  final double price;
  final double size;
  final String unit;
  int numOfItem;

  CartItem({
    this.productId,
    required this.imgAddress,
    required this.model,
    required this.price,
    required this.size,
    required this.unit,
    required this.numOfItem,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Provider.of<CartController>(context).changeQuantity(widget.numOfItem);

    return Card(
      child: FadeAnimation(
        delay: 1.5 * 1 / 4,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          // width: width / 2,
          // height: height / 5.2,
          child: Row(children: [
            SizedBox(
              width: width / 2.8,
              height: height / 5.7,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                      width: width / 3.6,
                      height: height / 7.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 13,
                    bottom: 15,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(-40 / 360),
                      child: SizedBox(
                        width: 130,
                        height: 130,
                        child: Image(
                          image: AssetImage(widget.imgAddress),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: darkTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Size : ${widget.size} ${widget.unit}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: darkTextColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.numOfItem == 1) {
                            setState(() {
                              widget.numOfItem = 1;
                            });
                          } else {
                            setState(() {
                              widget.numOfItem = widget.numOfItem - 1;
                            });
                          }
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.numOfItem.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.numOfItem = widget.numOfItem + 1;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                            child: Icon(Icons.add, size: 15),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
