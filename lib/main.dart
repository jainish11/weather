import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';


void main() {
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.grey[900]
      ),
      home:MyHome(),
    );
  }
}
