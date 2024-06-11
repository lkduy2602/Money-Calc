import 'package:flutter/material.dart';
import 'package:money_calc/_common/providers/order_item.provider.dart';
import 'package:money_calc/app.router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => OrderItemProvider()),
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.grey.shade50),
        debugShowCheckedModeBanner: false);
  }
}
