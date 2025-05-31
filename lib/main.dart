import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/app.dart';
import 'package:sticker_swap_app/src/app_module.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  runApp(ModularApp(module: AppModule(), child: App(),));
}