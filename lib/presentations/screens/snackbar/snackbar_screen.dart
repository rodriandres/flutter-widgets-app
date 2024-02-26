import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hey world'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  void openDialog( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Sit sint eu mollit irure est qui mollit amet do veniam. Do laborum tempor ea adipisicing officia. Qui dolore dolore velit tempor dolore ex nostrud. Ut culpa consectetur labore dolor ea magna nostrud labore duis ut laboris do fugiat est. Exercitation ipsum consequat dolor cillum anim amet pariatur aliquip veniam. Aliqua labore sint eu aliquip aute ad consectetur. Excepteur commodo laboris mollit fugiat aliqua proident dolore eu cupidatat ullamco nostrud excepteur.'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancelar')
          ),

          FilledButton(
            onPressed: () {
              context.pop();

            },
            child: const Text('Aceptar')
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ullamco voluptate amet adipisicing dolor ea excepteur non nisi in eiusmod anim. Nulla eu voluptate commodo sint velit ea qui sint do velit ipsum dolor mollit sint. Pariatur ut laboris eu excepteur dolor dolore ex proident labore voluptate amet esse consequat sint. Exercitation nisi anim cupidatat nisi officia aliqua magna nostrud pariatur veniam aute. Laboris ex proident officia irure dolore enim eiusmod elit.')
                  ]
                );
              },
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              },
              child: const Text('Mostrar dialogo')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}