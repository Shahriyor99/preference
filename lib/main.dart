import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preference/pages/home_page.dart';
import 'package:preference/pages/sign_page.dart';

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context)=>HomePage(),
        SignPage.id: (context)=>SignPage(),
      },
    );
  }
}