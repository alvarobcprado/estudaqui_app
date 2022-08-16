import 'package:estudaqui/app/presentation/common/drawer/my_drawer_notifier.dart';
import 'package:estudaqui/app/presentation/common/drawer/widgets/authenticated_header.dart';
import 'package:estudaqui/app/presentation/common/drawer/widgets/my_drawer_tile.dart';
import 'package:estudaqui/app/presentation/common/drawer/widgets/unauthenticated_header.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer(
        builder: (context, ref, _) {
          final colors = ref.watch(themeProvider).colors;
          final myDrawerState = ref.watch(myDrawerNotifierProvider);
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: kMediumNumber),
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  myDrawerState.when(
                    unauthenticated: () => const UnauthenticatedHeader(),
                    logged: (email, username, userPhoto) => AuthenticatedHeader(
                      userName: username ?? '',
                      userPhotoUrl: userPhoto,
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1.25,
                    color: colors.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: kMediumNumber),
              MyDrawerTile(
                isSelected: GoRouter.of(context).location == '/',
                onTap: () {
                  Navigator.of(context).pop();
                  GoRouter.of(context).pushHome();
                },
                title: S.of(context).drawer_options_home,
                icon: const Icon(Icons.home),
              ),
              myDrawerState.when(
                unauthenticated: () => MyDrawerTile(
                  isSelected: false,
                  onTap: () {
                    Navigator.of(context).pop();
                    GoRouter.of(context).pushLogin();
                  },
                  title: S.of(context).drawer_options_signin,
                  icon: const Icon(Icons.login),
                ),
                logged: (_, __, ___) => Column(
                  children: [
                    MyDrawerTile(
                      isSelected: false,
                      onTap: () {
                        Navigator.of(context).pop();
                        GoRouter.of(context).pushUserCourses();
                      },
                      title: 'Meus cursos',
                      icon: const Icon(Icons.person),
                    ),
                    MyDrawerTile(
                      isSelected: false,
                      onTap: () {
                        Navigator.of(context).pop();
                        GoRouter.of(context).pushAddCourse();
                      },
                      title: S.of(context).drawer_options_add_course,
                      icon: const Icon(Icons.add_to_photos),
                    ),
                    MyDrawerTile(
                      isSelected: false,
                      onTap: () {
                        ref
                            .read(myDrawerNotifierProvider.notifier)
                            .signoutCurrentUser()
                            .then(
                              (_) => Fluttertoast.showToast(
                                msg: S.of(context).toast_success_logout,
                              ),
                            );
                      },
                      title: S.of(context).drawer_options_signout,
                      icon: const Icon(Icons.logout),
                    ),
                  ],
                ),
              ),
              MyDrawerTile(
                isSelected: GoRouter.of(context).location == '/app-info',
                onTap: () {
                  Navigator.of(context).pop();
                  GoRouter.of(context).pushAppInfo();
                },
                title: S.of(context).drawer_options_app_info,
                icon: const Icon(Icons.info),
              ),
            ],
          );
        },
      ),
    );
  }
}
