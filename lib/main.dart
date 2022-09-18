import 'package:chat_app/constant/theme.dart';
import 'package:chat_app/mvvm/view/screen/home/provider/home_tab_provider.dart';
import 'package:chat_app/mvvm/view/screen/home/provider/picker_img_provider.dart';
import 'package:chat_app/mvvm/view/screen/others/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedHomeTapProvider()),
        ChangeNotifierProvider(create: (_) => PickerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      home: const StartScreen(),
    );
  }
}

