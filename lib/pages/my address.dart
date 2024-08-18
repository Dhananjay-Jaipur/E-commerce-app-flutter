import 'package:flutter/material.dart';
import 'package:store/components/tiles.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class MyAddress extends StatelessWidget {
  MyAddress({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){Navigator.pop(context);},
        ),
        centerTitle: true,
        title: Text("my address", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
        // flexibleSpace: const Image(
        //   image: AssetImage('asset/ae15d75a7b430dea3857b89e5df5fc63.jpg'),
        //   fit: BoxFit.contain,
        // ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            SizedBox(height: MediaQuery.of(context).size.width / 13,),

            Center(
              child: Column(
                children: [

                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 13,
                    backgroundImage: AssetImage(Imagepaths.user),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width / 30,),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.width / 13,),

            SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider()),

            SizedBox(height: MediaQuery.of(context).size.width / 20,),

            for(int i=0; i<2; i++)
              addressTile(),

            SizedBox(height: MediaQuery.of(context).size.width / 25,),

            InkWell(
              onTap: (){},
              child: Text(
                "add new",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 43,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent,
                ),
              ),

            ),

            SizedBox(height: MediaQuery.of(context).size.width / 25,),
          ],
        ),
      ),
    );
  }
}
