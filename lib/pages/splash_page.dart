import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _initialize() async {
    // Effectuez vos initialisations asynchrones ici
    await Future.delayed(
        Duration(seconds: 5)); // Exemple de délai de 2 secondes

    // Appeler la fonction de rappel une fois les initialisations terminées
    widget.onInitializationComplete();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinoch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
          child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/logo.png"))),
      )),
    );
  }
}
