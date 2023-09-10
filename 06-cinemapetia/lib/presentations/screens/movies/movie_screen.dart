import 'package:animate_do/animate_do.dart';
import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/presentations/providers/actors/actors_by_movie_provider.dart';
import 'package:cinemapetia/presentations/providers/movies/movie_info_provider.dart';
import 'package:cinemapetia/presentations/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = 'movie_screen';
  
  final String movieId; 

  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {



  @override
  void initState() {
    super.initState();
    ref.read( movieInfoProvider.notifier  ).loadMovie(widget.movieId);
    ref.read( actorByMovieProvider.notifier  ).listActors(widget.movieId);
  }


  @override
  Widget build(BuildContext context) {
  
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
  
    if(movie == null){
      return const Scaffold(body: Center(child: CircularProgressIndicator(strokeWidth: 2),));
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          
          _CustomSliverAppBar(movie: movie,),

          SliverList( 
            delegate:  SliverChildBuilderDelegate( 
              (context, index)  => _MovieView(movie:movie), 
              childCount: 1
            ),
          )
        ],
      ),
    );
  }
}

class _MovieView extends StatelessWidget {

  final Movie movie;

  const _MovieView({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

     final size = MediaQuery.of(context).size;
     final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [  
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect( 
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,

                ),
              ),
              const SizedBox(width: 10,),  
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column( 
                  children: [
                    Text(movie.title, style: textStyle.titleLarge,),
                    Text(movie.overview,)
                  ],
                ),
              ),
            ],
          ), 
        ),
     
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((genere) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(genere),
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(20)
                   ),
                ),
              ))
            ],
          ),
        ),

        _ActorById(movieId: movie.id.toString(),),

        const SizedBox(height: 100,),  
      ],
    );
  } 
}

class _ActorById extends ConsumerWidget {

  final String movieId;

  const _ActorById({required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final actorsByMovie = ref.watch(actorByMovieProvider);

    if (actorsByMovie[movieId] == null) {
      return const CircularProgressIndicator(strokeWidth: 2,);
    }

    final actors = actorsByMovie[movieId]!;
    
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Column( 
              children: [

                  //* Photo actor
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network( 
                      actor.profilePath ,
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                    ),
                  ),


                const SizedBox(height: 5,),

                Text(actor.name, maxLines: 2,),
                Text(actor.character?? ''),





              ],
             ),
          );
        },
      ),
    );
  }
}

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return localStorageRepository.isMovieFavorite(movieId);
});

class _CustomSliverAppBar extends ConsumerWidget {

  final Movie movie;

  const _CustomSliverAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final size = MediaQuery.of(context).size;
    final isFavorite = ref.watch(isFavoriteProvider(movie.id));

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: isFavorite.when(
            data: (isFavorite) => isFavorite 
              ? const Icon( Icons.favorite_rounded, color: Colors.red, )
              : const Icon(Icons.favorite_border),  
            loading: () => const CircularProgressIndicator(strokeWidth: 2,),
            error: (_, __) =>  throw UnimplementedError() ,
          ),
          onPressed: (){
            ref.watch(localStorageRepositoryProvider).toggleFavorite(movie);
            ref.invalidate(isFavoriteProvider(movie.id));
          }, 
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ), 
            ),


            const SizedBox.expand(
              child: DecoratedBox( 
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black87
                    ]
                  )
                ),
              )
            ),
             
            const SizedBox.expand(
              child: DecoratedBox( 
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ]
                  )
                ),
              )
            ),
             
            const SizedBox.expand(
              child: DecoratedBox( 
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 0.2],
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ]
                  )
                ),
              )
            ),




          ],
        ),
      ),
    );
  }
}