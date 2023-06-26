import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<int> cartt = ValueNotifier(0);

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _HomeState();
}

class _HomeState extends State<Cart> {
  SharedPreferences? preferences;

  // Future<void> initStorage() async {
  //   preferences = await SharedPreferences.getInstance();
  //   // init 1st time 0
  //   int? savedData = preferences?.getInt("Cart");
  //   if (savedData == null) {
  //     await preferences!.setInt("Cart", cart);
  //   } else {
  //     cart = savedData;
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  cartt.value--;
                });
              },
              child: Text("-")),
          SizedBox(
            width: 20,
          ),
          Text(
            (cartt.value).toString(),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  cartt.value++;
                });
              },
              child: Text("+")),
        ],
      )),
    );
  }
}
