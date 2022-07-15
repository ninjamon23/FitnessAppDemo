import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/FormReview_Bloc.dart';
import '../shared/bottom_nav.dart';
import '../shared/menu_drawer.dart';

class FormView extends StatelessWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormReviewBloc formBloc = Provider.of<FormReviewBloc>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: <Widget>[
            Center(
              child: Text(formBloc.counter.toString()),
            ),
            const IncrementWidget(),
            const DecrementWidget()
          ]),
        ));
  }

  void increment() {}
}

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormReviewBloc formBloc = Provider.of<FormReviewBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            formBloc.increment();
          },
          child: const Text('Increment')),
    );
  }
}

class DecrementWidget extends StatelessWidget {
  const DecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormReviewBloc formBloc = Provider.of<FormReviewBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            formBloc.decrement();
          },
          child: const Text('Decrement')),
    );
  }
}
