import 'package:flutter/material.dart';
import 'package:store/components/drawer.dart';
import 'package:store/components/tiles.dart';
import 'package:store/pages/my%20address.dart';
import 'package:store/pages/profileSetting.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: BackButton(
                  onPressed: () {Navigator.pop(context);},
                ),

                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),

                expandedHeight: MediaQuery.of(context).size.height / 4,
                iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),

                // IF YOU WANT TO ADD IMAGE IN THE BG::::::::
                flexibleSpace: Stack(
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 13,
                        backgroundImage: AssetImage(Imagepaths.user),
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
                            "️user@gmail.com 🔥",
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

              const SliverToBoxAdapter(child: SizedBox(height: 20,),),

              SliverToBoxAdapter(
                child: Center(child: Text("Total 👉  5000 ₹", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.08, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary))),
              ),

              SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).size.height * 0.02)),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 15,),
                  child: Column(
                    children: [
                      for(int i=0; i<2; i++)
                        checkoutTile(),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02,),
                        // padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(9),
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(width: 30,),

                            Text(
                              "delivery️  🚚",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            Spacer(),

                            Text(
                              "120 ₹",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            SizedBox(width: 30,),

                          ],
                        ),

                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02,),
                        // padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(9),
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(width: 30,),

                            Text(
                              "GST 📈😭",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            Spacer(),

                            Text(
                              "3.6 ₹",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),

                            SizedBox(width: 30,),

                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("address 🗺️", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 25, color: Theme.of(context).colorScheme.onSecondary)),

                          TextButton(
                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddress()));},
                              child: Text("add new", style: TextStyle(color: Colors.blueAccent),)
                          ),
                        ],
                      ),

                      addressTile(),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("payment 🪙", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 25, color: Theme.of(context).colorScheme.onSecondary)),
                        ],
                      ),

                      Container(
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
                                  "CASH  💸",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),

                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.onPrimary,),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.12,),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * .03,
            left: 0,
            right: 0,

            child: InkWell(
              onTap: (){},

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                child: Center(child: Text("place-order 📦", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, color: Theme.of(context).colorScheme.primary))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
