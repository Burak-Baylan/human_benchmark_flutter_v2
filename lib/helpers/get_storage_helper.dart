import 'package:get_storage/get_storage.dart';

class GetStorageHelper{

  static var shared = GetStorageHelper();


  Future<void> init() async{
    await GetStorage.init();

  }

  T? read<T>(String key){
    return GetStorage().read<T>(key);
  }

  Future<void> write({required String key,dynamic value}){
    return GetStorage().write(key, value);
  }

  Future<void> remove(String key) async{
    return GetStorage().remove(key);
  }

}