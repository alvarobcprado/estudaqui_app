import 'package:estudaqui/app/presentation/common/extensions/string_capitalize.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticatedHeader extends ConsumerWidget {
  const AuthenticatedHeader({
    Key? key,
    required this.userName,
    this.userPhotoUrl,
  }) : super(key: key);

  final String userName;
  final String? userPhotoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(),
      currentAccountPicture: CircleAvatar(
        backgroundColor: colors.primaryColor,
        radius: kSmallNumber * 5,
        foregroundImage:
            userPhotoUrl != null ? NetworkImage(userPhotoUrl!) : null,
        child: Text(
          userName.forShort(),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: colors.secondaryVariantColor,
          ),
        ),
      ),
      accountName: Text(
        userName.capitalized(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: kLargeNumber,
          fontWeight: FontWeight.bold,
          color: colors.primaryColor,
        ),
      ),
      accountEmail: null,
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: kSmallNumber),
    //   child: SizedBox(
    //     height: kSmallNumber * 20,
    //     width: double.infinity,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         CircleAvatar(
    //           backgroundColor: colors.primaryColor,
    //           radius: kSmallNumber * 5,
    //           child: Text(
    //             userName.forShort(),
    //             style: TextStyle(
    //               fontSize: 28,
    //               fontWeight: FontWeight.w500,
    //               color: colors.secondaryVariantColor,
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: kSmallNumber),
    //         Text(
    //           userName.capitalized(),
    //           maxLines: 2,
    //           overflow: TextOverflow.ellipsis,
    //           style: TextStyle(
    //             fontSize: kLargeNumber,
    //             fontWeight: FontWeight.bold,
    //             color: colors.primaryColor,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
