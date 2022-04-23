import 'package:faeng_courses/app/presentation/common/drawer/my_drawer.dart';
import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(),
    );
  }
}
