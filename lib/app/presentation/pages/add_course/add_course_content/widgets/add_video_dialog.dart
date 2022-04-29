import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class AddVideoDialog extends StatefulWidget {
  const AddVideoDialog({
    Key? key,
    required this.controller,
    this.htmlToolbarOptions,
  }) : super(key: key);

  final HtmlEditorController controller;
  final HtmlToolbarOptions? htmlToolbarOptions;
  @override
  State<AddVideoDialog> createState() => _AddVideoDialogState();
}

class _AddVideoDialogState extends State<AddVideoDialog> {
  final filename = TextEditingController();

  final url = TextEditingController();

  final urlFocus = FocusNode();

  String? validateFailed;

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: AlertDialog(
        title: const Text('Insert Video'),
        scrollable: true,
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('URL', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: url,
                focusNode: urlFocus,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'URL',
                  errorText: validateFailed,
                  errorMaxLines: 2,
                ),
              ),
            ]),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (url.text.isEmpty) {
                setState(() {
                  validateFailed = 'Please either choose a video URL!';
                });
              } else {
                var proceed = await widget
                        .htmlToolbarOptions?.mediaLinkInsertInterceptor
                        ?.call(url.text, InsertFileType.video) ??
                    true;
                if (proceed) {
                  widget.controller
                      .insertHtml("<video controls src='${url.text}'></video>");
                }
                Navigator.of(context).pop();
              }
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
