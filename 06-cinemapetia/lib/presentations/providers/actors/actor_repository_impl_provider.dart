
import 'package:cinemapetia/infrasturture/datasources/actors_moviedb_darasource.dart';
import 'package:cinemapetia/infrasturture/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryImplProvider = Provider((ref) =>  ActorRepositoryImpl(datasource: ActorMovieDbDatasources()  )  );