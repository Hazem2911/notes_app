import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';
import 'package:notes_app/Widgets/CustomButton.dart';
import 'package:notes_app/Widgets/editNote_bar.dart';

class DraggableScrollableModalSheet extends StatelessWidget {
  const DraggableScrollableModalSheet({
    super.key,
    required this.text,
    required this.hasButton,
  });
  final String text;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xff303030),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: AddNoteForm(
            text: text,
            hasButton: hasButton,
            scrollController: scrollController,
          ),
        );
      },
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
    required this.text,
    required this.hasButton,
    required this.scrollController,
  });

  final String text;
  final bool hasButton;
  final ScrollController scrollController;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Flexible(
            child: ListView(
              controller: widget.scrollController,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    if (!widget.hasButton) Clickableicon(icon: Icons.check),
                  ],
                ),
                const SizedBox(height: 15),
                EditForm(
                  label: 'Title',
                  hint: 'Enter Note\'s Title',
                  vertical: 25,
                ),
                const SizedBox(height: 25),
                EditForm(label: 'Content', hint: '', vertical: 75),
              ],
            ),
          ),
          if (widget.hasButton)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CustomElevatedbutton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {
                      
                    });
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
