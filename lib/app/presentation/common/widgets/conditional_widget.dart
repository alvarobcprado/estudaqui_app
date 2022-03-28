import 'package:flutter/widgets.dart';

class ConditionalWidget extends StatelessWidget {
  const ConditionalWidget({
    Key? key,
    required this.condition,
    required this.conditionalChild,
    required this.child,
  }) : super(key: key);

  final bool condition;
  final Widget conditionalChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return condition ? conditionalChild : child;
  }
}
