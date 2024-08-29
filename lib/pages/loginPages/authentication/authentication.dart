import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:store/components/dilogue.dart';
import 'package:store/components/snakbar.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/loginPages/login.dart';
import 'package:store/pages/loginPages/signup.dart';

import '../../search.dart';

class Authentication extends GetxController{
  static Authentication get instance => Get.find();

  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;

  final connectivity = Connectivity();

  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    isConnected;
  }

  // CHECK INTERNET :::::
  void isConnected() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;

    try{
      if (isConnected){}
      else{
        mySnakbar("check internet connection 🙏");
        print("check internet connection");
      }
    } on PlatformException catch(e) {}
  }

  screenRedirect() async{
    deviceStorage.isNullOrBlank != true ? Get.offAll(() => Login()) : Get.offAll(() => Home(i: 0));
  }
}