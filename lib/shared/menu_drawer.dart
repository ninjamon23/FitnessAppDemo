import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<String> menuTitles = ['Home', 'BMI Calculator', 'Weather', 'Training'];
    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.lightGreen),
        child: Text(
          'Flutter Fitness App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        )));
    for (var element in menuTitles) {
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 19),
        ),
        onTap: () {},
      ));
    }

    return menuItems;
  }
}
