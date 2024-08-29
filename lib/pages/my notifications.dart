import 'package:flutter/material.dart';
import 'package:store/components/tiles.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class MyNotifications extends StatelessWidget {
  MyNotifications({super.key});


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
              notificationTile(),

          ],
        ),
      ),
    );
  }
}


class notificationTile extends StatelessWidget {
  notificationTile({super.key});

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

          Flexible(
              child: Icon(
                Icons.notifications_active_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: MediaQuery.of(context).size.width * .05,
              )
          ),

          SizedBox(width: 10,),

          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * .6,

            child: Text(
              "you order is delivered on 12:20 pm, [12-7-2024]",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 30,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),


        ],
      ),
    );
  }
}
