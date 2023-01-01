import 'package:hive_flutter/adapters.dart';
import 'package:human_benchmark_flutter_v2/pages/history_page/view/history_view.dart';

import 'hive_constants.dart';

class HiveHelper {
  static HiveHelper? _instance;
  static HiveHelper get instance =>
      _instance = _instance == null ? HiveHelper._init() : _instance!;
  HiveHelper._init();

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HistoryAdapter());
    await Hive.openBox<bool>(HiveConstants.BOX_APP_PREFERENCES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_REACTION_TIME_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_NUMBERS_MEMORY_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_SEQUENCE_MEMORY_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_FAST_FINGERS_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_VIBRATION_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_FIND_NUMBER_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_FIND_COLOR_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_CATCH_COLOR_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_COLORED_TEXT_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_MATH_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_COUNT_ONE_BY_ONE_SCORES);
    await Hive.openBox<HistoryModel>(
        HiveConstants.BOX_COLORED_CELL_COUNT_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_FALLING_BALLS_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_HOLD_AND_CLICK_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_VISUAL_MEMORY_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_AIM_TRAINER_SCORES);
    await Hive.openBox<HistoryModel>(HiveConstants.BOX_BLIND_NUMBERS_SCORES);

    await Hive.openBox<int?>(HiveConstants.BOX_REACTION_TIME_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_NUMBERS_MEMORY_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_SEQUENCE_MEMORY_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_FAST_FINGERS_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_VIBRATION_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_FIND_NUMBER_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_FIND_COLOR_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_CATCH_COLOR_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_COLORED_TEXT_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_MATH_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_COUNT_ONE_BY_ONE_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_COLORED_CELL_COUNT_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_FALLING_BALLS_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_HOLD_AND_CLICK_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_VISUAL_MEMORY_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_AIM_TRAINER_HIGH_SCORE);
    await Hive.openBox<int?>(HiveConstants.BOX_BLIND_NUMBERS_HIGH_SCORE);
  }

  Future<T?> getData<T>(String boxName, dynamic key, {T? defaultValue}) async {
    var box = Hive.box<T>(boxName);
    return box.get(key, defaultValue: defaultValue);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<void> putAllData<T>(String boxName, Map<dynamic, T> data) async {
    var box = Hive.box<T>(boxName);
    await box.putAll(data);
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> deleteDataAt<T>(String boxName, int index) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  Future<void> deleteAll<T>(String boxName, Iterable<dynamic> keys) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAll(keys);
  }

  Future<int> addData<T>(String boxName, T dataToAdd) async {
    var box = Hive.box<T>(boxName);
    return box.add(dataToAdd);
  }
}

class HistoryAdapter extends TypeAdapter<HistoryModel> {
  @override
  HistoryModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModel(text: fields[0] as String, date: fields[1] as String);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.date);
  }
}
