import 'package:hive/hive.dart';

class HiveHelper {
  static const String TOKEN = 'TOKEN';

  static void saveToken(String token) async {
    await Hive.box(TOKEN).put(TOKEN, token);
  }

  static String? getToken() {
    return Hive.box(TOKEN).get(TOKEN);
  }
}
