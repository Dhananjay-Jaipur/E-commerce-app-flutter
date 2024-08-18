import 'package:cloud_firestore/cloud_firestore.dart';
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
  Widget build(BuildContext context) {

   // final p = context.watch<ShopProduct>().shopItems;

    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("products").get(),
      
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        if (snapshot.hasData) {
          return ListView.builder(
            // creating list:::::
            itemBuilder: (context, index) {
              for (int i = 0; i < snapshot.data!.docs.length; i++)
              {
                return shopTile(productData: snapshot.data!.docs[i],);
              }
            }
          );
        }
        
        
        print("${snapshot.stackTrace}stack trace");
        print("${snapshot.error}error");
        return const Text("Something went wrong");
      },
    );
    
  }
}





// ============ TILE ===============

class shopTile extends StatefulWidget {

  dynamic productData;

  shopTile({required QueryDocumentSnapshot<Map<String, dynamic>> productData, super.key});

  @override
  State<shopTile> createState() => _shopTileState();
}

class _shopTileState extends State<shopTile> {

  PageController scrollController = PageController();

  bool item_added = false;

  Container AddItem(){

    if(item_added == true){

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
        margin: const EdgeInsets.only(top: 30, bottom: 20, left: 22),
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
                      image: DecorationImage(
                        image: NetworkImage("https://oyster.ignimgs.com/mediawiki/apis.ign.com/the-legend-of-zelda-breath-of-the-wild-2/3/38/Link2.png"),
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
                    widget.productData['name'],
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),

                  Text(
                    widget.productData['price'],
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
                onTap: (){
                  setState(() {
                    item_added = !item_added;
                  });
                },
                child: AddItem(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}