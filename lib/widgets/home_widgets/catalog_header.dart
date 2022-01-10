import 'package:flutter/material.dart';



class CataLogHeader extends StatelessWidget {
  const CataLogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Catalog App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),

          Text("Trending Products", style: TextStyle(fontSize: 24),),



        ]
    );
  }
}

