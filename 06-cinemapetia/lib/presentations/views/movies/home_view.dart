import 'package:cinemapetia/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapetia/presentations/providers/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    if (nowPlayingMovies.isEmpty && popularMovies.isEmpty && upComingMovies.isEmpty && topRatedMovies.isEmpty ) {
      return const CustomFullScreenLoader();
    }

  
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 1,
          (context, index) {
            return Column(
              children: [
                MovieSlideShow( movies: slideShowMovies,),

                MoviesHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'On billboard',
                  subTitle: 'Monday 20',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: upComingMovies,
                  title: 'Son',
                  subTitle: 'Thursday 10',
                  loadNextPage: () => ref
                      .read(upComingMoviesProvider.notifier)
                      .loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: popularMovies,
                  title: 'Popular',
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(),
                ),


                MoviesHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Top rated',
                  loadNextPage: () => ref
                      .read(topRatedMoviesProvider.notifier)
                      .loadNextPage(),
                ),

                const SizedBox(height: 50,)
              ],
            );
          },
        ),
      )
    ]);
  }
}
