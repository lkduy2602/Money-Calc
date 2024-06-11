import 'package:flutter/material.dart';
import 'package:money_calc/_common/widgets/navigation_item.widget.dart';

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
                    child: NavigationItemWidget(
                        iconData: Icons.category,
                        title: Text(
                          'Quản lý DANH MỤC',
                          style: TextStyle(
                              color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                        )),
                  )),
              const SizedBox(height: 1.0),
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: NavigationItemWidget(
                        iconData: Icons.inventory_2,
                        title: Text(
                          'Quản lý SẢN PHẨM',
                          style: TextStyle(
                              color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                        )),
                  )),
              const SizedBox(height: 1.0),
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: NavigationItemWidget(
                        iconData: Icons.paid,
                        title: Text(
                          'Quản lý LOẠI CHI',
                          style: TextStyle(
                              color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
