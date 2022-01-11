import 'package:action_figure_shopping/models/cart_model.dart';
import 'package:action_figure_shopping/pages/Item_detail.dart';
import 'package:flutter/material.dart';

import 'package:action_figure_shopping/models/catalog.dart';
import 'package:action_figure_shopping/widgets/home_widgets/catalog_image.dart';



class CatalogList extends StatelessWidget {



  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel().getByPosition(index);
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetail(catalog: catalog)));
            },
              child: CatalogItem(catalog: catalog));
        }
    );
  }
}




class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : assert(catalog != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.imageUrl)),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("${catalog.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

                Text("${catalog.desc}", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 14),),


                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text("\$${catalog.price}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),

                    _AddToCart(catalog: catalog,),
                  ],)
              ],
            ))
          ],
        )
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({Key? key, required this.catalog}) : assert(catalog!=null),super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {

  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.black87)
      ),
      onPressed: (){
        if(isAdded == false){
          isAdded = true;
        }else{
          isAdded = false;
        }

        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

        setState(() {});
      },
      child: isAdded?Icon(Icons.done):Text("Add to cart",),

    );
  }
}


