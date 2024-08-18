import 'package:google_sign_in/google_sign_in.dart';
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

  final auth = FirebaseAuth.instance;


  Future<User?> CreateUserWithEmail(String email, String pass) async{
    try{

      Loading();

      final user_credential = await auth.createUserWithEmailAndPassword(email: email, password: pass);

      addUser(first_name.text, last_name.text, email.trim(), pass, phone.text);

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


  //SAVING DATA INTO JSON FORMAT to firebase::::::
  Future addUser(first_name, last_name, email, pass, phone) async{
    try{
      await FirebaseFirestore.instance.collection("Users").add({
        'Username': '$first_name $last_name',
        'email': email,
        'password': pass,
        'phone_number': phone,
      });
    } on FirebaseAuthException catch (e){
       print(e.message.toString());
    }catch(e){
      throw "something went wrong";
    }
  }

}