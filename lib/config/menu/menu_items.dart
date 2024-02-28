import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;


  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });



}

const appMenuItems = <MenuItem> [
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),

  
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),

  MenuItem(
    title: 'Snackbars and Dialogs',
    subTitle: 'Indicadores de pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: 'Animated conteiner',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.animation_rounded,
  ),

  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.important_devices_outlined,
  ),

  MenuItem(
    title: 'Introducción a la Aplicación',
    subTitle: 'Tutorial de nuestra aplicación',
    link: '/tutorial',
    icon: Icons.travel_explore_outlined,
  ),

  MenuItem(
    title: 'InfiniteScroll and Pull',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.system_security_update_rounded,
  ),

  MenuItem(
    title: 'Counter with context',
    subTitle: 'Manejo de estados con riverpod',
    link: '/counter',
    icon: Icons.countertops,
  ),

  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Manejo de tema general de la aplicacion',
    link: '/theme-changer',
    icon: Icons.color_lens,
  ),
  
];