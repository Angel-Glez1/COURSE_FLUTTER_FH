

import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_modal.dart';
import 'package:toktik/shared/data/loca_video_posts.dart';

class LocalVideoDarSource implements VideoDataSource{
  
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    throw UnimplementedError();
    
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(String userID) async {
    await Future.delayed(const Duration(seconds: 3));
     final List<VideoPost> newVideos = videoPosts
        .map((videoApi) => LocalVideoModel.fromJson(videoApi).toVideoPostEntity())
        .toList();
    return newVideos;
  }

} 