import 'package:flutter/material.dart';
import 'package:hadith_40/router/app_router.dart';

void main() {
  final appRouter = AppRouter();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '40 хадисов',
      theme: ThemeData(primarySwatch: Colors.grey),
      onGenerateRoute: appRouter.onGenerateRouter,
      initialRoute: '/',
    ),
  );
}
