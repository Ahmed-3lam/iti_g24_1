part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteAddState extends NoteState {}

final class NoteRemoveState extends NoteState {}

final class NoteRemoveAllState extends NoteState {}

final class NoteUpdateState extends NoteState {}

final class NoteTextFieldChangedState extends NoteState {}
