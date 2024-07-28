import 'package:hive/hive.dart';

class HiveHelpers {
  static const notesBox = "Notes";
  static const notesBoxKey = "notesBoxKey";
  static var box = Hive.box(notesBox);

  static List<String> noteList = [];

  //add:

  static void addNote(String text) {
    noteList.add(text);
    box.put(notesBoxKey, noteList);
    print(box.get(notesBoxKey));
  }

  // get
  static Future<void> getAllNotes() async {
    if (box.get(notesBoxKey) != null) noteList = await box.get(notesBoxKey);
  }

  static void removeNote(int index) {
    noteList.removeAt(index);
    box.put(notesBoxKey, noteList);
  }

  static void clearAll() {
    noteList.clear();
    box.put(notesBoxKey, noteList);
  }

  static updateNote(int index, String text) {
    noteList[index] = text;
    box.put(notesBoxKey, noteList);
  }

  Map<String, List> myMap = {
    "id": ["Hell", "hlll"]
  };
}
