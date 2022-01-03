import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Login'),
                  onTap: () => Routemaster.of(context).pushLogin(),
                ),
              ],
            ),
          ),
          body: const Center(
            child: Text('home page'),
          ),
        );
      },
    );
  }
}
