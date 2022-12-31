import 'package:human_benchmark_flutter_v2/pages/history_page/view/history_view.dart';
import 'package:uuid/uuid.dart';

import '../../core/hive/hive_helper.dart';
import 'hive_constants.dart';

class HiveManager {
  static HiveHelper hiveHelper = HiveHelper.instance;

  static Future<HistoryModel?> getData(String boxName, String key) async {
    return await hiveHelper.getData<HistoryModel>(boxName, key);
  }

  static Future<void> putData(String boxName, HistoryModel data) async {
    await hiveHelper.putData(boxName, const Uuid().v1(), data);
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
