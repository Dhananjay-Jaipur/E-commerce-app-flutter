import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/components/loading.dart';
import 'package:store/components/snakbar.dart';
import 'package:store/models/user.dart';
import 'package:store/pages/loginPages/backend.dart';
import 'package:store/pages/loginPages/forget_pass.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/loginPages/signup.dart';
import 'package:store/models/imagePaths.dart';
import 'package:store/utils/validator.dart';

import '../../components/dilogue.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(BackEnd());

  var _obscureText = true;

  void LoginBackend() async{
    Loading();

    final user = await BackEnd.instace.LoginUserWithEmail(controller.email.text, controller.pass.text);

    final uid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await FirebaseFirestore.instance.collection("/Users/${uid}").where('email', isEqualTo: controller.email.text).snapshots();

    if(user == null){
      myDilogue(title: "user not found 🧐", context: context);
      print("user not found 🧐");
    }

    else{
      // add USER:::
      addData(snapshot);

      mySnakbar('welcome back 😉👍');
      print("congratulation 👍");
      Get.offAll(() => Home(i: 0));
    }
  }

  void addData(userdata)
  {
    setState(() {
      user.Username = userdata["Username"];
      user.email = userdata["email"];
      user.phone_number = userdata["phone_number"];
      user.password = userdata["password"];
      user.profile_picture = userdata["profile_picture"];
    });
  }

  void ChangeText(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      body: Form(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [

              // SKIP BUTTON:::::::
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home(i: 0,)));},
                      child: const Text("skip"),
                    ),
                  ),
                ],
              ),

              // LOGO::::::::
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Column(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.error, BlendMode.srcATop),
                          child: Image(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.height * 0.5,
                            image: const AssetImage(Imagepaths.logo),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Text("SHOP", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),

                        Text("loyalty to royalty", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),

                      ],
                    ),


                  ],
                ),
              ),

               SizedBox(height: 40,),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18),
                 child: Column(
                   children: [
                     TextFormField(
                       controller: controller.email,
                       validator: (value) => Validator().isEmail(value!),
                       autovalidateMode: AutovalidateMode.onUserInteraction,

                       style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),
                       cursorColor: Theme.of(context).colorScheme.onPrimary,

                       decoration: InputDecoration(
                         prefixIcon: const Icon(Icons.email_outlined),
                         hintText: "username or e-mail",
                         border: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(15)),
                         ),
                         fillColor: Theme.of(context).colorScheme.scrim,
                         filled: true,

                         errorStyle: TextStyle(color: Colors.redAccent),
                       ),

                       textInputAction: TextInputAction.next,
                     ),

                     const SizedBox(height: 10,),

                     TextFormField(
                       controller: controller.pass,
                       validator: (value) => Validator().isPass(value!),
                       autovalidateMode: AutovalidateMode.onUserInteraction,

                       style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                       cursorColor: Theme.of(context).colorScheme.onPrimary,
                       obscureText: _obscureText,

                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.password),
                         hintText: "password",
                         suffixIcon: IconButton(
                           onPressed: () {
                             ChangeText();
                           },
                           icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                         ),

                         border: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(15)),
                         ),
                         fillColor: Theme.of(context).colorScheme.scrim,
                         filled: true,

                         errorStyle: TextStyle(color: Colors.redAccent),
                       ),

                       textInputAction: TextInputAction.next,
                     ),

                     Row(
                       children: [
                         TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()));}, child: const Text("forget password ?"),),
                       ],
                     ),

                     const SizedBox(height: 10,),

                     //BUTTON:::::
                     SizedBox(
                         width: double.infinity,
                         height: 60,
                         child: ElevatedButton(
                           onPressed: (){
                             LoginBackend();
                           },
                         child: Text('log-in', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.bold),),
                         ),
                     ),

                     const SizedBox(height: 10,),

                     TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));},
                       child: const Text("create account"),),

                   ],
                 ),
               ),

              const SizedBox(height: 10,),

              // FOOTER:::::
              Column(
                children: [
                  const Row(
                    children: [
                      Flexible(child: Divider()),
                      Text("  or sign-in with  "),
                      Flexible(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        child: IconButton(
                          onPressed: (){
                            BackEnd().SigninWithGoogle();
                          },
                          icon: Image.asset("assets/icon/google.png"),
                        ),
                      ),

                      const SizedBox(width: 5,),

                      SizedBox(
                          height: 70,
                          child: IconButton(onPressed: (){}, icon: Image.asset("assets/icon/communication.png"),)
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}