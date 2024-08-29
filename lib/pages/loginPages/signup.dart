import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/components/animations.dart';
import 'package:store/components/dilogue.dart';
import 'package:store/components/loading.dart';
import 'package:store/models/user.dart';
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

  String? image_link;

  var _obscureText = true;

  var checkedValue = false;


  Future<String?> uploadPic() async {

    final ImagePicker _picker = ImagePicker();
    File? _photo;

    //Get the file from the image picker and store it
    final image = await _picker.pickImage(source: ImageSource.gallery);
    _photo = File(image!.path);

    if (_photo.isNull) print('image not found');

    String? location;

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_picture/');
      await ref.putFile(_photo);

      location = await ref.getDownloadURL();

    } catch (e) {
      print('error occured: ${e.toString()}');
    }

    //returns the download url
    return location;
  }

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

    final User = await BackEnd.instace.CreateUserWithEmail(controller.email.text, cpass.text);

    await BackEnd.instace.AddUser(controller.first_name.text, controller.last_name.text, controller.email.text, cpass.text, controller.phone.text, image_link);

    if(User.isNullOrBlank != true){
      user.Username = '${controller.first_name.text} ${controller.last_name.text}';
      user.email = controller.email.text.toString();
      user.password = controller.pass.text.toString();
      user.phone_number = controller.phone.text.toString();
      user.profile_picture = image_link.toString();


      print("congratulation 👍");
      Get.to(() => LoginAnimatiom());
    }

    myDilogue(title: "something went wrong 🧐", context: context);
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
                              setState(() {
                                image_link = uploadPic() as String;
                                controller.profile_picture = image_link!;
                              });
                            },

                            child: image_link == null ?
                                  CircleAvatar(
                                    radius: MediaQuery.of(context).size.height / 13,
                                    child: Icon(Icons.camera_alt_rounded),
                                  )
                                : CircleAvatar(
                                    radius: MediaQuery.of(context).size.height / 13,
                                    child: Image.network('${image_link}'),
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
                      keyboardType: TextInputType.phone,

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
                            myDilogue(title: "*please agree to terms & condition 🙄", context: context);
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
                      child: IconButton(onPressed: (){
                        myDilogue(title: "this will work 😅 in future", context: context);
                      },
                        icon: Image.asset("assets/icon/google.png"),),
                    ),

                    const SizedBox(width: 5,),

                    SizedBox(
                        height: 70,
                        child: IconButton(onPressed: (){
                          myDilogue(title: "this will work 😅 in future", context: context);
                        }, icon: Image.asset("assets/icon/apple.png"),)
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