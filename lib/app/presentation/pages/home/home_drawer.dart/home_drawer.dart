import 'package:faeng_courses/app/presentation/pages/home/home_drawer.dart/home_drawer_models.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_drawer.dart/home_drawer_notifier.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Consumer(
          builder: (context, ref, _) {
            final homeDrawerState = ref.watch(homeDrawerNotifierProvider);
            return ListView(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text(
                    homeDrawerState is LoggedUser
                        ? 'Bem vindo - ${homeDrawerState.email}'
                        : 'FaEng Courses App',
                  ),
                ),
                homeDrawerState is LoggedUser
                    ? ListTile(
                        onTap: () => ref
                            .read(homeDrawerNotifierProvider.notifier)
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
