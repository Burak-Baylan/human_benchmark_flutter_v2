import 'package:human_benchmark_flutter_v2/core/hive/hive_constants.dart';

import '../helpers/get_storage_helper.dart';

class AppInit {
  AppInit._();

  static Future<void> init() async {
    await GetStorageHelper.shared
        .write(key: HiveConstants.seenOnboard, value: true);
  }
}
