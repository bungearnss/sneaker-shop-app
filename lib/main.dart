import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/homepage/home_screen.dart';
import './screens/cart/cart_screen.dart';
import './screens/navigator.dart';
import './providers/index_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Sneakers App',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //       fontFamily: 'RobotoCondensed',
    //     ),
    //     home: const BottomTabNavigator(),
    //   );
    // }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductController(),
        ),
        ChangeNotifierProvider.value(
          value: CartController(),
        ),
        ChangeNotifierProvider.value(
          value: UserController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'RobotoCondensed',
        ),
        home: const BottomTabNavigator(),
      ),
    );
  }
}
