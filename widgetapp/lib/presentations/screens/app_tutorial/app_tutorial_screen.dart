import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slidesData = <SlideInfo>[
  SlideInfo(
      title: 'Buscas Comida',
      caption:
          'Ad mollit labore eiusmod dolore ipsum officia tempor quis duis commodo reprehenderit eiusmod. ',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega Rapida',
      caption:
          'Cupidatat occaecat qui aliqua minim est esse qui eiusmod eu anim officia. Esse elit magna dolore irure ullamco. ',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la Comida',
      caption:
          'Adipisicing eiusmod nulla commodo nulla eu mollit id in eu consectetur voluptate fugiat laboris.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() { 
      final currentPage = pageViewController.page ?? 0; 
      if(!endReach && currentPage >= (slidesData.length - 1.5)){
        setState(() {
          endReach = true;
        });
      }
    });
  }


  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slidesData.map((slide) => _Side(title: slide.title,caption: slide.caption,imageUrl: slide.imageUrl)).toList()
            ),

            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                child: const Text('Salir', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                onPressed: () => context.pop(),
              ),
            ),

            !endReach 
             ? const SizedBox()  
             : Positioned(
                bottom: 30,
                right: 30, 
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(milliseconds: 500),
                  child: FilledButton(
                    child: const Text('Comenzar'),
                    onPressed: () => context.pop(),
                  ),
                ),
              )
             ],
        )
    );
  }
}

class _Side extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Side(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text( title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Image(image: AssetImage(imageUrl)),
          Text(caption),
      ]),
    );
  }
}
