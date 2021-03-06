import 'package:familiarization/shared/bottom_nav.dart';
import 'package:familiarization/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:vxstate/vxstate.dart';

import '../main.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String result = '';
  bool isMetric = false;
  bool isImperial = false;
  double? height;
  double? weight;
  String heightMessage = '';
  String weightMessage = '';

  late List<bool> isSelected;

  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Define when this widget should re render
    VxState.watch(context, on: [Increment, Decrement]);
    // VxState.listen(context, to: [Increment]);

    // Get access to the store

    heightMessage =
        'Please enter your height in ${isMetric ? 'meters' : 'inches'}';
    weightMessage =
        'Please enter your weight in ${isMetric ? 'kilos' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ToggleButtons(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Metric',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Imperial',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                  isSelected: isSelected,
                  onPressed: toggleMeasure,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage),
                ),
              ),
              ElevatedButton(
                onPressed: calculateBMI,
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Increment();
                    // print('Count from store is ${store.count}');
                  },
                  child: const Text(
                    'Increase Counter from VxState',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Decrement();
                    // print('Count from store is ${store.count}');
                  },
                  child: const Text(
                    'Decrease Counter from VxState',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Text(result)
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    isMetric = false;
    if (value == 0) {
      isMetric = true;
    }
    isImperial = !isMetric;
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void calculateBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your calculated BMI is ${bmi.toStringAsFixed(2)}';
    });
  }

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }
}
