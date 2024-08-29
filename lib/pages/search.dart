import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/components/drawer.dart';
import 'package:store/models/user.dart';
import 'package:store/pages/productPage.dart';
import 'package:store/pages/shop.dart';
import 'package:store/utils/globalKeys.dart';
import 'package:store/models/imagePaths.dart';

import '../components/loading.dart';
import '../components/tiles.dart';
import 'home.dart';

class Search extends StatefulWidget {
   Search({super.key});

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
   var favKey = GlobalKey();

   String? txt;

   PageController scrollController = PageController();

   @override
   initState() {
     setState(() {
       // Scrollable.ensureVisible(favKey.currentContext!);
     });
     super.initState();
   }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: myDrawer(),

      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),

            leading: BackButton(
              onPressed: () {Get.to(Home(i: 0));},
            ),

            expandedHeight: MediaQuery.of(context).size.height / 4,
            iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),

            // ADD IMAGE IN THE BG::::::::
            flexibleSpace: Stack(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 13,
                    backgroundImage: NetworkImage(user.profile_picture!),
                  ),
                ),

                Positioned(
                  bottom: MediaQuery.of(context).size.width / 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "️${user.email} 🔥",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 43,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 17, bottom: 20),
              child: TextField(
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                cursorColor: Theme.of(context).colorScheme.onPrimary,

                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_sharp),
                  hintText: "search...",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  fillColor: Theme.of(context).colorScheme.scrim,
                  filled: true,
                ),

                onChanged: (value) {
                  setState(() {
                    txt = value;
                  });
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20,),),

          SliverToBoxAdapter(
            child: Center(child: Text("CATEGORY", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary))),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 10,),),

          SliverToBoxAdapter(
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('categories').get(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  }

                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < snapshot.data!.docs.length; i++)
                          InkWell(
                            onTap: (){
                              setState(() {
                                txt = snapshot.data!.docs[i]['name'];
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 5,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                              ),
                              child: Center(
                                child: Text(snapshot.data!.docs[i]['name'],
                                    style: TextStyle(
                                        fontSize: 26,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onSecondary)),
                              ),
                            ),
                          )
                      ],
                    );
                  }

                  print("${snapshot.stackTrace}stack trace");
                  print("${snapshot.error}error");
                  return const Text("Something went 🧐 wrong");
                }
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20,),),

          SliverToBoxAdapter(
            key: favKey,
            child: (txt.isNull)?
                favTile()
                :searchTile(inputText: txt!),
          ),


        ],
      ),
    );
  }
}



class favTile extends StatefulWidget {
  favTile({super.key});

  @override
  State<favTile> createState() => _favTileState();
}

class _favTileState extends State<favTile> {
  PageController scrollController = PageController();

  Container AddItem(value) {

    if(value == true){
      return Container(
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(Icons.done_outline, size: MediaQuery.of(context).size.height / 22,),
      );
    }

    else{
      return Container(
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(Icons.shopping_cart_outlined, size: MediaQuery.of(context).size.height / 22,),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("products").where("fav", isEqualTo: true).get(),

      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        if (snapshot.hasData) {

          if (snapshot.data!.docs.length <= 0){
            return Center(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.05),
                child: Text(
                  "ADD SOMETHING TO FAVOURITE 😭💔",
                  style: TextStyle(
                    fontSize: Get.width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }


          else{
            return Column(
              children: [

                Center(child: Text("FAVOURITE 🖤", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary))),


                for(int i = 0; i < snapshot.data!.docs.length; i++)
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ProductPage(snapshot: snapshot, index: i),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                        isScrollControlled: true,
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                      // padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: Stack(
                        alignment: Alignment.center,

                        children: [

                          PageView(
                            scrollDirection: Axis.horizontal,

                            controller: scrollController,

                            children: [

                              for(int j = 0; j < snapshot.data!.docs[i]['image_count']; j++)
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      height: MediaQuery.of(context).size.height / 2.7,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot.data!.docs[i]['images'][j]),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context).colorScheme.onSecondary,
                                                spreadRadius: 7
                                            ), // no shadow color set, defaults to black
                                          ]
                                      ),

                                    ),
                                  ],
                                ),

                            ],
                          ),

                          Positioned(
                            top: MediaQuery.of(context).size.height / 2.4,
                            child: SmoothPageIndicator(
                              controller: scrollController,
                              count: snapshot.data!.docs[i]['image_count'],
                              effect: ExpandingDotsEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                spacing: 5.0,
                                activeDotColor: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 12,
                            right: 14,
                            child: (snapshot.data!.docs[i]['fav']) ?
                            IconButton(
                              onPressed: () async {
                                setState(() {});
                                await FirebaseFirestore.instance.collection(
                                    "products").doc(
                                    snapshot.data!.docs[i].id).update({
                                  "fav": false,
                                });
                              },
                              icon: const Icon(
                                  Icons.favorite, color: Colors.redAccent,
                                  size: 40),
                            )
                                :IconButton(
                              onPressed: () async {
                                setState(() {});
                                await FirebaseFirestore.instance.collection(
                                    "products").doc(
                                    snapshot.data!.docs[i].id).update({
                                  "fav": true,
                                });
                              },
                              icon: const Icon(
                                  Icons.favorite_border_sharp, color: Colors.redAccent,
                                  size: 40),
                            ),
                          ),

                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.42,
                            child: Column(
                              children: [

                                const SizedBox(height: 20,),

                                Text(
                                  snapshot.data!.docs[i]['name'],
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  ),
                                ),

                                Text(
                                  '${snapshot.data!.docs[i]['price']} ₹',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height / 40,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: snapshot.data!.docs[i]['cart'] ?
                            Container(
                              height: MediaQuery.of(context).size.height / 11,
                              width: MediaQuery.of(context).size.height / 11,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Icon(Icons.done_outline, size: MediaQuery.of(context).size.height / 22,),
                            )
                                :InkWell(
                              onTap: () async{
                                setState(() {});
                                await FirebaseFirestore.instance.collection("products").doc(snapshot.data!.docs[i].id).update({"cart": true});
                              },

                              child: Container(
                                height: MediaQuery.of(context).size.height / 11,
                                width: MediaQuery.of(context).size.height / 11,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Icon(Icons.shopping_cart_outlined, size: MediaQuery.of(context).size.height / 22,),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
              ],
            );
          }

        }


        print("${snapshot.stackTrace}stack trace");
        print("${snapshot.error}error");
        return const Text("Something went 🧐 wrong");
      },
    );
  }
}



