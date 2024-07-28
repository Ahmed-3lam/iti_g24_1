import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../hive_helpers.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void addNote(String text) {
    HiveHelpers.addNote(text);

    emit(NoteAddState());
  }

  void removeNote(int index) {
    HiveHelpers.removeNote(index);

    emit(NoteRemoveState());
  }

  void removeAll() {
    HiveHelpers.clearAll();
    emit(NoteRemoveAllState());
  }

  void updateNote({
    required int index,
    required String text,
  }) {
    HiveHelpers.updateNote(index, text);

    emit(NoteUpdateState());
  }

  void textFieldChanged() {
    emit(NoteTextFieldChangedState());
  }
}
