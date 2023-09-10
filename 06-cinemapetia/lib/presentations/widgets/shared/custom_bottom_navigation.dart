import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomBottomNavigation extends StatelessWidget {

  final int currentIndex;
  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex, // indica el tab en donde estas
      onTap: (value) {
        return context.go('/home/$value');
      }, 
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max,),
          label: 'Inicio'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline,),
          label: 'Categorias'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline,),
          label: 'Favoritos'
        ),
      ],
    );
  } 
}