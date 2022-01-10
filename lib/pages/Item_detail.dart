import 'package:flutter/material.dart';
import 'package:action_figure_shopping/models/catalog.dart';



class ItemDetail extends StatelessWidget {
  final Item catalog;
  const ItemDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      bottomNavigationBar: Container(

        color: Colors.white10,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.all(20),
          children: [
            Text("\$${catalog.price}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),

            ElevatedButton(

                style: ButtonStyle(

                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(Colors.black87)
                ),
                onPressed: (){},
                child: Text("Add to cart",),
            )
          ],),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.imageUrl, width: width/1.8,)
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${catalog.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),

                    SizedBox(height: 5,),
                    Text("${catalog.desc}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
