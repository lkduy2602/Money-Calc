import 'package:flutter/material.dart';

class NavigationItemWidget extends StatelessWidget {
  const NavigationItemWidget(
      {super.key, required this.iconData, required this.title, this.content = '', this.rightButton});

  final IconData iconData;
  final Text title;
  final String content;
  final Widget? rightButton;

  @override
  Widget build(BuildContext context) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    Text(
                      content,
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w400, height: 0),
                    )
                  ],
                )
              ],
            ),
            rightButton ?? Icon(Icons.chevron_right, color: Colors.grey.shade600),
          ],
        ));
  }
}
