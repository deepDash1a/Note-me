import 'package:flutter/material.dart';
import 'package:note_app/core/routing/app_router.dart';
import 'package:note_app/core/routing/routes.dart';

class NoteApp extends StatelessWidget {
  NoteApp({
    super.key,
    required this.appRouter,
  });

  AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 10.00,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
