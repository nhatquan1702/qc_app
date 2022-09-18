import 'package:chat_app/mvvm/view/screen/profile/edit_profile_menu_item.dart';
import 'package:chat_app/mvvm/view/screen/profile/edit_profile_top.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Scaffold(
      backgroundColor: appColor.cardColor.withOpacity(0.9),
      appBar: AppBar(
        elevation: 0.2,
        shadowColor: Theme.of(context).canvasColor,
        backgroundColor: appColor.cardColor.withOpacity(0.9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appColor.primaryColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: appColor.primaryColor,),
          ),
        ],
        title: Text('Nhật Quang', style: TextStyle(color: appColor.primaryColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Cập nhật ảnh đại diện",
              icon: Icons.image_outlined,
              press: () => {},
            ),
            ProfileMenu(
              text: "Cập nhật ảnh bìa",
              icon: Icons.image_aspect_ratio,
              press: () => {},
            ),
            ProfileMenu(
              text: "Cập nhật tên",
              icon: Icons.drive_file_rename_outline,
              press: () => {},
            ),
            ProfileMenu(
              text: "Cập nhật số điện thoại",
              icon: Icons.phone,
              press: () {},
            ),
            ProfileMenu(
              text: "Cập nhật giới thiệu bản thân",
              icon: Icons.person,
              press: () {},
            ),
            ProfileMenu(
              text: "Đăng xuất",
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
