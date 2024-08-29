import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/components/tiles.dart';
import 'package:store/pages/productPage.dart';
import 'package:store/pages/search.dart';
import '../components/drawer.dart';
import '../components/loading.dart';
import '../models/imagePaths.dart';
import 'checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => CartState();
}

class CartState extends State<Cart> {

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  int quantity = 1;

  int Total(snapshot){
    int total = 0;
    int? p = 0;

    for(int i=0; i<snapshot.data!.docs.length!; i++)
    {
      p = (snapshot.data!.docs[i]['quantity']) * int.parse(snapshot.data!.docs[i]['price']);
      total = total + p!;
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("products").where("cart", isEqualTo: true).get(),

      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        if (snapshot.hasData) {

          if (snapshot.data!.docs.length <= 0){
            return Center(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.01),
                child: Text(
                  "ADD SOMETHING TO CART 😭",
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
            return Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(height: Get.height * 0.015,),

                ListView(
                  children: [
                    for(int i=0; i<snapshot.data!.docs.length; i++)
                      InkWell(
                        onTap: () {
                          setState(() {});
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => ProductPage(snapshot: snapshot, index: i),
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceContainer,
                            isScrollControlled: true,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.06,
                              vertical: 6),
                          // padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(9),
                          ),

                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                height: MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.height * .07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!.docs[i]['images'][0]),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                          spreadRadius: 7),
                                      // no shadow color set, defaults to black
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * .3,
                                    child: Text(
                                      snapshot.data!.docs[i]['name'],
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize:
                                            MediaQuery.of(context).size.height / 45,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '${snapshot.data!.docs[i]['price']} ₹',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height / 50,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  ),
                                ],
                              ),

                              Spacer(),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        quantity++;
                                      });
                                      await FirebaseFirestore.instance
                                          .collection("products").doc(
                                          snapshot.data!.docs[i].id).update(
                                          {"quantity": quantity});
                                    },
                                    icon: Icon(Icons.add_circle_rounded),
                                    iconSize: 30,
                                  ),

                                  Text(
                                    "${snapshot.data!.docs[i]['quantity']}",
                                    style: TextStyle(
                                      fontSize:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height /
                                          40,
                                      fontWeight: FontWeight.bold,
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  ),

                                  (snapshot.data!.docs[i]['quantity'] > 1) ?
                                        IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        quantity--;
                                      });
                                      await FirebaseFirestore.instance
                                          .collection("products").doc(
                                          snapshot.data!.docs[i].id).update(
                                          {"quantity": quantity});
                                    },
                                    icon: const Icon(CupertinoIcons.minus_circle_fill),
                                    iconSize: 30,
                                  )
                                      : IconButton(
                                    onPressed: () async {
                                      setState(() {});
                                      await FirebaseFirestore.instance
                                          .collection("products").doc(
                                          snapshot.data!.docs[i].id).update(
                                          {"quantity": quantity});

                                      await FirebaseFirestore.instance
                                          .collection("products").doc(
                                          snapshot.data!.docs[i].id).update(
                                          {"cart": false});
                                    },
                                    icon: const Icon(Icons.delete),
                                    iconSize: 30,
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),

                // CHECKOUT::::::::
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.09,
                    ),
                    // padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(9),
                    ),

                    child: Row(
                      children: [

                        SizedBox(
                          width: MediaQuery.of(context).size.height * .04,
                        ),

                        Text(
                          "TOTAL :",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 35,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        Spacer(),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .35,
                          child: ElevatedButton(
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(total: Total(snapshot),)));},
                            style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.scrim),
                            child: Text(
                              "${Total(snapshot)} ₹",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.022,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 10,
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
        return const Text("Something went wrong");
      },
    );
  }
}