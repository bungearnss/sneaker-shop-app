import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';
import '../customappbar.dart';
import '../../constant.dart';
import '../../models/modelindex.dart';
import '../../providers/index_controller.dart';
import '../components/custombutton.dart';
import '../../animation/FadeAnimation.dart';
import '../../screens/components/modalbottom.dart';

class ProductDetailScreen extends StatefulWidget {
  Products receivedModels;

  ProductDetailScreen({required this.receivedModels});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<double> sizes = [6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11];
  String _isSelectdCountry = "US";
  late CartController provider;
  int numItem = 1;
  int? quantity;
  String snackBarMsg = "";
  var _isSelected;

  Future<void> addCartItem(
    double price,
    String model,
    String imgAddress,
    double size,
    int numOfItem,
    String unit,
  ) async {
    await Provider.of<CartController>(context, listen: false).addCartItem(
      price,
      model,
      imgAddress,
      size,
      numOfItem,
      unit,
    );
  }

  @override
  Widget build(BuildContext context) {
    void _back() {
      Navigator.pop(context);
    }

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    provider = Provider.of<CartController>(context);
    ToastContext().init(context);
    print("###### $quantity");
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: backgroundColor,
        appBar: customAppBar("detail", _back),
        body: SingleChildScrollView(
          child: Column(children: [
            productImage(width, height),
            scrollImageDetail(width, height),
            SizedBox(
              height: 20,
              width: width / 1.1,
              child: const Divider(
                thickness: 1.4,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            productInformation(width, height),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }

  showAddCartResult() {
    if (_isSelected == null) {
      snackBarMsg = "Please select size.";
      Toast.show(
        snackBarMsg,
        gravity: Toast.bottom,
        backgroundColor: const Color.fromARGB(137, 74, 73, 73),
        duration: Toast.lengthShort,
        backgroundRadius: 0.0,
      );
    } else {
      addCartItem(
        widget.receivedModels.price,
        widget.receivedModels.model,
        widget.receivedModels.imgAddress,
        provider.size,
        provider.numOfItem,
        _isSelectdCountry,
      );
      snackBarMsg = "Saved to your cart";
      Toast.show(
        snackBarMsg,
        gravity: Toast.bottom,
        backgroundColor: const Color.fromARGB(137, 74, 73, 73),
        duration: Toast.lengthShort,
        backgroundRadius: 0.0,
      );
      Navigator.pop(context);
    }
  }

  productImage(width, height) {
    return SizedBox(
      height: height * 0.48,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            // bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: width,
                height: height / 2.2,
                decoration: BoxDecoration(
                  color: widget.receivedModels.modelColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(120),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.receivedModels.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: width / 1.3,
                  height: height / 4.3,
                  child: Image(
                    image: AssetImage(widget.receivedModels.imgAddress),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  roundedImageDetail(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.receivedModels.imgAddress),
      ),
    );
  }

  scrollImageDetail(width, height) {
    return FadeAnimation(
      delay: 0.5,
      child: Container(
        padding: const EdgeInsets.all(2),
        width: width,
        height: height / 11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            roundedImageDetail(width, height),
            roundedImageDetail(width, height),
            roundedImageDetail(width, height),
            Container(
              padding: const EdgeInsets.all(2),
              width: width / 5,
              height: height / 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(widget.receivedModels.imgAddress),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(1),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: lightTextColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  productInformation(width, height) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: width,
      // height: height / 2.25,
      child: Column(children: [
        FadeAnimation(
          delay: 1,
          child: Row(
            children: [
              Text(
                widget.receivedModels.model,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                '\$${widget.receivedModels.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        FadeAnimation(
          delay: 1.5,
          child: SizedBox(
            width: width,
            // height: height / 9,
            child: Text(
              widget.receivedModels.productInfo,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        FadeAnimation(
          delay: 2.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 10,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isSelectdCountry = "UK";
                        });
                      },
                      child: Text(
                        "UK",
                        style: TextStyle(
                          decoration: _isSelectdCountry == "UK"
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          fontWeight: _isSelectdCountry == "UK"
                              ? FontWeight.bold
                              : FontWeight.w400,
                          color: _isSelectdCountry == "UK"
                              ? darkTextColor
                              : Colors.grey,
                          fontSize: _isSelectdCountry == "UK" ? 19 : 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 7,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isSelectdCountry = "US";
                        });
                      },
                      child: Text(
                        "US",
                        style: TextStyle(
                          decoration: _isSelectdCountry == "US"
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          fontWeight: _isSelectdCountry == "US"
                              ? FontWeight.bold
                              : FontWeight.w400,
                          color: _isSelectdCountry == "US"
                              ? darkTextColor
                              : Colors.grey,
                          fontSize: _isSelectdCountry == "US" ? 19 : 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: width,
          height: height / 16,
          child: FadeAnimation(
            delay: 3,
            child: Row(
              children: [
                SizedBox(
                  width: width / 1.1,
                  child: ListView.builder(
                    itemCount: sizes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelected = index;
                            // provider.changAmount(
                            //     widget.dataList[index].toStringAsFixed(0));
                            provider.changSize(sizes[index].toString());
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: width / 4.5,
                          // height: height / 11,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _isSelected == index
                                  ? Colors.black
                                  : Colors.grey,
                              width: 1.2,
                            ),
                            color: _isSelected == index
                                ? Colors.black
                                : backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _isSelected == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () => [
            showModalBottomSheet(
              context: context,
              builder: (context) => ModalBottom(
                  price: widget.receivedModels.price,
                  model: widget.receivedModels.model,
                  imgAddress: widget.receivedModels.imgAddress,
                  size: provider.size,
                  numOfItem: numItem,
                  unit: _isSelectdCountry,
                  onConfirm: () => showAddCartResult()),
            ),
          ],
          title: "ADD TO CART",
          price: widget.receivedModels.price,
          model: widget.receivedModels.model,
          imgAddress: widget.receivedModels.imgAddress,
          size: provider.size,
          unit: _isSelectdCountry,
          numOfItem: numItem,
        )
      ]),
    );
  }
}
