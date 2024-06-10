import 'package:flutter/material.dart';
import 'package:money_calc/_common/helpers/shared_preferences.helper.dart';

class ProfileHeaderWidget extends StatefulWidget {
  const ProfileHeaderWidget({super.key});

  @override
  State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  String userName = '';
  String userAvatar = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final [getUserName, getUserAvatar] =
        await Future.wait<String>([SharedPreferencesHelper.getUserName(), SharedPreferencesHelper.getUserAvatar()]);

    setState(() {
      userName = getUserName;
      userAvatar = getUserAvatar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
        padding: const EdgeInsets.only(right: 20.0, top: 10.0, left: 20.0, bottom: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 68.0, color: Colors.grey.shade500),
                const SizedBox(width: 10.0),
                Text(
                  userName,
                  style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w700, height: 0),
                )
              ],
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50.0),
              child: Icon(Icons.settings, size: 30.0, color: Colors.grey.shade600),
            )
          ],
        ));
  }
}
