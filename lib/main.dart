import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/routing/app_router.dart';
import 'package:note_app/firebase_options.dart';
import 'package:note_app/note_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    NoteApp(
      appRouter: AppRouter(),
    ),
  );
}
