import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'core/themes.dart';
import 'db/hive_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Open a box
  await Hive.openBox(DB.openproductBox);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: const ToastificationConfig(alignment: Alignment.bottomCenter),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
      ),
    );
  }
}
