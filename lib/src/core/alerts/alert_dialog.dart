import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<bool> alertConfirme({
  required String titulo,
  required String descricao,
}) async {
  bool confirm = false;

  await showDialog(
    context: Modular.routerDelegate.navigatorKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(descricao),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () {
                confirm = true;
                Navigator.pop(context);
              },
              child: const Text("Confirmar"))
        ],
      );
    },
  );

  return confirm;
}

Future<void> alertMessage(String description,
    {String buttonText = 'Ok', VoidCallback? onPressed}) async {
  await showDialog(
      context: Modular.routerDelegate.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black,
                      wordSpacing: 1)),
            ),
          ),
          actions: [
            Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(buttonText),
                  onPressed: () async {
                    if (onPressed != null) {
                      onPressed();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ))
          ],
        );
      });
}
