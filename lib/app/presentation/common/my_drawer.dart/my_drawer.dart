import 'package:faeng_courses/app/presentation/common/my_drawer.dart/my_drawer_models.dart';
import 'package:faeng_courses/app/presentation/common/my_drawer.dart/my_drawer_notifier.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Consumer(
          builder: (context, ref, _) {
            final myDrawerState = ref.watch(myDrawerNotifierProvider);
            return ListView(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(kLargePadding),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text(
                    myDrawerState is LoggedUser
                        ? 'Bem vindo - ${myDrawerState.email}'
                        : 'FaEng Courses App',
                  ),
                ),
                myDrawerState is LoggedUser
                    ? ListTile(
                        onTap: () => ref
                            .read(myDrawerNotifierProvider.notifier)
                            .signoutCurrentUser(),
                        leading: const Icon(Icons.logout),
                        title: const Text('Sign out'),
                      )
                    : ListTile(
                        onTap: () => Routemaster.of(context)
                          ..pop()
                          ..pushLogin(),
                        leading: const Icon(Icons.login),
                        title: const Text('Sign in'),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
