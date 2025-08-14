import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/Widgets/add_note_form.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class DraggableScrollableModalSheet extends StatefulWidget {
  const DraggableScrollableModalSheet({
    super.key,
    required this.text,
    required this.hasButton,
    this.note,
  });
  final String text;
  final bool hasButton;
  final NoteModel? note;
  @override
  State<DraggableScrollableModalSheet> createState() =>
      _DraggableScrollableModalSheetState();
}

class _DraggableScrollableModalSheetState
    extends State<DraggableScrollableModalSheet> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
      ],
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.8,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return BlocConsumer<AddNoteCubit, AddNoteStates>(
            listener: (context, state) {
              if (state is AddNoteFailureState) {
                print('Failed ${state.errMessage}');
              }
              if (state is AddNoteSuccessState) {
                BlocProvider.of<NotesCubit>(context).showNotes();
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: State is AddNoteLoadingState ? true : false,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: ModalProgressHUD(
                    inAsyncCall: State is AddNoteLoadingState,
                    progressIndicator: const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff303030),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AddNoteForm(
                        text: widget.text,
                        hasButton: widget.hasButton,
                        scrollController: scrollController,
                        note: widget.note, 
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
