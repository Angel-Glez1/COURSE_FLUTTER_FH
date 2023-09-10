import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/presentations/providers/providers.dart';
import 'package:cinemapetia/presentations/widgets/movies/movie_mansonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {


  @override
  void initState() {
    super.initState();
    ref.read(  favoriteMoviesProvider.notifier ).loadNextPage();
  }
 
  @override
  Widget build(BuildContext context) {

    final List<Movie> movies = ref.watch(favoriteMoviesProvider).values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Favorites')),
      body: MovieMansonry(movies: movies)
    );
  }
}


