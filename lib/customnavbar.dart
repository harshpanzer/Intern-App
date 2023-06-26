import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:intern_project/cart.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget(
      {required this.selectedIndex,
      required this.items,
      required this.onItemSelected,
      key})
      : super(key: key);

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(children: [
            Material(
              child: IconTheme(
                data: IconThemeData(
                    size: 26.0,
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary == null
                            ? item.activeColorPrimary
                            : item.inactiveColorPrimary),
                child: item.icon,
              ),
            ),
            Positioned(
              left: 9,
              bottom: 5,
              child: ValueListenableBuilder(
                valueListenable: cartt,
                builder: (BuildContext context, value, Widget? child) =>
                    badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 0),
                  // badgeAnimation: badges.BadgeAnimation.slide(
                  //   // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                  //   //curve: Curves.easeInCubic,
                  // ),
                  showBadge: true,
                  badgeStyle: badges.BadgeStyle(),
                  badgeContent: Text(
                    value.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            )
          ]),
          // Container(
          //   child: GestureDetector(child: Text(cart.toString())),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title.toString(),
                style: TextStyle(
                    color: Colors.black,
                    // color: isSelected
                    //     ? (item.activeColorSecondary == null
                    //         ? item.activeColorPrimary
                    //         : item.activeColorSecondary)
                    //     : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((item) {
            int index = widget.items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.widget.onItemSelected(index);
                },
                child: _buildItem(item, widget.selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
