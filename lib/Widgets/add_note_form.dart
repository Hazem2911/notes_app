import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';
import 'package:notes_app/Widgets/CustomButton.dart';
import 'package:notes_app/Widgets/editNote_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

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
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    if (!widget.hasButton)
                      const Clickableicon(icon: Icons.check),
                  ],
                ),
                const SizedBox(height: 15),
                EditForm(
                  label: 'Title',
                  hint: 'Enter Note\'s Title',
                  vertical: 25,
                  onSaved: (value) => title = value,
                ),
                const SizedBox(height: 25),
                EditForm(
                  label: 'Content',
                  hint: '',
                  vertical: 75,
                  onSaved: (value) => subTitle = value,
                ),
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
                    var note = NoteModel(
                      Colors.amberAccent.value,
                      title: title!,
                      subTitle: subTitle!,
                      date: DateTime.now().toString(),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
