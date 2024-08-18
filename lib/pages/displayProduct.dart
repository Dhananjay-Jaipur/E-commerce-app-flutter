import 'package:flutter/material.dart';
import 'package:store/components/tiles.dart';

import '../components/drawer.dart';

class DisplayProduct extends StatelessWidget {
  const DisplayProduct({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: myDrawer(),

      body: Column(
        children: [

          Column(
            children: [

              SizedBox(height: 20,),

              Text("FAVOURITE ❤️", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary)),

              Padding(
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
                    fillColor: Theme.of(context).colorScheme.shadow,
                    filled: true,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    hintText: " 🍸 filter",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    fillColor: Theme.of(context).colorScheme.shadow,
                    filled: true,
                    hintStyle: TextStyle(fontSize: 24),
                  ),

                  onChanged: (value){},

                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),

                ),
              ),
            ],
          ),

          Stack(
            alignment: Alignment.center,
            children: [

              ListView(
                children: [
                  displayTile(),
                  displayTile(),
                  displayTile(),
                  displayTile(),
                  displayTile(),
                  displayTile(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
