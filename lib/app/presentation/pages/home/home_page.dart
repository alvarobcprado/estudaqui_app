import 'package:faeng_courses/app/presentation/pages/home/home_drawer.dart/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const HomeDrawer(),
          body: const Center(
            child: Text('home page'),
          ),
        );
      },
    );
  }
}
