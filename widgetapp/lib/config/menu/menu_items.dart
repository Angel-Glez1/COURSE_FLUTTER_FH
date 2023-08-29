import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link,
     required this.icon
  });
}


const menuItems = <MenuItem>[

  MenuItem(
    title: 'Riverpod',
    subtitle: 'Gestor de estado Riverpod',
    link: '/riverpod-screen',
    icon: Icons.save_alt_outlined 
  ),

  MenuItem(
    title: 'Botones',
    subtitle: 'Varios Botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
 
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'ProgessIndicators',
    subtitle: 'Generales y controlador',
    link: '/progress',
    icon: Icons.refresh_outlined
  ),

  MenuItem(
    title: 'SnackBars',
    subtitle: 'Snackbars y Dialog',
    link: '/snackbars',
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated container',
    subtitle: 'Stateful wigets',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined
  ),

  MenuItem(
    title: 'Ui - Controls',
    subtitle: 'Una serie de controles en flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),
  

  MenuItem(
    title: 'Introducción App-Tutorial',
    subtitle: 'Tutorial de la app',
    link: '/app-tutorial',
    icon: Icons.tour_outlined
  ),

  MenuItem(
    title: 'InfinitiScroll y Pull',
    subtitle: 'Lista Infinita y pull refresh',
    link: '/infinite-scroll',
    icon: Icons.list_alt_outlined 
  ),

  MenuItem(
    title: 'Theme Chaged',
    subtitle: 'Chaged of the theme',
    link: '/theme-chaged',
    icon: Icons.color_lens_outlined 
  ),

];