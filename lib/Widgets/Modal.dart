import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/Widgets/add_note_form.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';

class DraggableScrollableModalSheet extends StatefulWidget {
  const DraggableScrollableModalSheet({
    super.key,
    required this.text,
    required this.hasButton,
  });
  final String text;
  final bool hasButton;

  @override
  State<DraggableScrollableModalSheet> createState() =>
      _DraggableScrollableModalSheetState();
}

class _DraggableScrollableModalSheetState
    extends State<DraggableScrollableModalSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is AddNoteFailureState) {
              print('Failed ${state.errMessage}');
            }
            if (state is AddNoteSuccessState) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xff303030),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(16),

              child: ModalProgressHUD(
                inAsyncCall: State is AddNoteLoadingState ? true : false,
                child: AddNoteForm(
                  text: widget.text,
                  hasButton: widget.hasButton,
                  scrollController: scrollController,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
