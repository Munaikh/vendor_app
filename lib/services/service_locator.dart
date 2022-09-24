
import 'package:get_it/get_it.dart';
import 'package:vendor_app/services/services.dart';
import 'package:vendor_app/services/storage/hive_storage_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Services
  // Storage
  serviceLocator.registerLazySingleton<StorageService>(
    () => HiveStorageService(),
  );
}
