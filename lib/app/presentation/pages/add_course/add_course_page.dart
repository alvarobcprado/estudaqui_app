import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_course_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kSmallPadding,
          horizontal: kMediumPadding,
        ),
        child: FormBuilder(
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'courseNameField',
                decoration: InputDecoration(
                  label: Text(S.of(context).add_course_form_name_field),
                ),
                textInputAction: TextInputAction.next,
              ),
              FormBuilderTextField(
                name: 'courseDescriptionField',
                decoration: InputDecoration(
                  label: Text(S.of(context).add_course_form_description_field),
                ),
                textInputAction: TextInputAction.next,
              ),
              FormBuilderTextField(
                name: 'courseImageField',
                decoration: InputDecoration(
                  label: Text(S.of(context).add_course_form_banner_field),
                ),
                textInputAction: TextInputAction.next,
              ),
              FormBuilderDropdown(
                name: 'courseSubjectField',
                decoration: InputDecoration(
                  labelText: S.of(context).add_course_form_subject_field,
                ),
                allowClear: true,
                items: const [
                  DropdownMenuItem(
                    child: Text('Subject1'),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text('Subject2'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Subject3'),
                    value: 2,
                  ),
                ],
              ),
              const SizedBox(height: kXLargeSpacer),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).add_course_modules_title(5)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Divider(
                        thickness: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
