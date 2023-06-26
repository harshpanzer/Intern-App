import 'package:flutter/material.dart';
import 'package:intern_project/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 36, 30, 30)),
      home: const Home(),
      // initialRoute: "/",
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   "/first": (final context) => const Favourates(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   "/second": (final context) => const Cart(),
      //   "/third": (final context) => const Notifications(),
      // },
    );
  }
}
