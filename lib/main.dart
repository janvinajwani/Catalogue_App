import 'package:flutter/material.dart';
import 'package:flutter_kindle/screens/home_detail_screen.dart';
import 'package:flutter_kindle/screens/login_screen.dart';
import 'package:flutter_kindle/utils/routes.dart';
import 'package:flutter_kindle/widgets/drawer.dart';
import 'package:flutter_kindle/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_kindle/screens/cart_screen.dart';
import 'core/store.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
    store: MyStore(),
    // interceptors: [],
    child: MyApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
