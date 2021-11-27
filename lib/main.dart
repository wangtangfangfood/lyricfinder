import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:lyric_finder/providers.dart';
import 'package:lyric_finder/routes.dart';

void main() {
  loadProviders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      onBuild: (context, _) {
        providersContext().read(featureStatesProvider.featuresMap).load({
          'features': [
            {'name': 'last_login', 'state': 'ACTIVE'},
          ]
        });
      },
      child: MaterialApp.router(
        routeInformationParser: router.informationParser,
        routerDelegate: router.delegate,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
