import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/components/dilogue.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/loginPages/login.dart';

class KeepLogin extends StatelessWidget {
  const KeepLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              myDilogue(title: "something get 🧐 sucks", context: context);
              return Login();
            }
            else{
              if(snapshot.data == null)
                {return Login();}
              else
                {return Home(i: 0);}
            }
          }
      ),
    );
  }
}
