import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoDataSource {
  
  Future<List<VideoPost>> getTrendingVideosByPage( String userID );
  
  Future<List<VideoPost>> getFavoriteVideosByUser( int page );

}
