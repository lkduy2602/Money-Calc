import 'package:flutter/material.dart';
import 'package:money_calc/_common/providers/order_item.providers.dart';
import 'package:money_calc/calculator/calculator.screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => OrderItemProvider()),
    ], child: const MainApp()),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.grey.shade50),
        home: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: [
                  const CalculatorScreen(),
                  const CalculatorScreen(),
                  const CalculatorScreen(),
                  const CalculatorScreen()
                ][_selectedIndex],
              ),
            ),
            bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.calculate,
                        ),
                        label: 'Máy tính',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.history,
                        ),
                        label: 'Lịch sử',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.analytics,
                        ),
                        label: 'Tổng quan',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Tôi',
                      ),
                    ],
                    onTap: _onItemTapped,
                    currentIndex: _selectedIndex,
                    iconSize: 18.0,
                    selectedItemColor: Colors.orange.shade400,
                    unselectedItemColor: Colors.grey.shade600,
                    showUnselectedLabels: true,
                  ),
                ))),
        debugShowCheckedModeBanner: true);
  }
}
