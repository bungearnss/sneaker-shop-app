import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/modelindex.dart';
import '../../../constant.dart';
import '../../../animation/FadeAnimation.dart';

import '../../product/product_screen.dart';

class ProductMainItem extends StatelessWidget {
  Products product;

  ProductMainItem({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Future<void> _gotoProduct() async {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ProductDetailScreen(receivedModels: product),
        ),
      );
    }

    return GestureDetector(
      onTap: _gotoProduct,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: width / 1.6,
        child: Stack(children: [
          Container(
            width: width / 1.81,
            decoration: BoxDecoration(
              color: product.modelColor,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: width / 1.81,
            child: FadeAnimation(
              delay: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: lightTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: 45,
            left: 10,
            child: FadeAnimation(
              delay: 1.5,
              child: Text(
                product.model,
                style: TextStyle(
                  color: lightTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 10,
            child: FadeAnimation(
              delay: 2,
              child: Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: TextStyle(
                  color: lightTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 32,
            top: 50,
            child: FadeAnimation(
              delay: 2,
              child: Hero(
                tag: product.imgAddress,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-30 / 360),
                  child: SizedBox(
                    width: 210,
                    height: 200,
                    child: Image(
                      image: AssetImage(product.imgAddress),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 170,
            child: IconButton(
              onPressed: _gotoProduct,
              icon: const FaIcon(
                FontAwesomeIcons.arrowCircleRight,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
