import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'myapp.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.TOKEN);
  runApp(const MyApp());
}
