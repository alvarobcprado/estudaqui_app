import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/module_form/module_form_notifier.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class ModuleTextDialog extends StatelessWidget {
  const ModuleTextDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.all(kSmallPadding),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).add_module_text_dialog_title,
                            ),
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.topRight,
                          onPressed: () => Routemaster.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: ref.watch(moduleTextProvider),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onChanged: (value) => ref
                          .read(moduleTextProvider.notifier)
                          .update((state) => state = value),
                      maxLines: null,
                      expands: true,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref
                          .read(formBuilderKeyProvider)
                          .currentState
                          ?.fields['courseModuleTextField']
                          ?.didChange(ref.read(moduleTextProvider));

                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).add_module_text_confirm_button),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
