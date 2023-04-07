import 'package:cryptoapp/network/network.dart';
import 'package:cryptoapp/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  await Network.getCrypto();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'inter'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
