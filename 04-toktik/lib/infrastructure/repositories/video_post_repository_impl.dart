

import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostRepository extends VideoDataRepository{
  final VideoDataSource videoDataSource;

  VideoPostRepository({required this.videoDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    throw UnimplementedError(); 
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(String userID) {
    return videoDataSource.getTrendingVideosByPage(userID);
  }
}