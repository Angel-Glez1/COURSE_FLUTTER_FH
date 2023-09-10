import 'package:cinemapetia/infrasturture/datasources/moviedb_datasource.dart';
import 'package:cinemapetia/infrasturture/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) => MovieRepositoryImpl(MoviedbDatasource()));


