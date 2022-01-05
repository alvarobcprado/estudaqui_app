import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionHandler<T> extends StatelessWidget {
  const ActionHandler({
    Key? key,
    required this.child,
    required this.actionProvider,
    required this.ref,
    required this.onReceived,
  }) : super(key: key);

  final Widget child;
  final ProviderListenable<T> actionProvider;
  final WidgetRef ref;
  final void Function(T? previousState, T newState) onReceived;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        ref.listen<T>(
          actionProvider,
          onReceived,
        );
        return child;
      },
    );
  }
}
