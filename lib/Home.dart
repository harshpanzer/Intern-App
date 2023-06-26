import 'package:flutter/material.dart';
import 'package:intern_project/cart.dart';
import 'package:intern_project/favourates.dart';
import 'package:intern_project/notifications.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'customnavbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int notif = 0;
int cart = 0;
int fav = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 1);
    List<PersistentBottomNavBarItem> navBarItems() {
      return [
        PersistentBottomNavBarItem(
          // onPressed: (BuildContext) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const Favourates()),
          //   );
          // },
          icon: const Icon(Icons.favorite),
          title: "Favourates",
          activeColorPrimary: Color.fromARGB(228, 39, 219, 228),
          inactiveColorPrimary: Color.fromARGB(255, 55, 97, 175),
        ),
        PersistentBottomNavBarItem(
          // onPressed: (BuildContext) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const Cart()),
          //   );
          // },
          icon: const Icon(Icons.shopping_cart),
          title: "Cart",
          activeColorPrimary: Color.fromARGB(228, 39, 219, 228),
          inactiveColorPrimary: Color.fromARGB(255, 55, 97, 175),
        ),
        PersistentBottomNavBarItem(
          // onPressed: (BuildContext) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const Notifications()),
          //   );
          // },
          icon: const Icon(Icons.notifications),
          title: "Notifications",
          activeColorPrimary: Color.fromARGB(228, 39, 219, 228),
          inactiveColorPrimary: const Color.fromARGB(255, 55, 97, 175),
        )
      ];
    }

    //   return PersistentTabView(
    //     context,
    //     screens: screens(),
    //     items: navBarItems(),
    //     controller: _controller,
    //     confineInSafeArea: true,
    //     backgroundColor: Color.fromARGB(255, 36, 57, 175),
    //     handleAndroidBackButtonPress: true,
    //     resizeToAvoidBottomInset: true,
    //     stateManagement: true,
    //     hideNavigationBarWhenKeyboardShows: true,
    //     decoration: NavBarDecoration(
    //       colorBehindNavBar: Colors.white,
    //     ),
    //     popAllScreensOnTapOfSelectedTab: true,
    //     popActionScreens: PopActionScreensType.all,
    //     itemAnimationProperties: ItemAnimationProperties(
    //       duration: Duration(milliseconds: 200),
    //       curve: Curves.ease,
    //     ),
    //     screenTransitionAnimation: ScreenTransitionAnimation(
    //       animateTabTransition: true,
    //       curve: Curves.ease,
    //       duration: Duration(milliseconds: 200),
    //     ),
    //     navBarStyle: NavBarStyle.style6,
    //   );
    // }

    return PersistentTabView.custom(
      context,
      controller: _controller,
      itemCount: 3,
      screens: screens(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      onWillPop: (final context) async {
        await showDialog(
          context: this.context,
          useSafeArea: true,
          builder: (BuildContext context) => Container(
            height: 50,
            width: 50,
            color: Colors.white,
            child: ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
        return false;
      },
      customWidget: CustomNavBarWidget(
        items: navBarItems(),
        selectedIndex: _controller.index,
        onItemSelected: (index) {
          setState(() {
            _controller.index = index;
          });
        },
      ),
    );
  }

  List<Widget> screens() {
    return [Favourates(), Cart(), Notifications()];
  }
}
