import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_post_repository_impl.dart';


class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videoPostRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    final newVideos = await videoPostRepository.getTrendingVideosByPage('1');
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
 