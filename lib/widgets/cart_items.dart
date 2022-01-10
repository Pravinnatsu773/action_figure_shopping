import 'dart:collection';

import 'package:flutter/material.dart';



class MyCartItems extends StatefulWidget {

  var cartItemQueue;

  MyCartItems({Key? key, required this.cartItemQueue}): assert(cartItemQueue != null), super(key: key);

  @override
  State<MyCartItems> createState() => _MyCartItemsState();
}

class _MyCartItemsState extends State<MyCartItems> {
  @override
  Widget build(BuildContext context) {



    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: (1/1.2),
          ),

          itemCount: widget.cartItemQueue.toList().where((element) => element != null).length,

          itemBuilder: (context, index){
            final item = widget.cartItemQueue.toList()[index];

            print(item['imageUrl']);
            return Container(

                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                        offset: Offset(2,2),
                        spreadRadius: 3.0,
                        blurRadius: 5,
                        color: Colors.black12

                    ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ]
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(

                        width: 120,
                        height: 120,
                        child: Image.network(item['imageUrl'])
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 180,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'], style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          SizedBox(height: 5,),
                          Text(item['developer'], style: TextStyle(fontSize: 12,)),
                          SizedBox(height: 15,),
                          Row(

                            children: [
                              Text("\$${item['price']}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(width: 10,),
                              Container(

                                width: 90,
                                height: 35,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: TextButton(
                                    onPressed: (){
                                     widget.cartItemQueue.toList().removeAt(index);
                                     print(widget.cartItemQueue);
                                      setState(() {

                                      });
                                    },
                                    child: Text('Remove', style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
            );
          }),
    );
  }
}
