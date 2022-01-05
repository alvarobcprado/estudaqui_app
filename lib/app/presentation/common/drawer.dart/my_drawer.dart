import 'package:faeng_courses/app/presentation/common/drawer.dart/my_drawer_models.dart';
import 'package:faeng_courses/app/presentation/common/drawer.dart/my_drawer_notifier.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:faeng_courses/generated/l10n.dart';
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
            final myColors = ref.watch(themeProvider).colors;
            final myDrawerState = ref.watch(myDrawerNotifierProvider);
            return ListView(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(kLargePadding),
                  alignment: Alignment.center,
                  color: myColors.myDrawerHeaderBackground,
                  child: Text(
                    myDrawerState is LoggedUser
                        ? S.of(context).drawer_header_authenticated_title(
                              myDrawerState.username ?? myDrawerState.email,
                            )
                        : S.of(context).drawer_header_unauthenticated_title,
                  ),
                ),
                myDrawerState is LoggedUser
                    ? ListTile(
                        onTap: () => ref
                            .read(myDrawerNotifierProvider.notifier)
                            .signoutCurrentUser(),
                        leading: const Icon(Icons.logout),
                        title: Text(S.of(context).drawer_options_signout),
                      )
                    : ListTile(
                        onTap: () => Routemaster.of(context)
                          ..pop()
                          ..pushLogin(),
                        leading: const Icon(Icons.login),
                        title: Text(S.of(context).drawer_options_signin),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
