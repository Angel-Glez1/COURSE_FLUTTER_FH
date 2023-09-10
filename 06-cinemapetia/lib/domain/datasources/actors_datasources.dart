import 'package:cinemapetia/domain/entities/actor.dart';

abstract class ActorsDatasource {

  Future<List<Actor>> getActorsByMovieId(String movieId);

}