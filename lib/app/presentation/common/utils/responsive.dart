import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  /// Return true when width of device <= 650
  static bool isMobile(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return (_size.width <= 650);
  }

  /// Return true when width of device > 650 and <= 1024
  static bool isTablet(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return (_size.width > 650 && _size.width <= 1024);
  }

  /// Return true when width of device > 1024
  static bool isDesktop(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return (_size.width > 1024);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 650) {
          return mobile;
        } else if (constraints.maxWidth > 650 && constraints.maxWidth <= 1024) {
          return tablet;
        }
        return desktop;
      },
    );
  }
}
