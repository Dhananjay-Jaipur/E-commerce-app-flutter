import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/components/snakbar.dart';
import 'package:store/models/imagePaths.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../components/dilogue.dart';
import '../../components/loading.dart';

class BackEnd extends GetxController{
  static BackEnd get instace => Get.find();

  final email = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final pass = TextEditingController();
  final phone = TextEditingController();
  String? profile_picture;

  final auth = FirebaseAuth.instance;

  final ImagePicker _picker = ImagePicker();
  File? _photo;
  Future<String?> uploadPic() async {

    //Get the file from the image picker and store it
    final image = await _picker.pickImage(source: ImageSource.gallery);
    _photo = File(image!.path);

    if (_photo == null) print('image not found');

    String? location;

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_picture/');
      await ref.putFile(_photo!);

      location = await ref.getDownloadURL();

    } catch (e) {
      print('error occured: ${e.toString()}');
    }

    //returns the download url
    return location;
  }

  Future<bool?> AddUser(first_name, last_name, email, pass, phone, profile_picture) async{
    try{
      await FirebaseFirestore.instance.collection("Users").doc(email.toString()).set({
        'Username': '$first_name $last_name',
        'email': email,
        'password': pass,
        'phone_number': phone,
        'profile_picture': profile_picture,
      });
      return true;
    } on FirebaseAuthException catch (e){
      print(e.message.toString());
    }catch(e){
      throw "something went wrong";
    }
  }


  Future<User?> CreateUserWithEmail(String email, String pass) async{
    try{

      await Loading();

      final user_credential = await auth.createUserWithEmailAndPassword(email: email, password: pass);

      return user_credential.user;

    } catch (e){
      print(e.toString());
    }

    return null;
  }

  Future<User?> LoginUserWithEmail(String email, String pass) async{
    try{
      Loading();

      final user_credential = await auth.signInWithEmailAndPassword(email: email, password: pass);

      return user_credential.user;

    } catch (e){
      mySnakbar(e.toString());
      print(e.toString());
    }

    return null;
  }

  Future<UserCredential?> SigninWithGoogle() async{
    try{
      Loading();

      final user_google = await GoogleSignIn().signIn();

      final auth_google = await user_google!.authentication;

      final user_credential = GoogleAuthProvider.credential(idToken: auth_google.idToken, accessToken: auth_google.accessToken);

      return await auth.signInWithCredential(user_credential);

    } catch (e){
      mySnakbar(e.toString());
      print(e.toString());
    }

    return null;
  }

  Future<void> SignoutUser() async{
    try{
      Loading();
      await auth.signOut();
    } catch (e){
      print(e.toString());
    }
  }

}