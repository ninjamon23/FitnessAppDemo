import 'package:familiarization/shared/bottom_nav.dart';
import 'package:familiarization/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: const Center(child: FlutterLogo()),
    );
  }
}