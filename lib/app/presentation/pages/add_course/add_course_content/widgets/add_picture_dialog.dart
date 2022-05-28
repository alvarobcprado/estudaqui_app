// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:estudaqui/generated/l10n.dart';
import 'package:file_picker/src/file_picker.dart';
import 'package:file_picker/src/file_picker_result.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/src/mobile.dart';

class AddPictureDialog extends StatefulWidget {
  const AddPictureDialog({
    Key? key,
    required this.controller,
    this.htmlToolbarOptions,
  }) : super(key: key);

  final HtmlEditorController controller;
  final HtmlToolbarOptions? htmlToolbarOptions;

  @override
  State<AddPictureDialog> createState() => _AddPictureDialogState();
}

class _AddPictureDialogState extends State<AddPictureDialog> {
  @override
  Widget build(BuildContext context) {
    final filename = TextEditingController();
    final url = TextEditingController();
    final urlFocus = FocusNode();
    FilePickerResult? result;
    String? validateFailed;
    return PointerInterceptor(
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Text(S.of(context).add_picture_dialog_title),
          scrollable: true,
          content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).add_picture_dialog_select_from_files,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextFormField(
                    controller: filename,
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).dialogBackgroundColor,
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            elevation: 0.0),
                        onPressed: () async {
                          result = await FilePicker.platform.pickFiles(
                            type: FileType.image,
                            withData: true,
                            allowedExtensions:
                                widget.htmlToolbarOptions?.imageExtensions,
                          );
                          if (result?.files.single.name != null) {
                            setState(() {
                              filename.text = result!.files.single.name;
                            });
                          }
                        },
                        child: Text(S.of(context).add_picture_dialog_pick_file,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color)),
                      ),
                      suffixIcon: result != null
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  result = null;
                                  filename.text = '';
                                });
                              })
                          : const SizedBox(height: 0, width: 0),
                      errorText: validateFailed,
                      errorMaxLines: 2,
                      border: InputBorder.none,
                    )),
                const SizedBox(height: 20),
                const Text('URL',
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
              child: Text(S.of(context).add_picture_dialog_cancel),
            ),
            TextButton(
              onPressed: () async {
                if (filename.text.isEmpty && url.text.isEmpty) {
                  setState(() {
                    validateFailed = S.of(context).add_picture_dialog_empty;
                  });
                } else if (filename.text.isNotEmpty && url.text.isNotEmpty) {
                  setState(() {
                    validateFailed =
                        S.of(context).add_picture_dialog_both_filled;
                  });
                } else if (filename.text.isNotEmpty &&
                    result?.files.single.bytes != null) {
                  var base64Data = base64.encode(result!.files.single.bytes!);
                  var proceed = await widget
                          .htmlToolbarOptions?.mediaUploadInterceptor
                          ?.call(result!.files.single, InsertFileType.image) ??
                      true;
                  if (proceed) {
                    widget.controller.insertHtml(
                        "<img src='data:image/${result!.files.single.extension};base64,$base64Data' data-filename='${result!.files.single.name}'/>");
                  }
                  Navigator.of(context).pop();
                } else {
                  var proceed = await widget
                          .htmlToolbarOptions?.mediaLinkInsertInterceptor
                          ?.call(url.text, InsertFileType.image) ??
                      true;
                  if (proceed) {
                    widget.controller.insertNetworkImage(url.text);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            )
          ],
        );
      }),
    );
  }
}
