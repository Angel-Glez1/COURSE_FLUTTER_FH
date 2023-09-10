import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:cinemapetia/infrasturture/models/moviedb/movie_details.dart';
import 'package:cinemapetia/infrasturture/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntenty(MovieMovieDB moviedb) => Movie(
      id: moviedb.id,
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
          : 'https://ih1.redbubble.net/image.1027712254.9762/fposter,small,wall_texture,product,750x1000.u2.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != "")
          ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
          : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
  );

  static Movie movieDetailsToEntenty(MovieDetails moviedb) => Movie(
         id: moviedb.id,
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
          : 'https://ih1.redbubble.net/image.1027712254.9762/fposter,small,wall_texture,product,750x1000.u2.jpg',
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != "")
          ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
          : 'https://ih1.redbubble.net/image.1027712254.9762/fposter,small,wall_texture,product,750x1000.u2.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
  );


}
