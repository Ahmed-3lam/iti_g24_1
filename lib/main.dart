import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/helpers/dummy_dio_helper.dart';

import 'dummy_projects/note_app/hive_helpers.dart';
import 'myapp.dart';

void main() async {
  enableFlutterDriverExtension();
  await Hive.initFlutter();
  var box = await Hive.openBox(HiveHelpers.notesBox);
  await HiveHelpers.getAllNotes();
  DummyDioHelper.init();

  runApp(const MyApp());
}
