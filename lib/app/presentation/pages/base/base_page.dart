import 'package:faeng_courses/app/presentation/common/my_drawer.dart/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = IndexedPage.of(context);
    final selectedIndex = pageState.index;
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          // Uso de Stack com Offstage e TickerMode para preservar o estado das
          // paginas indexadas, ocultando a pagina e desabilitando as
          // animacoes quando ela nao estiver visivel
          appBar: AppBar(),
          drawer: const MyDrawer(),
          body: Stack(
            fit: StackFit.expand,
            children: List<Widget>.generate(
              pageState.stacks.length,
              (index) {
                final active = index == selectedIndex;
                return Offstage(
                  offstage: !active,
                  child: TickerMode(
                    enabled: active,
                    child: PageStackNavigator(
                      key: ValueKey(index),
                      stack: pageState.stacks[index],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
