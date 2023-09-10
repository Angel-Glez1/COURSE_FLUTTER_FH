import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/presentations/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




typedef GetMovieCallback = Future<Movie>Function(String movieId);


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final getMovieCallback = ref.watch(  movieRepositoryProvider ).getMovieById;
  return MovieMapNotifier(getMovieCallback: getMovieCallback);
});


class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  
  GetMovieCallback getMovieCallback;
  
  MovieMapNotifier({
    required this.getMovieCallback,
  }): super({});

  
  Future<void> loadMovie(String movieId) async {
    if(state[movieId] != null) return;
    final movie = await getMovieCallback(movieId);
    state = { ...state, movieId: movie }; 
  }


}