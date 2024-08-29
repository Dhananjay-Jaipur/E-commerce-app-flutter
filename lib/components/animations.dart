import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store/pages/home.dart';


class OrderPlacedAnimatiom extends StatelessWidget {
  OrderPlacedAnimatiom({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 4),
              () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(i: 0)),
                  (route) => false,
            );
          },
        ),
        builder: (context, snapshot) {
          return Center(
            child: Lottie.asset("assets/animations/order.json"),
          );
        }

    );
  }
}


class LoginAnimatiom extends StatelessWidget {
  LoginAnimatiom({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 9),
              () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(i: 0)),
                  (route) => false,
            );
          },
        ),
        builder: (context, snapshot) {
          return Center(
            child: Lottie.asset("assets/animations/login_animation.json"),
          );
        }

    );
  }
}
