import 'package:human_benchmark_flutter_v2/pages/history_page/view/history_view.dart';
import 'package:uuid/uuid.dart';

import '../../core/hive/hive_helper.dart';
import 'hive_constants.dart';

class HiveManager {
  static HiveHelper hiveHelper = HiveHelper.instance;

  static Future<List<int>?> getUnlockedGames() async {
    return await hiveHelper.getData<List<int>?>(
      HiveConstants.BOX_UNLOCKED_GAMES,
      HiveConstants.BOX_UNLOCKED_GAMES,
    );
  }

  static Future<void> setUnlockedGames(List<int> data) async {
    hiveHelper.putData<List<int>?>(
      HiveConstants.BOX_UNLOCKED_GAMES,
      HiveConstants.BOX_UNLOCKED_GAMES,
      data,
    );
  }

  static Future<T?> getData<T>(String boxName, String key) async {
    return await hiveHelper.getData<T>(boxName, key);
  }

  static Future<void> putData<T>(String boxName, T data, [String? key]) async {
    await hiveHelper.putData<T>(boxName, key ?? const Uuid().v1(), data);
  }

  static Future<void> deleteData<T>(int index, String boxName) async {
    await hiveHelper.deleteDataAt<T>(boxName, index);
  }

  static Future<List<HistoryModel>> getHistory(String boxName) async {
    return await hiveHelper.getAll<HistoryModel>(boxName);
  }

  static Future<void> closeFirstInit() async {
    await hiveHelper.putData<bool>(
      HiveConstants.BOX_APP_PREFERENCES,
      HiveConstants.KEY_FIRST_INIT,
      false,
    );
  }

  static Future<bool> get getFirstInit async {
    var response = await hiveHelper.getData<bool>(
          HiveConstants.BOX_APP_PREFERENCES,
          HiveConstants.KEY_FIRST_INIT,
          defaultValue: true,
        ) ??
        false;
    return response;
  }
}
