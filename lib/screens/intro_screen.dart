import 'package:familiarization/shared/bottom_nav.dart';
import 'package:familiarization/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fitness App')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gym bg.jpg'), fit: BoxFit.cover)),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    'Dare to be great!',
                    style: TextStyle(shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.grey)
                    ], fontSize: 22),
                    textAlign: TextAlign.center,
                  )))),
    );
  }
}
