import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:hive_flutter/adapters.dart';

import 'dummy_projects/note_app/hive_helpers.dart';
import 'myapp.dart';

void main() async {
  enableFlutterDriverExtension();
  await Hive.initFlutter();
  var box = await Hive.openBox(HiveHelpers.notesBox);
  await HiveHelpers.getAllNotes();

  runApp(const MyApp());
}
