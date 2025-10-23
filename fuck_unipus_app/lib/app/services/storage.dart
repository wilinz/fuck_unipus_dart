import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

late GetStorage getStorage;
late GetStorage networkCacheStorage;

Future<void> initGetStorage() async {
  if (!GetPlatform.isWeb) {
    final path = await getApplicationSupportDirectory();
    getStorage = GetStorage('GetStorage', path.path);
    networkCacheStorage = GetStorage('NetworkCache', path.path);
  } else {
    getStorage = GetStorage('GetStorage');
    networkCacheStorage = GetStorage('NetworkCache');
  }
  await getStorage.initStorage;
  await networkCacheStorage.initStorage;
}

class GetStorageKeys {
  static const credentials = 'credentials';
}
