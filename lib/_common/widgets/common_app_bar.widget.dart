import 'package:flutter/material.dart';

class CommonAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBarWidget(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Colors.green.shade600),
      title: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.green.shade600,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
