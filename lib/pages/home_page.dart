import 'package:action_figure_shopping/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:action_figure_shopping/widgets/drawer.dart';
import 'package:action_figure_shopping/pages/cart_page.dart';
import 'package:flutter/services.dart';
import 'dart:collection';
import 'dart:convert';

import 'package:action_figure_shopping/widgets/home_widgets/catalog_header.dart';
import 'package:action_figure_shopping/widgets/home_widgets/catalog_list.dart';


class HomePage extends StatefulWidget {


  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData()async{

    final catalogJson = await rootBundle.loadString("assets/files/items.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    print(productsData);
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    print(CatalogModel.items);
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CataLogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(
                    child: CatalogList())
              else
                Center(child: CircularProgressIndicator())
              
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartPage(cartItemQueue: queue,)));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}


