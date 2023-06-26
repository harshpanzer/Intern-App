import 'package:flutter/material.dart';
import 'package:intern_project/cart.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
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
