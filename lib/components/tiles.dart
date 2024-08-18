import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/components/dilogue.dart';
import 'package:store/components/snakbar.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/productPage.dart';
import 'package:get/get.dart';
import '../models/imagePaths.dart';


class favTile extends StatelessWidget {
  favTile({super.key});

  PageController scrollController = PageController();

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => ProductPage(),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          isScrollControlled: true,
        );
      },

      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 20, left: 22, right: 22),
        // padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.height / 2.7,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(9),
        ),

        child: Stack(
          alignment: Alignment.center,

          children: [

            // IMAGE:::::
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

                  const SizedBox(height: 20,),

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
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 1)));},
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
    );
  }
}

class cartTile extends StatelessWidget {
  cartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => ProductPage(),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          isScrollControlled: true,
        );
      },

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06, vertical: 6),
        // padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(9),
        ),

        child: Row(
          children: [

            SizedBox(width: 10,),

            Container(
              margin: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * .07,
              width: MediaQuery.of(context).size.height * .07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                    image: AssetImage(Imagepaths.Product1),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.shadow,
                        spreadRadius:
                            7), // no shadow color set, defaults to black
                  ]),
            ),

            SizedBox(width: 10,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "products",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),

                Text(
                  "2000 ₹",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 50,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),

            Spacer(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add_circle_rounded),
                  iconSize: 30,
                ),

                Text(
                  "4",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),

                IconButton(
                  onPressed: (){},
                  icon: false ? Icon(CupertinoIcons.minus_circle_fill) : Icon(Icons.delete),
                  iconSize: 30,
                ),

              ],
            ),

          ],
        ),

      ),
    );
  }
}

class checkoutTile extends StatelessWidget {
  checkoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02,),
      // padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(9),
      ),

      child: Row(
        children: [

          SizedBox(width: 10,),

          Container(
            margin: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * .07,
            width: MediaQuery.of(context).size.height * .07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                  image: AssetImage(Imagepaths.Product1),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      spreadRadius: 7,
                      ), // no shadow color set, defaults to black
                ]),
          ),

          Spacer(),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                "2 ✖️ ",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "products",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
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
                ],
              ),
            ],
          ),

          SizedBox(width: 30,),

        ],
      ),

    );
  }
}

class addressTile extends StatelessWidget {
  addressTile({super.key});

  TextEditingController textControler = TextEditingController();

  void DilogBox(text, context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        content: TextField(
          controller: textControler,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
            suffixIcon: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.done_outline, color: Theme.of(context).colorScheme.primary,)),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "👤  name",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(
                onPressed: (){
                  DilogBox("edit it...", context);
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "📞  phone number",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.width / 25,),

          SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider()),

          SizedBox(height: MediaQuery.of(context).size.width / 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "⛓️  street",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "📍  pin code",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌆  city",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🗺️  state",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌍  country",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.width / 25,),

        ],
      ),
    );
  }
}

class displayTile extends StatelessWidget {
  displayTile({super.key});

  PageController scrollController = PageController();

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => ProductPage(),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          isScrollControlled: true,
        );
      },

      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 20, left: MediaQuery.of(context).size.width / 10, right: MediaQuery.of(context).size.width / 10),
        // padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.height / 6,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(9),
        ),

        child: Stack(
          alignment: Alignment.center,

          children: [

            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage()));},

              child: Column(
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

                  SmoothPageIndicator(
                    controller: scrollController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      spacing: 5.0,
                      activeDotColor: Theme.of(context).colorScheme.error,
                    ),
                  ),

                ],
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

                  const SizedBox(height: 20,),

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
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 1)));},

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
    );
  }
}