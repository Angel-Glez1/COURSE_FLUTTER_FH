import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar  = SnackBar(
      content: const Text('This is a snakcbar'),
      action: SnackBarAction(label: 'Ok!', onPressed:() {}, ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas Seguro ?'),
        content: const  Text('Duis elit non ullamco minim officia nulla aliquip dolor culpa ea Lorem.'),
        actions: [

          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => context.pop(),
          ),

          FilledButton.icon(
            label: const Text('Borrar'),
            icon: const  Icon(Icons.delete_forever_outlined),
            onPressed: () => context.pop(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialog'),
      ),
      
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Duis elit non ullamco minim officia nulla aliquip dolor culpa ea Lorem.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            
            FilledButton(
              onPressed: () => openDialog(context), 
              child: const Text('Mostar Dialogs')
            ),

          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context),
      ),
    );
  }
}
