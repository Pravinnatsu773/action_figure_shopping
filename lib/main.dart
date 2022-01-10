import 'package:flutter/material.dart';
import 'package:action_figure_shopping/pages/home_page.dart';
import 'package:action_figure_shopping/pages/Item_detail.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomePage(),

      },
    );
  }
}
