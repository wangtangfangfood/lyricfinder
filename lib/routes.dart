import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:lyric_finder/features/lyricfinder/presentation/lyricfinder_display_ui.dart';
import 'package:lyric_finder/home_page.dart';

import 'features/lyricfinder/presentation/lyricfinder_ui.dart';

enum Routes { lyricFinder, lyricDisplay }

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.lyricFinder,
      path: '/',
      builder: (context, state) => LyricFinderUI(),
      routes: [
        AppRoute(
          name: Routes.lyricDisplay,
          path: 'lyricDisplay',
          builder: (context, state) => LyricFinderDisplayUI(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Page404(error: state.error),
);

class Page404 extends StatelessWidget {
  const Page404({Key? key, required this.error}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}
