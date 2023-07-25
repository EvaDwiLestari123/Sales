import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales/Model/customer_model.dart';
import 'package:sales/pages/Login/login.dart';
import 'package:sales/Model/cart_model.dart';
import 'package:sales/pages/Menu/home.dart';
import 'package:sales/pages/Splashscreen/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => CustomerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
