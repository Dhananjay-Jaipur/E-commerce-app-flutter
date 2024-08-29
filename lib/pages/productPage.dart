import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/pages/cart.dart';
import 'package:store/pages/home.dart';

import '../components/loading.dart';
import '../models/imagePaths.dart';

class ProductPage extends StatefulWidget {

  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  final index;

  ProductPage({super.key, required this.snapshot, required this.index});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  var size = [false, false, false, false, false];

  late bool favourite;

  @override
  void initState() {
    favourite = widget.snapshot.data!.docs[widget.index]['fav'];
    super.initState();
  }

  void ChangeSize(String s, int i) async{
    size = [false, false, false, false, false];
    setState(() {
      size[i] = true;
    });
    await FirebaseFirestore.instance.collection("products").doc(
        widget.snapshot.data!.docs[widget.index].id).update({"size": s});
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


  PageController scrollController = PageController();

  @override
  Widget build(BuildContext context) {

    if (widget.snapshot.connectionState == ConnectionState.waiting) {
      return Loading();
    }

    return Container(
      height: MediaQuery.of(context).size.height * .8,
      child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width / 15,
                      bottom: MediaQuery.of(context).size.height * 0.1,
                  ),
                  //padding: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceBright,
                    borderRadius: BorderRadius.circular(9),
                  ),

                  child: Stack(
                    alignment: Alignment.center,

                    children: [

                      PageView(
                        controller: scrollController,

                        children: [

                          for(int i = 0; i < widget.snapshot.data!.docs[widget.index]['image_count']; i++)
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  height: MediaQuery.of(context).size.height / 2.7,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.snapshot.data!.docs[widget.index]['images'][i]),
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
                          count: widget.snapshot.data!.docs[widget.index]['image_count'],
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
                        child: (favourite) ?
                        IconButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance.collection(
                                "products").doc(
                                widget.snapshot.data!.docs[widget.index].id).update({
                              "fav": false,
                            });
                            setState(() {
                              favourite = false;
                            });
                          },
                          icon: const Icon(
                              Icons.favorite, color: Colors.redAccent,
                              size: 40),
                        )
                            :IconButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance.collection(
                                "products").doc(
                                widget.snapshot.data!.docs[widget.index].id).update({
                              "fav": true,
                            });
                            setState(() {
                              favourite = true;
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

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05,
                            ),

                            Text(
                              widget.snapshot.data!.docs[widget.index]['name'],
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            Text(
                              '${widget.snapshot.data!.docs[widget.index]['price']!} ₹',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                widget.snapshot.data!.docs[widget.index]['description'],
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height / 55,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),


                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.09,
                            ),


                            Wrap(
                              spacing: MediaQuery.of(context).size.width * 0.05,
                              children: [
                                ChoiceChip(
                                  padding: EdgeInsets.all(10),
                                  label: Text("",),
                                  backgroundColor: Colors.black,

                                  shape: CircleBorder(),
                                  onSelected: (i){},
                                  selected: false,
                                ),

                                ChoiceChip(
                                  padding: EdgeInsets.all(10),
                                  label: Text("",),
                                  backgroundColor: Colors.redAccent,

                                  shape: CircleBorder(),
                                  onSelected: (i){},
                                  selected: false,
                                ),

                                ChoiceChip(
                                  padding: EdgeInsets.all(10),
                                  label: Text("",),
                                  backgroundColor: Colors.orangeAccent,

                                  shape: CircleBorder(),
                                  onSelected: (i){},
                                  selected: false,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.04,
                            ),

                            Wrap(
                              spacing: MediaQuery.of(context).size.width * 0.05,
                              children: [
                                ChoiceChip(
                                  label: Text("S"),
                                  selected: size[0],
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i) {
                                    ChangeSize("S", 0);
                                  },
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                ChoiceChip(
                                  label: Text("M"),
                                  selected: size[1],
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i) {
                                    ChangeSize("M", 1);
                                  },
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                ChoiceChip(
                                  label: Text("L"),
                                  selected: size[2],
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i) {
                                    ChangeSize("L", 2);
                                  },
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                ChoiceChip(
                                  label: Text("XL"),
                                  selected: size[3],
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i) {
                                    ChangeSize('XL', 3);
                                  },
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.08,
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Divider(),
                            ),

                            Center(
                              child: Text("R A T I N G S", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.42,
                        right: 10,
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.share,
                            size: MediaQuery.of(context).size.height * 0.04,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),


            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                // padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.scrim,
                  borderRadius: BorderRadius.circular(9),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(
                      width: MediaQuery.of(context).size.height * .02,
                    ),

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
                                widget.snapshot.data!.docs[widget.index].id).update(
                                {"quantity": quantity});
                          },
                          icon: Icon(Icons.add_circle_rounded, color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,),
                          iconSize: 30,
                        ),

                        Text(
                          "${quantity}",
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
                                .onPrimary,
                          ),
                        ),

                        (widget.snapshot.data!.docs[widget.index]['quantity'] > 1) ?
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              quantity--;
                            });
                            await FirebaseFirestore.instance
                                .collection("products").doc(
                                widget.snapshot.data!.docs[widget.index].id).update(
                                {"quantity": quantity});
                          },
                          icon: Icon(CupertinoIcons.minus_circle_fill, color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,),
                          iconSize: 30,
                        )
                            : IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.minus_circle_fill, color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,),
                          iconSize: 30,
                        ),

                      ],
                    ),

                    Spacer(),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .35,
                      child: TextButton(
                        onPressed: () async{
                          await FirebaseFirestore.instance.collection("products").doc(widget.snapshot.data!.docs[widget.index].id).update({"cart": true});
                          Get.to(() => Home(i: 1));
                          },
                        style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.onPrimary),
                        child: Text(
                          "${Total(widget.snapshot)} ₹",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}