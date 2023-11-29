import 'dart:convert';

//Package
import 'package:film_connection/models/app_config.dart';
import 'package:film_connection/services/http_service.dart';
import 'package:film_connection/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get_it/get_it.dart';

// model

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
    await Future.delayed(Duration(seconds: 5)).then(
        (_) => _setup(context).then((_) => widget.onInitializationComplete()));

    // Exemple de délai de 2 secondes

    // Appeler la fonction de rappel une fois les initialisations terminées
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
        API_KEY: configData['API_KEY'],
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL']));

    getIt.registerSingleton<HTTPService>(HTTPService(getIt.get<AppConfig>()));
    getIt.registerSingleton<MovieService>(MovieService());
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
