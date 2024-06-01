import 'package:basics/DI.dart';
import 'package:basics/Domain/value_objects/colors.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:basics/app_routing.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setUrlStrategy(PathUrlStrategy());
  configureDependencies();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorage.webStorageDirectory,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyInjection(
      inputWidget: MaterialApp.router(
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
        title: 'My-Place',
        theme: ThemeData(
            //colorScheme: ColorScheme.fromSeed(seedColor: myOrange),
            useMaterial3: true,
            fontFamily: GoogleFonts.montserrat().fontFamily),
      ),
    );
  }
}
