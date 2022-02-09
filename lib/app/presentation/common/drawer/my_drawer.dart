import 'package:faeng_courses/app/presentation/common/drawer/my_drawer_models.dart';
import 'package:faeng_courses/app/presentation/common/drawer/my_drawer_notifier.dart';
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
    final tileIndex = IndexedPage.of(context).index;
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
                              myDrawerState.username?.isEmpty ?? true
                                  ? myDrawerState.email
                                  : myDrawerState.username!,
                            )
                        : S.of(context).drawer_header_unauthenticated_title,
                  ),
                ),
                ListTile(
                  selected: tileIndex == 0,
                  onTap: () {
                    Routemaster.of(context)
                      ..pop()
                      ..pushHome();
                  },
                  leading: const Icon(Icons.home),
                  title: Text(S.of(context).drawer_options_home),
                ),
                ListTile(
                  selected: tileIndex == 1,
                  onTap: () {
                    Routemaster.of(context)
                      ..pop()
                      ..pushTest();
                  },
                  leading: const Icon(Icons.error),
                  title: Text(S.of(context).drawer_options_test),
                ),
                if (myDrawerState is LoggedUser)
                  ListTile(
                    selected: tileIndex == 2,
                    onTap: () {
                      Routemaster.of(context)
                        ..pop()
                        ..pushAddCourse();
                    },
                    leading: const Icon(Icons.add_to_photos),
                    title: Text(S.of(context).drawer_options_add_course),
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
