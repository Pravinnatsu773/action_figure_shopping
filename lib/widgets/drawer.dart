import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              decoration: BoxDecoration(

                color: Colors.white
              ),
               padding: EdgeInsets.zero,

                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  margin: EdgeInsets.zero,

                  accountName: Text('Pravin Choudhary', style: TextStyle(color: Colors.black),),
                  accountEmail: Text("pravinjchoudhary@gmail.com",style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://comicvine.gamespot.com/a/uploads/scale_medium/11117/111178336/7607765-tumblr_inline_pd7frq3vtd1rjybja_1280.jpg'),
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
