import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCourseContentDialog extends ConsumerWidget {
  const AddCourseContentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                ref
                    .read(formBuilderKeyProvider)
                    .currentState
                    ?.fields['courseModuleTextField']
                    ?.didChange(
                      ref.read(courseContentProvider),
                    );
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
            floating: true,
            title: Text(S.of(context).add_course_content_page_title),
            actions: [
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  ref
                      .read(formBuilderKeyProvider)
                      .currentState
                      ?.fields['courseModuleTextField']
                      ?.didChange(
                        ref.read(courseContentProvider),
                      );

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(kSmallPadding),
              child: Column(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: ref.watch(courseContentProvider),
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: (value) => ref
                          .read(courseContentProvider.notifier)
                          .update((state) => state = value),
                      maxLines: null,
                      expands: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
