import 'package:flutter/material.dart';
import 'package:store/models/imagePaths.dart';

import '../home.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {

    var checkedValue = false;

    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        leading: BackButton(
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text("Forget password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
      ),

      body: Column(
        children: [

          const SizedBox(height: 40,),

          // FORM:::::::
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [

                  Text("we'll sent a link to email to reset password", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),

                  const SizedBox(height: 10,),

                  TextField(
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    cursorColor: Theme.of(context).colorScheme.onPrimary,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "e-mail",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      fillColor: Theme.of(context).colorScheme.scrim,
                      filled: true,
                    ),
                  ),

                  const SizedBox(height: 10,),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 0,)));
                      },
                      child: Text('submit', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.bold),),
                    ),
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