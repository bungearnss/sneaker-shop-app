import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../models/modelindex.dart';
import '../../../animation/FadeAnimation.dart';
import '../../product/product_screen.dart';

class ProductSubItem extends StatelessWidget {
  Products productItem;

  ProductSubItem({required this.productItem});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Future<void> _gotoProduct() async {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ProductDetailScreen(receivedModels: productItem),
        ),
      );
    }

    return GestureDetector(
      onTap: _gotoProduct,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: width / 2.24,
        height: height / 4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 5,
              child: FadeAnimation(
                delay: 1,
                child: Container(
                  width: width / 13,
                  height: height / 10,
                  color: Colors.red,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Center(
                      child: FadeAnimation(
                        delay: 1.5,
                        child: Text(
                          "NEW",
                          style: TextStyle(
                            color: lightTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 135,
              top: -5,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: darkTextColor,
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: FadeAnimation(
                delay: 1.5,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-15 / 360),
                  child: SizedBox(
                    width: width / 3,
                    height: height / 9,
                    child: Image(
                      image: AssetImage(productItem.imgAddress),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 124,
              // left: 45,
              child: FadeAnimation(
                delay: 2,
                child: Container(
                  width: width / 2.2,
                  height: height / 42,
                  child: SizedBox(
                    child: Text(
                      "${productItem.name} ${productItem.model}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: darkTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              // left: 45,
              child: FadeAnimation(
                delay: 2.2,
                child: SizedBox(
                  width: width / 2.2,
                  height: height / 42,
                  child: FittedBox(
                    child: Text(
                      "\$${productItem.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: darkTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
