import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/models/user.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/my%20address.dart';
import 'package:store/pages/profile.dart';
import 'package:store/pages/search.dart';
import 'package:store/utils/globalKeys.dart';
import '../pages/cart.dart';
import '../pages/home.dart';
import '../pages/shop.dart';
import '../models/imagePaths.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {

      return Drawer(
        backgroundColor: Theme.of(context).colorScheme.onSurface,

        child: ListView(

          padding: const EdgeInsets.all(40),

          children: [
            DrawerHeader(
              child: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                },
                icon: ClipRRect(borderRadius: BorderRadius.circular(60),
                  child: Image.network(user.profile_picture),
                ),
              ),
            ),

            const SizedBox(height: 25,),

            ListTile(
              leading: Icon(Icons.home_outlined, size: 32, color: Theme.of(context).colorScheme.error,),
              title: Text(' home', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 0)));
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_cart_outlined, size: 32, color: Theme.of(context).colorScheme.error,),
              title: Text(' cart', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 1)));
              },
            ),

            ListTile(
              leading: Icon(Icons.list_alt, size: 32, color: Theme.of(context).colorScheme.error,),
              title: Text(' my orders', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 0)));
              },
            ),

            ListTile(
              leading: Icon(Icons.favorite_border_sharp, size: 32, color: Theme.of(context).colorScheme.error,),
              title: Text(' wishlist', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
              },
            ),

            ListTile(
              leading: Icon(Icons.payment, size: 32, color: Theme.of(context).colorScheme.error,),
              title: Text(' payment', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
              },
            ),

            ListTile(
              leading: Icon(CupertinoIcons.gear_alt, size: 32, color: Theme.of(context).colorScheme.error,),
              title: Text(' settings', style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ],
        ),
      );
  }
}
