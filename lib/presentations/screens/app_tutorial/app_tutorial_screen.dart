import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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

class AppTutorialScreen extends StatefulWidget {

  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;
  
  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() { 
      final page = pageViewController.page ?? 0;

      if ( !endReached && page >= (slides.length - 1.5) ) {
        setState(() {
          endReached = true;
        });
      };
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
      // appBar: AppBar(
      //   title: const Text('Tutorial'),
      // ),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl,
            )).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ?
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  child: const Text('Comenzar'),
                  onPressed: () => context.pop(),
                ),
              )
            )
            : const SizedBox(),
        ]
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            Image(image: AssetImage( imageUrl )),
            const SizedBox(height: 20,),
            Text( title, style:  titleStyle ),
            const SizedBox(height: 10,),
            Text( caption, style: captionStyle )
          ],
        ),
      ),
    );
  }
}