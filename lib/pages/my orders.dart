import 'package:flutter/material.dart';
import 'package:store/components/tiles.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(14),
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 13,
                    backgroundImage: AssetImage(Imagepaths.user),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

            for(int i=0; i<2; i++)
              orderTile(),

          ],
        ),
      ),
    );
  }
}


class orderTile extends StatelessWidget {
  orderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        bottom: MediaQuery.of(context).size.width * 0.04,
      ),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),

      child: Row(
        children: [

          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * .6,

            child: Column(
              children: [

                Text(
                  "👤  name",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 30,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Text(
                  "📞  phone number",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 30,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider(color: Theme.of(context).colorScheme.secondary,)),

                Text(
                  "🏢  yvcfgjhbjhjknjhkhghjhggjbhgkjhkb",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 40,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),

                  overflow: TextOverflow.ellipsis,
                  maxLines: 3
                ),

              ],
            ),
          ),

          Spacer(),

          Flexible(child: Image.asset('assets/image/Stylish blue.jpg')),
        ],
      ),
    );
  }
}
