import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/presentations/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifiar, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return SearchedMoviesNotifiar(
    ref: ref,
    searchMovies: movieRepository.searchMovies
  );
});



typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifiar extends StateNotifier<List<Movie>> {
  

  final Ref ref;
  SearchMoviesCallback searchMovies;
  SearchedMoviesNotifiar({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<Movie>>searchMoviesByQuery (String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query); 
    state = movies;
    return movies;
  }
}
