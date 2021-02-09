import 'package:flutter/material.dart';
import 'package:food_order2/constants.dart';

import 'package:food_order2/screens/navs.dart';
import 'package:provider/provider.dart';
import 'package:food_order2/store/product_provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_)=> ProductProvider(),
        child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Directionality(textDirection: TextDirection.rtl,child: Navs(),),
    );
  }
}

