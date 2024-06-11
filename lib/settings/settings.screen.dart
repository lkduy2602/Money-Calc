import 'package:flutter/material.dart';
import 'package:money_calc/_common/widgets/common_app_bar.widget.dart';
import 'package:money_calc/_common/widgets/navigation_item.widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget('Thiết lập tài khoản'),
      body: SafeArea(
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
                        iconData: Icons.person,
                        title: Text(
                          'Cập nhật thông tin',
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
                      iconData: Icons.language,
                      title: Text(
                        'Ngôn ngữ',
                        style: TextStyle(
                            color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                      ),
                      content: 'Tiếng việt',
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 10.0),
          Column(
            children: [
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: NavigationItemWidget(
                        iconData: Icons.report,
                        title: Text(
                          'Thông báo lỗi',
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
                      iconData: Icons.favorite,
                      title: Text(
                        'Đánh giá ứng dụng',
                        style: TextStyle(
                            color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                      ),
                      content: 'Chia sẻ trải nghiệm của bạn với ứng dụng!',
                    ),
                  )),
              const SizedBox(height: 1.0),
              Ink(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: NavigationItemWidget(
                      iconData: Icons.info,
                      title: Text(
                        'Thông tin ứng dụng',
                        style: TextStyle(
                            color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w400, height: 0),
                      ),
                      content: 'Phiên bản: 1.0.0',
                    ),
                  )),
            ],
          ),
        ],
      )),
    );
  }
}
