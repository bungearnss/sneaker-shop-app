import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_shop/providers/index_controller.dart';
import 'package:food_shop/screens/app_drawer.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../providers/product_controller.dart';
import '../customappbar.dart';
import './components/product_sub_item.dart';
import './components/product_main_item.dart';
import '../app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newcurrentIndex = 0;
  late final prodData;
  final List featured = [
    'New',
    'Featured',
    'Upcoming',
  ];

  int featuredcurrentIndex = 1;

  final List categories = [
    'Nike',
    'Addidas',
    'Jordan',
    'Puma',
    'Gucci',
    'Tom Ford',
    'Koio',
  ];
  int categoriescurrentIndex = 0;

  //Top Categories Widget Component

  Future _obtainProductsItem() async {
    return Provider.of<ProductController>(context, listen: false)
        .fetchAndSetProducts();
  }

  @override
  void initState() {
    prodData = _obtainProductsItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final prodData = Provider.of<ProductController>(context, listen: false)
    //     .fetchAndSetProducts();
    _obtainProductsItem();
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: customAppBar("home", () {}),
        drawer: const AppDrawer(),
        body: prodData == null
            ? Center(
                child: CircularProgressIndicator(
                  color: materialButtonColor,
                ),
              )
            : Column(
                children: [
                  categoriesTab(width, height),
                  const SizedBox(height: 10),
                  mainCategories(width, height, prodData),
                  moreTextWidget(),
                  subcategories(width, height, prodData),
                ],
              ),
      ),
    );
  }

  Widget categoriesTab(width, height) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          height: height / 18,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    categoriescurrentIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: categoriescurrentIndex == index ? 21 : 13,
                      color: categoriescurrentIndex == index
                          ? darkTextColor
                          : unSelectedtextColor,
                      fontWeight: categoriescurrentIndex == index
                          ? FontWeight.bold
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget mainCategories(width, height, prodData) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: width / 16,
          height: height / 2.7,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              itemCount: featured.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      featuredcurrentIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: featuredcurrentIndex == index ? 19 : 17,
                        color: featuredcurrentIndex == index
                            ? darkTextColor
                            : unSelectedtextColor,
                        fontWeight: featuredcurrentIndex == index
                            ? FontWeight.bold
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Consumer<ProductController>(
          builder: (ctx, controller, ch) => SizedBox(
            width: width / 1.2,
            height: height / 2.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.item.length,
              itemBuilder: (ctx, index) => ProductMainItem(
                product: controller.item[index]!,
              ),
            ),
          ),
        ),
      ],
    );
  }

  moreTextWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Text(
          "More",
          style: TextStyle(
            fontSize: 22,
            color: darkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.longArrowAltRight,
            size: 27,
          ),
        ),
      ]),
    );
  }

  Widget subcategories(width, height, prodData) {
    return SizedBox(
      width: width,
      height: height / 4,
      child: Consumer<ProductController>(
        builder: (ctx, controller, ch) => SizedBox(
          width: width / 1.2,
          height: height / 2.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.item.length,
            itemBuilder: (ctx, index) => ProductSubItem(
              productItem: controller.item[index]!,
            ),
          ),
        ),
      ),
    );
  }
}
