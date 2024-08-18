import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/components/drawer.dart';
import 'package:store/models/user.dart';
import 'package:store/pages/shop.dart';
import 'package:store/utils/globalKeys.dart';
import 'package:store/models/imagePaths.dart';

import '../components/tiles.dart';

class Search extends StatelessWidget {
   Search({super.key});

   var favKey = GlobalKey();

   BuildContext passKey() {
     return favKey.currentContext!;
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
              onPressed: () {Navigator.pop(context);},
            ),

            expandedHeight: MediaQuery.of(context).size.height / 4,
            iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),

            // IF YOU WANT TO ADD IMAGE IN THE BG::::::::
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
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20,),),

          SliverToBoxAdapter(
            child: Center(child: Text("CATEGORY", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary))),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 10,),),

          SliverToBoxAdapter(
            child: Categories()
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20,),),

          SliverToBoxAdapter(
            key: favKey,
            child: Center(child: Text("FAVOURITE ❤️", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary))),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          SliverList.list(
            children: [
              favTile(),
              favTile(),
            ],
          ),

        ],
      ),
    );
  }
}


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('categories').get(),
      builder: (context, snapshot) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < snapshot.data!.docs.length; i++)
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width / 5,
              width: MediaQuery.of(context).size.width / 2.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Text(snapshot.data!.docs[i]['name'],
                    style: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).colorScheme.onSecondary)),
              ),
            )
        ],
      ),
    );

  }
}
