import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';
import 'package:notes_app/Widgets/CustomButton.dart';
import 'package:notes_app/Widgets/colors_listView.dart';
import 'package:notes_app/Widgets/editNote_bar.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
    required this.text,
    required this.hasButton,
    required this.scrollController,
    this.note,
  });

  final String text;
  final bool hasButton;
  final ScrollController scrollController;
  final NoteModel? note;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    subtitleController = TextEditingController(
      text: widget.note?.subTitle ?? '',
    );
  }

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
                      Clickableicon(
                        icon: Icons.check,
                        onTap: () {
                          editNote(context);
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 15),
                EditForm(
                  controller: titleController,
                  onChanged: (value) {
                    title = value;
                  },
                  label: 'Title',
                  hint: 'Enter Note\'s Title',
                  vertical: 25,
                  onSaved: (value) => title = value,
                ),
                const SizedBox(height: 25),
                EditForm(
                  onChanged: (value) {
                    subTitle = value;
                  },
                  controller: subtitleController,
                  label: 'Content',
                  hint: '',
                  vertical: 75,
                  onSaved: (value) => subTitle = value,
                ),
              ],
            ),
          ),

          if (widget.hasButton)
            const SizedBox(height: 60, child: ColorsListView()),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BlocBuilder<AddNoteCubit, AddNoteStates>(
              builder: (context, state) {
                return CustomElevatedbutton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      addNote(context);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addNote(BuildContext context) {
    formKey.currentState!.save();
    var note = NoteModel(
      // ignore: deprecated_member_use
      Colors.amberAccent.value,
      title: title!,
      subTitle: subTitle!,
      date: DateTime.now().toString(),
    );
    BlocProvider.of<AddNoteCubit>(context).addNote(note);
  }

  void editNote(BuildContext context) {
    formKey.currentState!.save();
    widget.note!.title = title ?? widget.note!.title;
    widget.note!.subTitle = subTitle ?? widget.note!.subTitle;
    widget.note!.date = DateTime.now().toString();
    widget.note!.save();

    BlocProvider.of<NotesCubit>(context).showNotes();

    Navigator.of(context).pop();
  }
}
