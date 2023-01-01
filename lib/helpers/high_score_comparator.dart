import '../core/hive/hive_manager.dart';

class HightScoreComparator {
  static Future<bool> compare({
    required String boxName,
    required int score,
    bool compareAsLower = true,
  }) async {
    var previousHighScore =
        await HiveManager.getData<int>(boxName, 'high_score');
    previousHighScore ??= compareAsLower ? 999999999999999999 : 0;
    if (compareAsLower) {
      if (!(score < previousHighScore)) {
        return false;
      }
    } else {
      if (!(score > previousHighScore)) {
        return false;
      }
    }
    await HiveManager.putData<int?>(boxName, score, 'high_score');
    return true;
  }
}
