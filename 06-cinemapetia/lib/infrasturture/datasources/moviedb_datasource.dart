import 'package:cinemapetia/infrasturture/mappers/movie_mapper.dart';
import 'package:cinemapetia/infrasturture/models/moviedb/movie_details.dart';
import 'package:cinemapetia/infrasturture/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapetia/config/constants/environment.dart';
import 'package:cinemapetia/domain/datasources/movies_datasources.dart';
import 'package:cinemapetia/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {

  
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));


  List<Movie> _jsonToMovies (Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntenty(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie> >searchMovies(String query) async {

    if(query.isEmpty) return [];

    final res = await dio.get('/search/movie', queryParameters: {
        'query': query
    });

    final movies = _jsonToMovies(res.data);
    
    return movies;
  } 

  @override
  Future<Movie>getMovieById(String id) async {
      final res = await dio.get('/movie/$id');
      if(res.statusCode != 200) throw Exception('Movie with id: $id no exists');
      final moviedetails = MovieDetails.fromJson(res.data);
      final movie = MovieMapper.movieDetailsToEntenty(moviedetails);
      return movie;
  } 


  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final res = await dio.get('/movie/popular', queryParameters: {'page': page});
    final movies = _jsonToMovies(res.data);
    return movies;
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final res = await dio.get('/movie/top_rated');
    final movies = _jsonToMovies(res.data);
    return movies;
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) async  {
    final res = await dio.get('/movie/upcoming', queryParameters: {'page': page});
    final movies = _jsonToMovies(res.data);
    return movies;
  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // 1. Peticipon http
    final res = await dio.get('/movie/now_playing', queryParameters: {'page': page});

    // 2. Transformar la response de la recuers a un objeto
    final movieDbResponse = MovieDbResponse.fromJson(res.data);

    // 3. Mapear la response para transformarlo a mi Entity Movie;
    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntenty(moviedb))
        .toList();

    // 4. Regresamos
    return movies;
  }
}
