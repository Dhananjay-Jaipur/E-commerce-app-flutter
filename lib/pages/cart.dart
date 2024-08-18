import 'package:flutter/material.dart';
import 'package:store/components/tiles.dart';
import '../components/drawer.dart';
import 'checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    // final p = context.watch<ShopProduct>().shopItems;

    final controlerPage = PageController();

    return Stack(
      alignment: Alignment.center,
      children: [
        ListView(
          children: [
            cartTile(),
            cartTile(),
            cartTile(),
            cartTile(),
          ],
        ),

        // CHECKOUT::::::::
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.02,
          right: 0,
          left: 0,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09,
            ),
            // padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(9),
            ),

            child: Row(
              children: [

                SizedBox(
                  width: MediaQuery.of(context).size.height * .04,
                ),

                Text(
                  "TOTAL :",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                Spacer(),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .4,
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));},
                    style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.scrim),
                    child: Text(
                      "2000 ₹",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
