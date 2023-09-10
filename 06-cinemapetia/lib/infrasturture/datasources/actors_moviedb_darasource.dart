 

import 'package:cinemapetia/config/constants/environment.dart';
import 'package:cinemapetia/domain/datasources/actors_datasources.dart';
import 'package:cinemapetia/domain/entities/actor.dart';
import 'package:cinemapetia/infrasturture/mappers/actor_mapper.dart';
import 'package:cinemapetia/infrasturture/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasources extends ActorsDatasource {
  

  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final res = await dio.get('/movie/$movieId/credits'); 
    final credistResponse = CreditsResponse.fromJson(res.data);
    final actors = credistResponse.cast.map((e) =>  ActorMapper.castToEntity(e) ).toList();
    return actors;
  }
  
}