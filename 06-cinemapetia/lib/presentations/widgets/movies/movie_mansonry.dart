import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/presentations/widgets/movies/movie_poster_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class MovieMansonry extends StatefulWidget {

  
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  
  const MovieMansonry({
    super.key,
    required this.movies,
    this.loadNextPage
  });
  
  
  @override
  State<MovieMansonry> createState() => _MovieMansonryState();
}

class _MovieMansonryState extends State<MovieMansonry> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: widget.movies.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return MoviePosterLink(movie: widget.movies[index]);
        },
      ),
    );
  }
}
 

