import 'package:flutter/material.dart';
import 'package:food_shop/screens/cart/components/cart_item.dart';
import 'package:provider/provider.dart';
import '../../providers/index_controller.dart';
import '../../constant.dart';
import '../../models/modelindex.dart';
import '../customappbar.dart';
import './components/empty_cart.dart';
import '../../animation/FadeAnimation.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future? _cartItemFuture;
  int numItems = cartModels.length;

  double cartPriceSum() {
    double sumPrice = 0;
    for (Carts cartModel in cartModels) {
      sumPrice = sumPrice + cartModel.price;
    }
    return sumPrice;
  }

  Future _obtainCartItemFuture() {
    return Provider.of<CartController>(context, listen: false)
        .fetchAndSetCartItem();
  }

  rebuildState() {
    setState(() {
      _cartItemFuture = _obtainCartItemFuture();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    rebuildState();
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("cart", () {}),
        backgroundColor: backgroundColor,
        body: FutureBuilder(
          future: _cartItemFuture,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: materialButtonColor),
              );
            } else {
              if (snapshot.error != null) {
                return Center(
                  child: Text(
                    "An error occured! Please try to refresh.",
                    style: TextStyle(color: darkTextColor, fontSize: 15),
                  ),
                );
              } else {
                return Consumer<CartController>(
                  builder: (ctx, cartItem, ch) => cartItem.items.isEmpty
                      ? EmptyCart()
                      : Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: height * 0.8,
                              child: ListView.builder(
                                itemBuilder: (ctx, index) => CartItem(
                                  productId: cartItem.items[index].productId,
                                  imgAddress: cartItem.items[index].imgAddress,
                                  model: cartItem.items[index].model,
                                  price: cartItem.items[index].price,
                                  size: cartItem.items[index].size,
                                  unit: cartItem.items[index].unit,
                                  numOfItem: cartItem.items[index].numOfItem,
                                ),
                                itemCount: cartItem.itemCount,
                              ),
                            ),
                          ],
                        ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  sumInfo(width, height) {
    return Container(
      width: width,
      height: 80,
      color: Colors.pink,
      child: Column(children: [
        FadeAnimation(
          delay: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TOTAL",
                style: TextStyle(
                  color: darkTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$${cartPriceSum()}",
                style: TextStyle(
                  color: darkTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
