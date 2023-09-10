import 'package:animate_do/animate_do.dart';
import 'package:cinemapetia/config/helpers/human_formats.dart';
import 'package:cinemapetia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListView({
      super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage
    });

  @override
  State<MoviesHorizontalListView> createState() => _MoviesHorizontalListViewState();
}

class _MoviesHorizontalListViewState extends State<MoviesHorizontalListView> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;

      if (scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
     });
  }


  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title( title: widget.title, subTitle: widget.subTitle,),

          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => _Slide(movie: widget.movies[index]),
            ),
          ),
          
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({
    required this.movie 
  });

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //* Image
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath, 
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator(strokeWidth: 2,);
                  }

                  return GestureDetector(
                    child: FadeIn(child: child),
                    onTap: () => context.push('/home/0/movie/${movie.id}'),
                  );

            
                },
              ),
            
            ),
          ),
          
          const SizedBox(height: 5),

          //* Title 
          SizedBox(
            width: 150,
            height: 40,
            child: Text(
              movie.title, 
              maxLines: 2,
              style: textStyle.titleSmall,
            ),
          ),

          //* Rating
          Row(
            children: [
              Icon(Icons.star_half_outlined,color: Colors.yellow.shade800,),
              const SizedBox(width: 5,),
              Text('${movie.voteAverage}', style: textStyle.bodyMedium?.copyWith(color:Colors.yellow.shade800)),
              const SizedBox(width: 10,),
              Text(HumanFortmans.number( movie.popularity), style: textStyle.bodySmall),
            ],
          ),

        ],
      ), 
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final titleStyles = Theme.of(context).textTheme.titleLarge;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          if(title != null) Text(title!, style: titleStyles),
          const Spacer(),
          if(subTitle != null) 
            FilledButton.tonal(
              style: const ButtonStyle( visualDensity: VisualDensity.compact ),
              onPressed: (){}, 
              child: Text(subTitle!),
            )
        ],
      ),
    );
  }
}



