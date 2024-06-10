import 'package:flutter/material.dart';
import 'package:money_calc/explore/widgets/navigation_drawer.widget.dart';
import 'package:money_calc/explore/widgets/profile_header.widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: const Column(
          children: [ProfileHeaderWidget(), NavigationDrawerWidget()],
        ));
  }
}
