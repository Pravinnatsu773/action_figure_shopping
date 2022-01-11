import 'package:action_figure_shopping/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_figure_shopping/widgets/cart_items.dart';
import 'dart:collection';

class MyCartPage extends StatelessWidget {


  const MyCartPage({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:  SafeArea(
        
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              
              _CartList(),

              Divider(),

              _CartTotal(),

            ],
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  State<_CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<_CartTotal> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$${_cart.totalPrice}", style: TextStyle(fontSize: 32),),

          SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
                onPressed: (){},
                child: Text("Buy", style: TextStyle(color: Colors.white, fontSize: 18),)),
          )
        ],
      ),
    );
  }
}


class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _cart.items.length,
          itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.remove_circle_outline),
            ),
            title: Text("${_cart.items[index].name}"),
          );
          }
      ),
    );
  }
}




