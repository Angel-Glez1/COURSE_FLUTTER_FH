import 'package:cinemapetia/domain/entities/actor.dart';
import 'package:cinemapetia/presentations/providers/actors/actor_repository_impl_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


typedef GetActorsCallback = Future<List<Actor>>Function(String movieId); 


final actorByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {

  final getMovieCallback = ref.watch(  actorRepositoryImplProvider ).getActorsByMovieId;
  return ActorsByMovieNotifier(getActors: getMovieCallback);
});


class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  
  GetActorsCallback getActors;
   
  ActorsByMovieNotifier({
    required this.getActors,
  }): super({});

  
  Future<void> listActors(String movieId) async {
    if(state[movieId] != null) return;
    final actors = await getActors(movieId);
    state = {...state, movieId: actors }; 
  }


}