import 'package:cinemapetia/presentations/views/views.dart';
import 'package:flutter/material.dart';
import 'package:cinemapetia/presentations/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';
  final int pageIndex;
  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];


  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( 
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex ),
    );
  }
}

