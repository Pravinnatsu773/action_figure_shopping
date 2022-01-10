import 'package:flutter/material.dart';
import 'package:action_figure_shopping/widgets/cart_items.dart';
import 'dart:collection';

class MyCartPage extends StatelessWidget {
  final Queue cartItemQueue;


  const MyCartPage({Key? key, required this.cartItemQueue}): assert(cartItemQueue != null), super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:  Column(
        children: [

        ],
      ),
    );
  }
}


