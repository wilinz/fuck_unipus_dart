import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/services/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetStorage();
  runApp(const FuckUnipusApp());
}

class FuckUnipusApp extends StatelessWidget {
  const FuckUnipusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fuck Unipus',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
