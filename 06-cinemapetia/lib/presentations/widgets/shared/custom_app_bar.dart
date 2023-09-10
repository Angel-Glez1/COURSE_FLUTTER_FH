import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/presentations/delegates/search_movie_delegate.dart';
import 'package:cinemapetia/presentations/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';




class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleMedium;


    return SafeArea(
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary,),
                const SizedBox(width: 10,),
                Text('Cinemapedia', style: textStyle,),
      
                const Spacer(),
      
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    
                    final  searchedMovies  = ref.read(  searchedMoviesProvider );
                    final searchQuery = ref.read(  searchQueryProvider );
                    
                    showSearch<Movie?>(
                      context: context, 
                      query: searchQuery,
                      delegate: SearchMovieDelegate(
                        initialMovies: searchedMovies,
                        searchMovies: ref.read(  searchedMoviesProvider.notifier ).searchMoviesByQuery
                      )
                    ).then((movie) {
                      if(movie == null) return;
                      context.push('/home/0/movie/${movie.id}');
                    });


                  }, 
                )
              ],
            ),
          ),
        ),
      
    );
  }
}