import 'package:flutter/material.dart';

class StateResponseView<Loading, Error, Success> extends StatelessWidget {
  StateResponseView({
    Key? key,
    required this.state,
    required this.successWidgetBuilder,
    this.loadingWidgetBuilder,
    this.errorWidgetBuilder,
    this.onTryAgainTap,
  })  : assert(Loading != dynamic),
        assert(Error != dynamic),
        assert(Success != dynamic),
        super(key: key);

  final dynamic state;
  final Function? onTryAgainTap;
  final Widget Function(BuildContext context, Success success)
      successWidgetBuilder;
  final Widget Function(BuildContext context, Error? error)? errorWidgetBuilder;
  final Widget Function(BuildContext context, Loading? loading)?
      loadingWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    if (state == null || state is Loading) {
      if (loadingWidgetBuilder != null) {
        return loadingWidgetBuilder!(context, state);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is Error) {
      if (errorWidgetBuilder != null) {
        return errorWidgetBuilder!(context, state);
      }
      return const Center(
        child: Icon(Icons.error),
      );
    }

    if (state is Success) {
      return successWidgetBuilder(context, state);
    }
    throw UnknownStateTypeException();
  }
}

class UnknownStateTypeException implements Exception {}
