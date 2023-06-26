import 'package:flutter/material.dart';
import 'package:intern_project/Home.dart';
import 'package:intern_project/cart.dart';

class Favourates extends StatefulWidget {
  const Favourates({super.key});

  @override
  State<Favourates> createState() => _FavouratesState();
}

class _FavouratesState extends State<Favourates> {
  @override
  Widget build(BuildContext context) {
    debugPrint(cart.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
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
