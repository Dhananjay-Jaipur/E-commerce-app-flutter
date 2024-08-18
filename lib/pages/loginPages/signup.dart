import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/components/dilogue.dart';
import 'package:store/components/loading.dart';
import 'package:store/pages/loginPages/backend.dart';
import 'package:store/models/imagePaths.dart';
import 'package:store/utils/validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../home.dart';


class Signup extends StatefulWidget {
   Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final controller = Get.put(BackEnd());

  final cpass = TextEditingController();

  UploadTask? uploadTask;
  File? image;

  var _obscureText = true;

  var checkedValue = false;

  void ChangeBox(){
    setState(() {
      checkedValue = !checkedValue;
    });
  }

  void ChangeText(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void SignupBackend() async{
    Loading();

    final user = await BackEnd.instace.CreateUserWithEmail(controller.email.text, cpass.text);

    if(user == null){
      print("something went wrong 🧐");
    }
    else{
      print("congratulation 👍");
      Get.to(() => Home(i: 0));
    }
  }

  Future UploadFile() async{

    //Create a reference to the location you want to upload to in firebase
    final reference = FirebaseStorage.instance.ref().child("profile_picture/${Imagepaths.user_image}");

    //Upload the file to firebase
    reference.putFile(Imagepaths.user_image!);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        leading: BackButton(
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text("Let's create your account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            const SizedBox(height: 20,),

            // FORM:::::::
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [

                    Center(
                      child: Column(
                        children: [

                          InkWell(
                            onTap: () async{
                              final picture = await ImagePicker().pickImage(source: ImageSource.gallery);

                              setState(() {
                                Imagepaths.user_image = File(picture!.path);
                                UploadFile();
                              });
                            },

                            child: Imagepaths.user_image.isNull ? CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 13,
                              child: Icon(Icons.camera_alt_rounded),
                            ) : CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 13,
                              child: Image.file(Imagepaths.user_image!),
                            ),

                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: controller.first_name,
                            validator: (value) => Validator().isblank(value!),
                            autovalidateMode: AutovalidateMode.onUserInteraction,

                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                            cursorColor: Theme.of(context).colorScheme.onPrimary,

                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "First name",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              fillColor: Theme.of(context).colorScheme.scrim,
                              filled: true,
                              errorStyle: TextStyle(color: Colors.redAccent),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Flexible(
                          child: TextFormField(
                            controller: controller.last_name,

                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                            cursorColor: Theme.of(context).colorScheme.onPrimary,

                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "Last name",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              fillColor: Theme.of(context).colorScheme.scrim,
                              filled: true,
                              errorStyle: TextStyle(color: Colors.redAccent),
                            ),

                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: controller.email,
                      validator: (value) => Validator().isEmail(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,

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
                        errorStyle: TextStyle(color: Colors.redAccent),
                      ),
                      textInputAction: TextInputAction.next,
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: controller.phone,
                      validator: (value) => Validator().isPhoneNumber(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      cursorColor: Theme.of(context).colorScheme.onPrimary,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: "Phone number",
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
                          icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          onPressed: () {
                              ChangeText();
                          },
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

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: cpass,
                      validator: (value) => Validator().isCorrectPass(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      obscureText: _obscureText,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "conform password",
                        suffixIcon: IconButton(
                          icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          onPressed: () {
                            ChangeText();
                          },
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

                    const SizedBox(height: 10,),

                    Row(
                      children: [

                        Checkbox(
                          value: checkedValue,
                          onChanged: (value) => ChangeBox(),
                        ),

                        Text("I agree to", style: TextStyle(color: Theme.of(context).colorScheme.error),),
                        TextButton(onPressed: (){}, child: Text("terms & condition", style: TextStyle(color: Theme.of(context).colorScheme.error, decoration: TextDecoration.underline),),),
                      ],
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: (){
                          if(checkedValue)
                            {
                              SignupBackend();
                            }
                          else
                          {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(content: Text("*please agree to terms & condition", style: TextStyle( color: Theme.of(context).colorScheme.onPrimary),),);
                                }
                            );
                          }
                        },
                        child: Text('create account', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.bold),),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 10,),

            // FOOTER:::::
            Column(
              children: [
                const Row(
                  children: [
                    Flexible(child: Divider()),
                    Text("  or register with  "),
                    Flexible(child: Divider()),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: IconButton(onPressed: (){}, icon: Image.asset("assets/icon/google.png"),),
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
    );
  }
}