// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppbarWidget({super.key, required this.title, this.isLeading = true});
  String title;
  bool isLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeading ?  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/menu.png',height: 20,),
      ) : const SizedBox(),
      title: Text(title),
      centerTitle: false,
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/notification-bell.png',height: 25,),
      )],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
