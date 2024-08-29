import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/components/loading.dart';
import 'package:store/models/imagePaths.dart';
import 'package:store/pages/productPage.dart';
import '../components/drawer.dart';
import '../components/tiles.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  PageController pageController = PageController();

  bool? f;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("products").where("window", isEqualTo: true).get(),
      
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ProductPage(snapshot: snapshot, index: index,),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                        isScrollControlled: true,
                      );
                      // to refresh page....
                      setState(() {});
                    },

                    child: Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 20, left: 22),
                      // padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.height / 2.7,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: Stack(
                        alignment: Alignment.center,

                        children: [

                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height / 2.7,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!.docs[index]['images'][0]),
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

                          Positioned(
                            top: 12,
                            right: 14,
                            child: (snapshot.data!.docs[index]['fav']) ?
                                IconButton(
                                    onPressed: () async {
                                      setState(() {});
                                      await FirebaseFirestore.instance.collection(
                                          "products").doc(
                                          snapshot.data!.docs[index].id).update({
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
                                    snapshot.data!.docs[index].id).update({
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

                                Container(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Text(
                                    snapshot.data!.docs[index]['name'],
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: MediaQuery.of(context).size.height / 35,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                Text(
                                  '${snapshot.data!.docs[index]['price']} ₹',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height / 45,
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
                            child: snapshot.data!.docs[index]['cart'] ?
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
                                await FirebaseFirestore.instance.collection("products").doc(snapshot.data!.docs[index].id).update({"cart": true});
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
          );
        }
        
        
        print("${snapshot.stackTrace}stack trace");
        print("${snapshot.error}error");
        return const Text("Something went wrong");
      },
    );
    
  }
}
