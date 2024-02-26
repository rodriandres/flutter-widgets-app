import 'package:flutter/material.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Laborum mollit sit sunt ad.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Non sunt duis mollit do tempor veniam aliqua. Veniam cupidais est nisi excepteur quis magna.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Adipisicing reprehenderit elit llit id irure non aliqua magna officia. Cillum magna fugiat eiusmo cillum minim. Enim  ea.', 'assets/images/3.png'),

];

class AppTutorialScreen extends StatelessWidget {

  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides.map(
          (slideData) => _Slide(
            title: slideData.title,
            caption: slideData.caption,
            imageUrl: slideData.imageUrl,
        )).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}