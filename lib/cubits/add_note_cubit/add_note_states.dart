import 'package:flutter/cupertino.dart';

@immutable
abstract class AddNoteStates {}

class AddNoteInitial extends AddNoteStates {}

class AddNoteLoadingState extends AddNoteStates {}

class AddNoteSuccessState extends AddNoteStates {}

class AddNoteFailureState extends AddNoteStates {
  final String errMessage;

  AddNoteFailureState({required this.errMessage});
}
