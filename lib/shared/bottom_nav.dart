import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: buildBottomNav(context), onTap: (int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/bmi');
          break;
        case 2:
          Navigator.pushNamed(context, '/weather');
          break;
      }
    },);
  }

  List<BottomNavigationBarItem> buildBottomNav(BuildContext context) {
    List<String> menuItems = ['Home', 'BMI Calculator', 'Weather'];
    List<BottomNavigationBarItem> menu = [];
    for (var element in menuItems) {
      switch (element) {
        case 'Home':
          menu.add(const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'));
          break;
        case 'BMI Calculator':
          menu.add(const BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight), label: 'BMI Calculator'));
          break;
        case 'Weather':
          menu.add(const BottomNavigationBarItem(
              icon: Icon(Icons.sunny_snowing), label: 'Weather'));
          break;
        default:
      }
    }

    return menu;
  }
}
