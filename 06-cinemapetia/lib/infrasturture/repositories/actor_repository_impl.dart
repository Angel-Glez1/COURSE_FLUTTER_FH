import 'package:cinemapetia/domain/datasources/actors_datasources.dart';
import 'package:cinemapetia/domain/entities/actor.dart';
import 'package:cinemapetia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  
  final ActorsDatasource datasource;

  ActorRepositoryImpl({required this.datasource});

  
  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return datasource.getActorsByMovieId(movieId);
  }
}