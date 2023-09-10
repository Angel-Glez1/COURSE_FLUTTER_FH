import 'package:cinemapetia/infrasturture/datasources/isar_datasource.dart';
import 'package:cinemapetia/infrasturture/repositories/local_storage_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});



