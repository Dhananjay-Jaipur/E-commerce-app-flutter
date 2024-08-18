import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/components/loading.dart';
import 'package:store/pages/checkout.dart';
import 'package:store/pages/loginPages/authentication/authentication.dart';
import 'package:store/pages/loginPages/forget_pass.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/loginPages/login.dart';
import 'package:store/pages/my%20address.dart';
import 'package:store/pages/productPage.dart';
import 'package:store/pages/profile.dart';
import 'package:store/pages/profileSetting.dart';
import 'package:store/pages/search.dart';
import 'package:store/utils/themes/dark_mode.dart';
import 'package:store/utils/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async{

  final WidgetsBinding wb = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: wb);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
        (FirebaseApp value) => Get.put(Authentication()),
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'website',
        themeMode: ThemeMode.system,
        theme: lightMode,
        darkTheme: darkMode,
        home: Loading(),
    );
  }
}