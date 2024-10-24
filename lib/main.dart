import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingapp/controller/homescreen_controller.dart';
import 'package:shopingapp/controller/product_screen_controlller.dart';
import 'package:shopingapp/view/homescreen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => (DetailsController()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
