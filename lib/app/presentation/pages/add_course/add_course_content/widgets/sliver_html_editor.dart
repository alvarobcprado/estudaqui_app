import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_content/widgets/add_video_dialog.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class SliverHtmlEditor extends ConsumerWidget {
  SliverHtmlEditor({
    Key? key,
  }) : super(key: key);

  final _controller = HtmlEditorController();

  void showVideoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AddVideoDialog(controller: _controller);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: colors.primaryColor,
              child: HtmlEditor(
                controller: _controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: S.of(context).add_course_content_editor_hint,
                  initialText: ref.read(courseContentProvider) ?? '',
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  onButtonPressed: (buttonType, _, __) {
                    if (buttonType == ButtonType.video) {
                      showVideoDialog(context);
                      return false;
                    }
                    return true;
                  },
                  buttonColor: Colors.white,
                  buttonFillColor: Colors.white,
                  buttonSelectedColor: colors.primaryColor,
                  dropdownIconColor: Colors.white,
                  dropdownFocusColor: Colors.white,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: kMediumNumber,
                  ),
                  dropdownBackgroundColor:
                      colors.secondaryVariantColor.withOpacity(0.95),
                  defaultToolbarButtons: [
                    const OtherButtons(
                      codeview: false,
                      help: false,
                      fullscreen: false,
                      copy: false,
                      paste: false,
                    ),
                    const StyleButtons(),
                    const FontButtons(
                      clearAll: false,
                      strikethrough: false,
                      subscript: false,
                    ),
                    const ColorButtons(),
                    const ListButtons(listStyles: false),
                    const ParagraphButtons(
                      lineHeight: false,
                      textDirection: false,
                      caseConverter: false,
                      decreaseIndent: false,
                      increaseIndent: false,
                    ),
                    const InsertButtons(
                      audio: false,
                      table: false,
                      otherFile: false,
                      hr: false,
                    ),
                  ],
                ),
                otherOptions: const OtherOptions(
                  decoration: BoxDecoration(),
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    if (p0 != '<p><br></p>') {
                      ref
                          .read(courseContentProvider.notifier)
                          .update((state) => state = p0);
                    }
                  },
                  onInit: () {
                    _controller.setFullScreen();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
