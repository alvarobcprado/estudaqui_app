import 'package:faeng_courses/app/presentation/common/drawer/my_drawer.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/home/subject_list/subject_list.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: Consumer(
        builder: (context, ref, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  elevation: 5,
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(kMediumBorder),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).home_page_welcome_title),
                        Text(S.of(context).home_page_welcome_message),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: kLargeSpacer),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).subject_list_title),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Divider(thickness: 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kSmallSpacer),
                const SubjectList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
