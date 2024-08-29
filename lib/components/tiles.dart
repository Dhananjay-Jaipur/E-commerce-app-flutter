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
import '../pages/search.dart';

class displayTile extends StatelessWidget {
  displayTile({super.key});

  PageController scrollController = PageController();

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => Search(),
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
              onTap: (){},

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