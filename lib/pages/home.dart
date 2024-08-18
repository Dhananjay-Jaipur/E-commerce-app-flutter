import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store/pages/search.dart';
import 'package:store/pages/shop.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../components/drawer.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.i});
  int i = 0;

  @override
  State<Home> createState() => HomeState(i);
}

class HomeState extends State<Home> {

  Home h = Home(i: 0);

  int currentIndex = 0;

  List<Widget> pages = [Shop(), Cart()];

  HomeState(int i){
    currentIndex = i;
    // currentIndex = widget.i;
  }

  void Toggle(int index){
    setState(() {
      currentIndex = index;
      print(index);
    });
  }

  Container navBar()
  {
    return Container(
      padding: EdgeInsets.all(20),
      child: GNav(
        padding: EdgeInsets.all(35),
        haptic: true,
        gap: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        backgroundColor: Colors.transparent,
        tabBackgroundColor: Theme.of(context).colorScheme.onSurface,
        selectedIndex: currentIndex,
        onTabChange: (index) => Toggle(index),

        // tabBorderRadius: 32,
        tabs: const[
          GButton(
            icon: Icons.home_filled,
            // text: "home",
            iconSize: 38,
          ),
          GButton(
            icon: Icons.shopping_cart,
            iconSize: 38,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        centerTitle: true,
        title: Text(pages[currentIndex].toString(), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
        // flexibleSpace: const Image(
        //   image: AssetImage('asset/ae15d75a7b430dea3857b89e5df5fc63.jpg'),
        //   fit: BoxFit.contain,
        // ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search_sharp, size: MediaQuery.of(context).size.height / 30,),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));},
            ),
          ),
        ],

      ),

      drawer: myDrawer(),

      bottomNavigationBar: navBar(),

      body: pages[currentIndex],

    );
  }
}
