import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/pages/cart.dart';
import 'package:store/pages/home.dart';

import '../models/imagePaths.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  PageController scrollController = PageController();

  @override
  Widget build(BuildContext context) {
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
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: const DecorationImage(
                                      image: AssetImage(Imagepaths.Product1),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context).colorScheme.shadow,
                                          spreadRadius: 7
                                      ), // no shadow color set, defaults to black
                                    ]
                                ),

                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: const DecorationImage(
                                      image: AssetImage(Imagepaths.Product1),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context).colorScheme.shadow,
                                          spreadRadius: 7
                                      ), // no shadow color set, defaults to black
                                    ]
                                ),

                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: const DecorationImage(
                                      image: AssetImage(Imagepaths.Product1),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context).colorScheme.shadow,
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
                          count: 3,
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
                        child: IconButton(
                            onPressed: (){},
                            icon: false ? Icon(Icons.favorite, color: Theme.of(context).colorScheme.onError,) : Icon(Icons.favorite_border_sharp, color: Theme.of(context).colorScheme.onError, size: 40,)
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
                              "products",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            Text(
                              "2000 ₹",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 50,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "discriptionbjhbtccvbkcxxhhvjcyxcjvjhtxycjvjchchjvj........................................................................................................................................................................................................",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height / 55,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05,
                            ),

                            Wrap(
                              spacing: 2,
                              children: [

                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
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
                                  selected: true,
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i){},
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                ChoiceChip(
                                  label: Text("M"),
                                  selected: false,
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i){},
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                ChoiceChip(
                                  label: Text("L"),
                                  selected: false,
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i){},
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                ChoiceChip(
                                  label: Text("XL"),
                                  selected: false,
                                  selectedColor: Colors.black54,
                                  backgroundColor: Colors.black26,
                                  onSelected: (i){},
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // Quantityselector

                        SizedBox(
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.add_circle_rounded, color: Theme.of(context).colorScheme.onSecondary,),
                            iconSize: 30,
                          ),
                        ),

                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),

                        SizedBox(
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(CupertinoIcons.minus_circle_fill, color: Theme.of(context).colorScheme.onSecondary,),
                            iconSize: 30,
                          ),
                        ),

                      ],
                    ),

                    Spacer(),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .4,
                      child: ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 1)));},
                        style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.onSecondary),
                        child: Text(
                          "2000 ₹",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}