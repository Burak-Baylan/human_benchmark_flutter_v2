import 'package:mobx/mobx.dart';
import '../../../core/hive/hive_manager.dart';
import '../view/history_view.dart';

part 'history_view_model.g.dart';

class HistoryViewModel = _HistoryViewModelBase with _$HistoryViewModel;

abstract class _HistoryViewModelBase with Store {
  String historyBoxName = '';

  void setHistoryBoxName(String name) => historyBoxName = name;

  List<HistoryModel> history = [];

  Future<void> getHistory() async {
    history = await HiveManager.getHistory(historyBoxName);
  }

  Future<void> delete(int index) async {
    await HiveManager.deleteData<HistoryModel>(index, historyBoxName);
  }
}
