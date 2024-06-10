import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  bool _isNavigating = false;
  void goToScreen(
    String routeName,
  ) {
    if (_isNavigating) return;

    setState(() => _isNavigating = true);
  }

  Padding generateNavigationItem(IconData iconData, String text) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(iconData, color: Colors.grey.shade600),
                const SizedBox(width: 10.0),
                Text(
                  text,
                  style: TextStyle(color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                )
              ],
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade600),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 10.0),
          Column(
            children: [
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: generateNavigationItem(Icons.category, 'Quản lý DANH MỤC'),
                  )),
              const SizedBox(height: 1.0),
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: generateNavigationItem(Icons.inventory_2, 'Quản lý SẢN PHẨM'),
                  )),
              const SizedBox(height: 1.0),
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: generateNavigationItem(Icons.paid, 'Quản lý LOẠI CHI'),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
