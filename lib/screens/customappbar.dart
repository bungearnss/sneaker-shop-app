import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constant.dart';
import '../screens/cart/components/badge.dart';

/* 
 pageName/page = "home" for HomeScreen
 pageName/page = "cart" for CartScreen
 pageName/page = "profile" for ProfileScreen

 pageName/page = "detail" for every detail screen such as product_screen
*/

PreferredSize? customAppBar(String page, void Function()? onPressed) {
  return PreferredSize(
    preferredSize: Size.fromHeight(page == 'detail' ? 60 : 70),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: page == "detail"
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Nike",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: lightTextColor,
                  ),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: darkTextColor,
                  size: 22,
                ),
                onPressed: onPressed,
              ),
              actions: [switchDetailActions(page)],
            )
          : Container(
              decoration: BoxDecoration(
                border: page == "cart"
                    ? const Border(
                        bottom: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(83, 81, 82, 1),
                        ),
                      )
                    : null,
              ),
              child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: page == "profile" ? true : false,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      page == "home"
                          ? "Discover"
                          : page == "cart"
                              ? "My Cart"
                              : "My Profile",
                      style: TextStyle(
                        fontSize: page == "home" ? 30 : 25,
                        fontWeight: FontWeight.bold,
                        color: darkTextColor,
                      ),
                    ),
                  ),
                  actions: [switchHomeActions(page)],
                  leading: page == "home"
                      ? Builder(builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: darkTextColor,
                                size: 28,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                            ),
                          );
                        })
                      : null),
            ),
    ),
  );
}

switchHomeActions(String pageName) {
  if (pageName == "home") {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.search,
              color: darkTextColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 10),
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bell,
              color: darkTextColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  } else if (pageName == "cart") {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15),
      child: Badge(
        child: Icon(
          Icons.shopping_cart,
          color: darkTextColor,
          size: 30,
        ),
      ),
    );
  } else if (pageName == "profile") {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: IconButton(
        icon: FaIcon(
          FontAwesomeIcons.ellipsisVertical,
          color: darkTextColor,
          size: 25,
        ),
        onPressed: () {},
      ),
    );
  }
}

switchDetailActions(String pageName) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: IconButton(
      icon: Icon(
        Icons.favorite_border,
        color: lightTextColor,
        size: 25,
      ),
      onPressed: () {},
    ),
  );
}
