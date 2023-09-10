import 'package:cinemapetia/domain/entities/actor.dart';

abstract class ActorsRepository {

  Future<List<Actor>> getActorsByMovieId(String movieId);

}