class searchTile extends StatefulWidget {

  final String inputText;

  searchTile({super.key, required this.inputText});

  @override
  State<searchTile> createState() => _searchTile();
}

class _searchTile extends State<searchTile> {
  PageController scrollController = PageController();

  Container AddItem(value) {

    if(value == true){
      return Container(
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(Icons.done_outline, size: MediaQuery.of(context).size.height / 22,),
      );
    }

    else{
      return Container(
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(Icons.shopping_cart_outlined, size: MediaQuery.of(context).size.height / 22,),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    int i = 0;

    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('product').get(),

      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }


        if(snapshot.hasData) {
          return Column(
            children: [

              for(i = 1; i <= snapshot.data!.docs.length; i++)
                if(snapshot.data!.docs[i]['description'].toString().contains(widget.inputText.toLowerCase().toString()) == true)
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ProductPage(snapshot: snapshot, index: i),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                        isScrollControlled: true,
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 12,),
                      // padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: Stack(
                        alignment: Alignment.center,

                        children: [

                          PageView(
                            scrollDirection: Axis.horizontal,

                            controller: scrollController,

                            children: [

                              for(int j = 0; j < snapshot.data!.docs[i]['image_count']; j++)
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot.data!.docs[i]['images'][j]),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context).colorScheme.onSecondary,
                                                spreadRadius: 7
                                            ), // no shadow color set, defaults to black
                                          ]
                                      ),

                                    ),
                                  ],
                                ),

                            ],
                          ),

                          Positioned(
                            top: MediaQuery.of(context).size.height / 2.4,
                            child: SmoothPageIndicator(
                              controller: scrollController,
                              count: snapshot.data!.docs[i]['image_count'],
                              effect: ExpandingDotsEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                spacing: 5.0,
                                activeDotColor: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 12,
                            right: 14,
                            child: (snapshot.data!.docs[i]['fav']) ?
                            IconButton(
                              onPressed: () async {
                                setState(() {});
                                await FirebaseFirestore.instance.collection(
                                    "products").doc(
                                    snapshot.data!.docs[i].id).update({
                                  "fav": false,
                                });
                              },
                              icon: const Icon(
                                  Icons.favorite, color: Colors.redAccent,
                                  size: 40),
                            )
                                :IconButton(
                              onPressed: () async {
                                setState(() {});
                                await FirebaseFirestore.instance.collection(
                                    "products").doc(
                                    snapshot.data!.docs[i].id).update({
                                  "fav": true,
                                });
                              },
                              icon: const Icon(
                                  Icons.favorite_border_sharp, color: Colors.redAccent,
                                  size: 40),
                            ),
                          ),

                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.42,
                            child: Column(
                              children: [

                                const SizedBox(height: 20,),

                                Text(
                                  snapshot.data!.docs[i]['name'],
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  ),
                                ),

                                Text(
                                  '${snapshot.data!.docs[i]['price']} ₹',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height / 40,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: snapshot.data!.docs[i]['cart'] ?
                            Container(
                              height: MediaQuery.of(context).size.height / 16,
                              width: MediaQuery.of(context).size.height / 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Icon(Icons.done_outline, size: MediaQuery.of(context).size.height / 22,),
                            )
                                :InkWell(
                              onTap: () async{
                                setState(() {});
                                await FirebaseFirestore.instance.collection("products").doc(snapshot.data!.docs[i].id).update({"cart": true});
                              },

                              child: Container(
                                height: MediaQuery.of(context).size.height / 16,
                                width: MediaQuery.of(context).size.height / 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10)),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Icon(Icons.shopping_cart_outlined, size: MediaQuery.of(context).size.height / 22,),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),


              if(i == snapshot.data!.docs.length)
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(Get.width * 0.05),
                    child: Text(
                      "Sorry not found 🙄🙏",
                      style: TextStyle(
                        fontSize: Get.width * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Get.theme.colorScheme.onPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

            ],
          );
        }


        print("${snapshot.stackTrace}stack trace");
        print("${snapshot.error}error");
        return const Text("Something went 🧐 wrong");
      },
    );

  }
}